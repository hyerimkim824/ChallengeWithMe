// 페이지 로드 시 자동으로 타이머 시작
$(document).ready(function() {
    watchStartTime(); // 서버에서 st_time을 받아오고 타이머를 시작합니다.
});

function watchStartTime() {
    $.ajax({
        url: 'pvChallengTimer.do',  // 서버에서 st_time 값을 받아오기 위한 URL
        type: 'GET',  // GET 요청
        dataType: 'json',  // 응답 형식은 JSON
        success: function(response) {
            console.log('서버에서 받은 응답: ', response);

            // st_time이 제대로 들어왔는지 확인
            if (response.st_time) {
                const startTime = response.st_time;
                console.log('서버에서 받은 startTime: ' + startTime);
                startTimer();  // 타이머 시작
            } else {
                console.error('서버에서 st_time을 받지 못했습니다.');
                alert('서버에서 startTime을 받아오지 못했습니다. 다시 시도해주세요.');
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', error);
            alert('서버와의 통신에 실패했습니다.');
        }
    });
}

function startTimer() {
    const countdownTime = 10 * 60; // 10분 = 600초
    let remainingTime = countdownTime;
    const display = document.getElementById("timerDisplay");
    const status = document.getElementById("status");
    const modifyButton = document.getElementById("modifyButton");

    status.innerHTML = "타이머 시작!"; // 타이머 상태 업데이트

    // 타이머 시작 인터벌
    const interval = setInterval(function () {
        const minutes = Math.floor(remainingTime / 60);
        const seconds = remainingTime % 60;

        // 타이머 화면에 표시 (형식: MM:SS)
        display.innerHTML = `${minutes.toString().padStart(2, "0")}:${seconds.toString().padStart(2, "0")}`;

        remainingTime--;

        // 타이머 종료 조건 확인
        if (remainingTime < 0) {
            clearInterval(interval); // 타이머 종료
            display.innerHTML = "타이머 종료!";
            status.innerHTML = "시간 내 인증을 실패했습니다."; // 타이머 종료 상태 업데이트
            modifyButton.disabled = true; // 타이머 종료 후 버튼 비활성화
        }
    }, 1000); // 1초마다 업데이트

    // 수정 버튼 클릭 이벤트 설정 (타이머가 끝나지 않은 경우에만)
    $("#photo_submit").on("click", function () {
        if (remainingTime > 0) {
            $.ajax({
                url: "pvChallengeWritingGet.do",
                type: "post",
                dataType: 'json',
                success: function(param) {
                    let modifyUI = "";
					
                    if (param.result === "success") {
                       
                        modifyUI= "인증 성공했습니다!!!!";
						
						clearInterval(interval); // 타이머 종료
						display.innerHTML = "타이머 종료!";
						modifyButton.disabled = true;
						
						$('.wise_success').append(modifyUI);
						
						
						
                    } else if (param.result === "fail") {
                        modifyUI = "문구를 잘못입력 했습니다. 다시 입력해 주세요";
						$(".wise_success").append(modifyUI);
                    }else if(remainingTime < 0){
						modifyUI = "시간 내에 인증을 실패했습니다.";
						$(".wise_success").append(modifyUI);
					}

                   
					
					},
                error: function (xhr, status, error) {
                    console.error("AJAX 요청 실패:", error);
                },
            });
        } else {
            alert("타이머가 종료되었습니다. 더 이상 인증을 수정할 수 없습니다.");
        }
    });
}