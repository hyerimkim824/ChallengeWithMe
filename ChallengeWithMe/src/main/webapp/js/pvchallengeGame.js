const wheel = document.getElementById('wheel');
const segments = ["A", "B", "C", "D", "E", "F"];
const numSegments = segments.length;
const anglePerSegment = 360 / numSegments;

let currentDegree = 0; // 현재 각도

// 돌림판에 세그먼트 생성
segments.forEach((segment, index) => {
    const segmentDiv = document.createElement('div');
    segmentDiv.classList.add('segment');
    segmentDiv.style.transform = `rotate(${anglePerSegment * index}deg)`;
    segmentDiv.textContent = segment;
    wheel.appendChild(segmentDiv);
});

// 돌림판 회전 함수
function spinWheel() {
    const spinDuration = 4; // 회전 시간 (초)
    const randomDeg = Math.floor(Math.random() * 360) + 3600; // 360도 이상 회전 (최소 10번 회전)

    // 회전 애니메이션
    wheel.style.transition = `transform ${spinDuration}s ease-out`;
    wheel.style.transform = `rotate(${randomDeg}deg)`;

    // 회전 후 결과 계산
    setTimeout(() => {
        currentDegree = randomDeg % 360; // 최종 각도 계산
        const segmentIndex = Math.floor((currentDegree + 180) / anglePerSegment) % numSegments; // 현재 위치한 세그먼트 계산
        const result = segments[segmentIndex];
        
        alert(`돌림판 결과: ${result}`); // 결과 알림
    }, spinDuration * 1000); // 회전 시간 후에 결과를 계산
}