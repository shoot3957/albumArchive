<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>앨범 정보 - ${album.name}</title>
    <style>
        .container { display: flex; margin: 20px; }
        .album-cover { flex: 1; }
        .album-details { flex: 2; margin-left: 20px; }
        .btn { margin-right: 10px; padding: 5px 10px; }
        .footer-note { font-size: 0.8em; color: gray; }
        li { margin: 10px 0; }
    </style>
</head>
<body>
<%@ include file="../parts/header.jsp"%>

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
                        <img src="${album.img}" alt="Album Cover" style="width: 50%; height: 50%;">
                    </c:if>
                </div>
                <div class="album-details">
                    <div class="album-title">${album.name}</div>
                    <div class="price-info"><span style="color: red;">가격: ${album.price}원</span></div>
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

        <!-- 수록곡 목록 -->
        <div id="trackList">
            <h3>수록곡 목록 로딩 중...</h3>
        </div>

        <div class="footer-note">
            * 사진은 실제 상품과 다를 수 있습니다. 품질 보증: KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내
        </div>

        <input id="albumId" type="hidden" value="${album.albumId}">
        <input id="artistId" type="hidden" value="${album.artistId}">
    </c:otherwise>
</c:choose>

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
        console.log("Token acquired:", accessToken);
        await getAlbumTracks();
    } catch (error) {
        console.error("Token error:", error);
        trackListDiv.innerHTML = `<p>오류: ${error.message}</p>`;
    }
}

async function getAlbumTracks() {
    const albumId = document.querySelector('#albumId')?.value;
    if (!albumId) {
        trackListDiv.innerHTML = "<p>앨범 ID가 제공되지 않았습니다.</p>";
        console.error("No albumId found");
        return;
    }
    console.log("Fetching tracks for albumId:", albumId);
    const tracksUrl = `https://api.spotify.com/v1/albums/${albumId}/tracks`;

    try {
        if (!accessToken) await getTokenInfo();
        const response = await fetch(tracksUrl, {
            method: "GET",
            headers: {
                "Authorization": `Bearer ${accessToken}`,
                "Accept": "application/json"
            }
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
            const durationFormatted = `${minutes}:${seconds.toString().padStart(2, '0')}`;
            const previewHtml = track.preview_url 
                ? `<audio src="${track.preview_url}" controls style="width: 200px;"></audio>`
                : '<span style="color: red;">미리듣기 없음</span>';

            tracksHtml += `
                <li>
                    ${index + 1}. ${track.name}
                    <br>길이: ${durationFormatted}
                    <br>미리듣기: ${previewHtml}
                    <br>아티스트: ${track.artists.map(artist => artist.name).join(', ')}
                </li>
            `;
        });
        tracksHtml += '</ul>';
        trackListDiv.innerHTML = tracksHtml;
    } catch (error) {
        console.error("Tracks error:", error);
        trackListDiv.innerHTML = `<p>수록곡 목록을 가져오지 못했습니다: ${error.message}</p>`;
    }
}

window.onload = getTokenInfo;
</script>

<%@ include file="../parts/footer.jsp"%>
</body>
</html>