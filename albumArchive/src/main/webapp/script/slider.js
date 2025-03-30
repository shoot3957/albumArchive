document.addEventListener("DOMContentLoaded", function () {
    const albums = document.querySelectorAll(".album-fade .fade-album");
    let current = 0;

    function showNextAlbum() {
        albums[current].classList.remove("active");
        current = (current + 1) % albums.length;
        albums[current].classList.add("active");
    }

    setInterval(showNextAlbum, 3000); // 3초마다 앨범 바꾸기
});
