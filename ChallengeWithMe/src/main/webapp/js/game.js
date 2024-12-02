$(document).ready(function () {
    const $gameArea = $('#game-area');
    const $scoreBoard = $('#score');
    const $startBtn = $('#start-btn');
    const $submitBtn = $('.submit-btn'); // 제출 버튼
	
    const $player = $('<div class="player"><img src="../images/bird.png" alt="Player" width="100%" height="100%"></div>');
    let score = 0;
    let maxScore = 0; // 최고 점수
    let playerX;
    const arrows = [];
    let gameInterval, arrowInterval;
    let facingLeft = true; // 플레이어가 왼쪽을 바라보는 상태 (초기값)


    // 게임 초기화 함수
    function initGame() {
        $player.css({
            left: '50%',
            bottom: '5%',
            transform: 'translateX(-50%)',
        });
        $gameArea.append($player);
        score = 0;
        maxScore = 0; // 초기화
        $scoreBoard.text(`Score: ${score}`);
        arrows.forEach(($arrow) => $arrow.remove());
        arrows.length = 0;
    }

    // 화살 추가 함수
    function addArrow() {
        const $arrow = $('<div class="arrow"><img src="../images/arrow.png" alt="Arrow" width="100%" height="100%"></div>');
        const arrowLeft = Math.random() * ($gameArea.width() - $arrow.width());
        $arrow.css({
            left: arrowLeft + 'px',
            top: '0px',
        });
        $gameArea.append($arrow);
        arrows.push($arrow);
    }

    // 화살 이동 함수
    function moveArrows() {
        for (let i = arrows.length - 1; i >= 0; i--) {
            const $arrow = arrows[i];
            const arrowTop = parseFloat($arrow.css('top'));
            if (arrowTop > $gameArea.height()) {
                $arrow.remove();
                arrows.splice(i, 1);
                score++;
                maxScore = Math.max(maxScore, score); // 최고 점수 갱신
                $scoreBoard.text(`Score: ${score}`);
            } else {
                $arrow.css('top', arrowTop + 5 + 'px'); // 화살 속도
            }
        }
    }

    // 충돌 감지 함수
    function checkCollision() {
        const playerRect = $player[0].getBoundingClientRect();
        for (const $arrow of arrows) {
            const arrowRect = $arrow[0].getBoundingClientRect();
            if (
                arrowRect.left < playerRect.right &&
                arrowRect.right > playerRect.left &&
                arrowRect.top < playerRect.bottom &&
                arrowRect.bottom > playerRect.top
            ) {
                stopGame();
				if(maxScore <= score){
					maxScore = score;
				}
                alert(`Game Over!! 이번 시도:${score} | 최고 점수: ${maxScore}`);
                $startBtn.show(); // 게임 종료 후 시작 버튼 표시
            }
        }
    }

    // 플레이어 이동 함수
    $(document).on('keydown', function (event) {
        if (event.key === 'ArrowLeft' && playerX > 0) {
            playerX -= 20;
            if (!facingLeft) {
                $player.css('transform', 'scaleX(1)'); // 왼쪽 바라보는 상태
                facingLeft = true;
            }
        } else if (event.key === 'ArrowRight' && playerX < $gameArea.width() - $player.width()) {
            playerX += 20;
            if (facingLeft) {
                $player.css('transform', 'scaleX(-1)'); // 오른쪽으로 반전
                facingLeft = false;
            }
        }
        $player.css('left', playerX + 'px');
    });

    // 게임 시작 함수
    function startGame() {
        $startBtn.hide(); // 시작 버튼 숨기기
        initGame();
        playerX = $gameArea.width() / 2; // 초기 플레이어 위치
        gameInterval = setInterval(() => {
            moveArrows();
            checkCollision();
        }, 50);
        arrowInterval = setInterval(addArrow, 500);
    }

    // 게임 정지 함수
    function stopGame() {
        clearInterval(gameInterval);
        clearInterval(arrowInterval);
    }

    // 점수 제출 버튼 클릭 이벤트
    $submitBtn.on('click', function () {
		
		console.log("is clicked");
		if (maxScore > 30) {
			location.href = '../challenge/gameConfirm.do?confirmed=1';
		} else {
			alert('최고 점수가 30점 이상이면 인증이 가능합니다!');
		}
    });
	
	$('#submit-btn2').on('click', function () {
	    let isCorrect = true; // 모든 값이 일치하는지 확인하기 위한 플래그

	    $('.asw-input').each(function (index) {
	        const userAnswer = $(this).val(); // 사용자 입력 값
	        const correctAnswer = $(`#answer${index}`).val(); // 정답 값

	        // 값이 일치하지 않으면 isCorrect를 false로 설정
	        if (userAnswer.trim() === '' || parseInt(userAnswer) !== parseInt(correctAnswer)) {
	            isCorrect = false;
	            return false; // jQuery each에서 반복 중단
	        }
	    });

	    // 결과에 따라 동작
	    if (isCorrect) {
	        location.href = '../challenge/successPage.do'; // 성공 시 이동
	    } else {
	        alert('모든 답이 일치해야 제출할 수 있습니다!');
	    }
	});
	
    // 시작 버튼 클릭 이벤트
    $startBtn.on('click', startGame);
	
/*-------------------------------------------------------------------------------------------------------*/

	$('#game1').click(function(){
		location.href='../challenge/challengeGame.do?game_num=1';
	});
	$('#game2').click(function(){
		location.href='../challenge/challengeGame.do?game_num=2';
	});
});