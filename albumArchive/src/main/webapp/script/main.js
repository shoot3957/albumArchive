document.addEventListener("DOMContentLoaded", () => {
    const searchQuery = document.getElementById("searchQuery");
    const searchResults = document.getElementById("searchResults");

    // 입력한 값을 기준으로 비동기 검색 처리
    searchQuery.addEventListener("keyup", async (event) => {
        const query = event.target.value.trim();

        // 입력이 없으면 드롭다운을 숨깁니다.
        if (query.length === 0) {
            searchResults.style.display = "none";
            return;
        }

        // 검색어로 서버에 비동기 요청을 보냄
        const data = await searchAlbumForDropdown(query);

        // 드롭다운 리스트를 업데이트
        searchResults.innerHTML = "";

        if (data.length === 0) {
            searchResults.style.display = "none";
            return;
        }

        // 결과를 드롭다운에 표시
        data.forEach((album) => {
            const resultItem = document.createElement("div");
            resultItem.classList.add("dropdown-item");
            resultItem.innerHTML = `<p>${album.name}</p>`;
            resultItem.addEventListener("click", () => {
                searchQuery.value = album.name;  // 클릭한 앨범 이름을 검색창에 표시
                searchResults.style.display = "none"; // 드롭다운 숨기기
            });
            searchResults.appendChild(resultItem);
        });

        searchResults.style.display = "block"; // 드롭다운 표시
    });
});

// 비동기적으로 연관 검색어 요청을 보내는 함수
async function searchAlbumForDropdown(query) {
    const response = await fetch(`/albumArchive/searchAlbumForDropdown.do?query=${encodeURIComponent(query)}`);
    if (!response.ok) {
        console.error("검색 요청 실패");
        return [];
    }
    const data = await response.json();
    return data; // 서버에서 반환한 검색 결과
}
