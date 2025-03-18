document.addEventListener("DOMContentLoaded", function() {
    const slider = document.querySelector(".slider");
    const slides = slider.querySelectorAll("img");
    const totalSlides = slides.length;
    let currentSlide = 0;
    const intervalTime = 3000; // 3초마다 슬라이드 이동

    // 슬라이드 이동 함수
    function autoSlide() {
        // 현재 슬라이드를 숨기고, 다음 슬라이드를 보이게 한다
        slides[currentSlide].style.display = "none";
        
        // 다음 슬라이드 계산
        currentSlide = (currentSlide + 1) % totalSlides;

        // 새로운 슬라이드를 보이게 한다
        slides[currentSlide].style.display = "block";
    }

    // 초기 상태 설정: 첫 번째 슬라이드를 보이게 하고 나머지는 숨긴다
    slides.forEach((slide, index) => {
        if (index !== currentSlide) {
            slide.style.display = "none";
        } else {
            slide.style.display = "block";
        }
    });

    // 자동 슬라이드 실행 (3초마다)
    setInterval(autoSlide, intervalTime);
});
