<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ include file="../parts/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 정보 - ${album.name}</title>
<style>
.container {
	display: flex;
	margin: 20px;
}

.album-cover {
	flex: 1;
}

.album-details {
	flex: 2;
	margin-left: 20px;
}

.btn {
	margin-right: 10px;
	padding: 5px 10px;
}

.footer-note {
	font-size: 0.8em;
	color: gray;
}

#trackList ul {
	list-style: none;
	padding: 0;
}

#trackList li {
	margin: 10px 0;
}
</style>
</head>
<body>
	<h1>앨범 정보</h1>

	<c:choose>
		<c:when test="${empty album}">
			<p>앨범 데이터를 불러오지 못했습니다.</p>
		</c:when>
		<c:otherwise>
			<form action="" method="post">
				<div class="container">
					<div class="album-cover">
						<c:if test="${not empty album.img}">
							<img src="./${album.img}" alt="Album Cover"
								style="width: 50%; height: 50%;">
						</c:if>
					</div>
					<div class="album-details">
						<div class="album-title">${album.name}</div>
						<div class="price-info">
							<span style="color: red;">가격: ${album.price}원</span>
						</div>
						<div class="release-info">발매일: ${album.dates}</div>
						<div class="likes-info">좋아요: ${album.likes}</div>
						<div class="buttons">
							<button type="button" class="btn btn-like">좋아요</button>
							<button type="button" class="btn btn-cart">장바구니</button>
							<button type="button" class="btn btn-buy">구매</button>
						</div>
					</div>
				</div>
			</form>

			<div id="trackList">
				<ul>
					<c:forEach var="song" items="${song}">
						<li>곡 제목 : ${song.name}</li>
					</c:forEach>
				</ul>
			</div>

			<div class="footer-note">* 사진은 실제 상품과 다를 수 있습니다. 품질 보증:
				KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내</div>

			<input id="albumId" type="hidden"
				value="${album['id'] != null ? album['id'] : ''}">
			<input id="artistId" type="hidden" value="${album.artistId}">
		</c:otherwise>
	</c:choose>
	<!-- 
<script>
let accessToken = null;
const trackListDiv = document.querySelector('#trackList');

async function getTokenInfo() {
    const url = "https://accounts.spotify.com/api/token";
    try {
        const response = await fetch(url, {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams({
                grant_type: "client_credentials",
                client_id: "d5517918022d4e7a8abdabda23d9da2c",
                client_secret: "bb4754dac36148d2916e1468ad9804ce"
            })
        });
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error("토큰 발급 실패: " + response.status + " - " + errorText);
        }
        const data = await response.json();
        accessToken = data.access_token;
        console.log("Token acquired successfully:", accessToken);
        if (!accessToken) {
            throw new Error("액세스 토큰을 가져오지 못했습니다.");
        }
        await getAlbumTracks();
    } catch (error) {
        console.error("Token error:", error);
        trackListDiv.innerHTML = `<p>토큰 오류: ${error.message}</p>`;
    }
}

async function getAlbumTracks() {
    const albumId = document.querySelector('#albumId')?.value || '';
    console.log("albumId from input:", albumId);
    if (!albumId) {
        trackListDiv.innerHTML = "<p>앨범 ID가 제공되지 않았습니다.</p>";
        console.error("No albumId found");
        return;
    }

    console.log("accessToken before URL:", accessToken);
    // 템플릿 리터럴 대신 직접 조합
    const tracksUrl = "https://api.spotify.com/v1/albums/" + albumId + "/tracks";
    console.log("Fetching tracks for albumId:", albumId);
    console.log("Constructed URL:", tracksUrl);

    try {
        console.log("accessToken before check:", accessToken);
        if (!accessToken || typeof accessToken !== "string" || accessToken.trim() === "") {
            throw new Error("유효한 액세스 토큰이 없습니다.");
        }

        // 템플릿 리터럴 대신 직접 조합
        const requestHeaders = {
            "Authorization": "Bearer " + accessToken.trim(),
            "Accept": "application/json"
        };
        console.log("Request headers just before fetch:", requestHeaders);

        const response = await fetch(tracksUrl, {
            method: "GET",
            headers: requestHeaders
        });
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error("트랙 목록 가져오기 실패: " + response.status + " - " + errorText);
        }
        const tracksData = await response.json();
        console.log("Tracks data:", tracksData);

        let tracksHtml = '<h3>수록곡 목록</h3><ul>';
        tracksData.items.forEach((track, index) => {
            const durationSeconds = Math.floor(track.duration_ms / 1000);
            const minutes = Math.floor(durationSeconds / 60);
            const seconds = durationSeconds % 60;
            const durationFormatted = minutes + ":" + seconds.toString().padStart(2, '0');
            const artists = track.artists.map(artist => artist.name).join(', ');

            tracksHtml += '<li>' + 
                (index + 1) + '. ' + track.name + 
                '<br>길이: ' + durationFormatted + 
                '<br>아티스트: ' + artists + 
                '</li>';
        });
        tracksHtml += '</ul>';
        trackListDiv.innerHTML = tracksHtml;
    } catch (error) {
        console.error("Tracks error:", error);
        trackListDiv.innerHTML = '<p>수록곡 목록을 가져오지 못했습니다: ' + error.message + '</p>';
    }
}

window.onload = getTokenInfo;
</script> -->
	<%@ include file="../parts/footer.jsp"%>
</body>
</html>