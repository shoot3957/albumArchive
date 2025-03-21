let accessToken = null;

document.addEventListener('DOMContentLoaded', () => {
    // 요소 선택
    msg = document.querySelector('.albumInfo') || document.querySelector('#searchResults');
    const searchBtn = document.querySelector('#searchBtn');
    const getPostMaloneBtn = document.querySelector('#getPostMaloneBtn');

    if (!msg) {
        console.error("Required elements not found");
        return;
    }

    // 버튼 이벤트 리스너 추가
    if (searchBtn) {
        searchBtn.addEventListener('click', searchAlbums);
    } else {
        console.error("Search button not found");
    }

    if (getPostMaloneBtn) {
        getPostMaloneBtn.addEventListener('click', getTokenInfo);
    } else {
        console.error("Post Malone button not found");
    }

    // 페이지 로드 시 토큰 발급 (선택적, 주석 처리됨)
     getTokenInfo();
});

async function getTokenInfo() {
	const url = `https://accounts.spotify.com/api/token`;

	try {
		const response = await fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams({
				grant_type: "client_credentials",
				client_id: "d5517918022d4e7a8abdabda23d9da2c", // 클라이언트 ID (보안을 위해 서버로 이동 권장)
				client_secret: "bb4754dac36148d2916e1468ad9804ce" // 클라이언트 시크릿 (보안을 위해 서버로 이동 권장)
			})
		});

		if (!response.ok) {
			const errorText = await response.text();
			throw new Error(`토큰 정보 가져오기 실패: ${response.status} - ${errorText}`);
		}

		const data = await response.json();
		console.log("토큰 정보:", data);
		accessToken = data.access_token;

		if (!accessToken) {
			throw new Error("accessToken이 설정되지 않았습니다.");
		}

		await getAlbumInfo();
	} catch (error) {
		console.error("토큰 발급 중 에러 발생:", error.message);
		if (msg) {
			msg.innerHTML = `<p>토큰 발급 실패: ${error.message}</p>`;
		}
	}
}