let accessToken = null;
let msg;

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
    // getTokenInfo();
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

async function getAlbumInfo() {
    const albumId = "2oCAY48bhZvQte0l7apmYC"; // Still Life 앨범 ID
    const albumUrl = `https://api.spotify.com/v1/albums/${albumId}`;
    const tracksUrl = `https://api.spotify.com/v1/albums/${albumId}/tracks`;

    try {
        if (!accessToken) {
            throw new Error("accessToken이 없습니다. 인증이 필요합니다.");
        }

        // 아티스트 정보 가져오기 (장르 확인용)
        const artistId = "4Kxlr1PRlDKEB0ekOCyHgX"; // BIGBANG 아티스트 ID
        const artistUrl = `https://api.spotify.com/v1/artists/${artistId}`;
        const artistResponse = await fetch(artistUrl, {
            method: "GET",
            headers: {
                "Authorization": `Bearer ${accessToken}`,
                "Accept": "application/json"
            }
        });

        if (!artistResponse.ok) {
            const errorText = await artistResponse.text();
            console.warn(`아티스트 정보 가져오기 실패: ${artistResponse.status} - ${errorText}`);
        }

        const artistData = await artistResponse.json();
        console.log("BIGBANG 아티스트 정보:", artistData);

        // 앨범 정보 가져오기
        const albumResponse = await fetch(albumUrl, {
            method: "GET",
            headers: {
                "Authorization": `Bearer ${accessToken}`,
                "Accept": "application/json"
            }
        });

        if (!albumResponse.ok) {
            const errorText = await albumResponse.text();
            throw new Error(`앨범 정보 가져오기 실패: ${albumResponse.status} - ${errorText}`);
        }

        const albumData = await albumResponse.json();
        console.log("Still Life 앨범 정보:", albumData);

        if (!albumData || !albumData.name || !albumData.id) {
            throw new Error("앨범 데이터가 올바르지 않습니다.");
        }

        // 트랙 목록 가져오기
        const tracksResponse = await fetch(tracksUrl, {
            method: "GET",
            headers: {
                "Authorization": `Bearer ${accessToken}`,
                "Accept": "application/json"
            }
        });

        if (!tracksResponse.ok) {
            const errorText = await tracksResponse.text();
            throw new Error(`트랙 목록 가져오기 실패: ${tracksResponse.status} - ${errorText}`);
        }

        const tracksData = await tracksResponse.json();
        console.log("앨범 트랙 목록:", tracksData);

        // 트랙 세부 정보 가져오기
        const trackDetailsPromises = tracksData.items.map(async (track) => {
            const trackUrl = `https://api.spotify.com/v1/tracks/${track.id}`;
            const trackResponse = await fetch(trackUrl, {
                method: "GET",
                headers: {
                    "Authorization": `Bearer ${accessToken}`,
                    "Accept": "application/json"
                }
            });

            if (!trackResponse.ok) {
                console.error(`트랙 ${track.id} 정보 가져오기 실패: ${trackResponse.status}`);
                return null;
            }

            return trackResponse.json();
        });

        const trackDetails = (await Promise.all(trackDetailsPromises)).filter(detail => detail !== null);

        // 장르 처리
        let genresHtml = '<p>장르: 제공되지 않음 (API 데이터 누락)</p>';
        if (artistData.genres && artistData.genres.length > 0) {
            genresHtml = `<p>장르: ${artistData.genres.join(', ')}</p>`;
        }

        // 앨범 이미지
        let imageHtml = '';
        if (albumData.images && albumData.images.length > 0) {
            const image = albumData.images[0];
            imageHtml = `<img src="${image.url}" height="${image.height}" width="${image.width}" alt="Album Image" />`;
        }

        // 트랙 목록 HTML 생성
        let tracksHtml = '<h3>수록곡 목록:</h3><ul>';
        tracksData.items.forEach((track, index) => {
            const detail = trackDetails[index];
            const durationSeconds = Math.floor(track.duration_ms / 1000);
            const minutes = Math.floor(durationSeconds / 60);
            const seconds = durationSeconds % 60;
            const durationFormatted = `${minutes}:${seconds.toString().padStart(2, '0')}`;
            const previewUrl = detail ? detail.preview_url : null;
            const popularity = detail ? detail.popularity || 'N/A' : 'N/A';
            const spotifyUrl = detail ? detail.external_urls.spotify : '#';

            let previewHtml = '<span style="color: red;">미리듣기 제공되지 않음 (지역 제한 또는 데이터 없음)</span>';
            if (previewUrl) {
                previewHtml = `
                    <audio id="preview-${track.id}" src="${previewUrl}" preload="none" controls></audio>
                `;
            }

            tracksHtml += `
                <li>
                    ${index + 1}. ${track.name} 
                    <br>트랙 ID: ${track.id}
                    <br>길이: ${durationFormatted}
                    <br>인기도: ${popularity}%
                    <br>미리듣기: ${previewHtml}
                    <br>스포티파이 링크: <a href="${spotifyUrl}" target="_blank">열기</a>
                    <br>아티스트: ${track.artists.map(artist => artist.name).join(', ')}
                </li>
            `;
        });
        tracksHtml += '</ul>';

        if (msg) {
            msg.innerHTML = `
                <h2>앨범 정보 ("봄여름가을겨울 (Still Life)")</h2>
                <h1>앨범 이름: ${albumData.name}<br>앨범 ID: ${albumData.id}<br>릴리스 날짜: ${albumData.release_date}</h1>
                ${genresHtml}
                ${imageHtml}
                ${tracksHtml}
            `;
        }
    } catch (error) {
        console.error("앨범 정보 가져오기 에러:", error.message);
        if (msg) {
            msg.innerHTML = `<p>앨범 정보 가져오기 실패: ${error.message}</p>`;
        }
    }
}

async function search() {
    const query = document.getElementById('searchQuery').value || "remaster track:Doxy artist:Miles Davis";
    const url = `https://api.spotify.com/v1/search?q=${encodeURIComponent(query)}&type=album`;

    try {
        if (!accessToken) {
            throw new Error("accessToken이 없습니다. 인증이 필요합니다.");
        }

        const response = await fetch(url, {
            method: "GET",
            headers: {
                "Authorization": `Bearer ${accessToken}`,
                "Accept": "application/json"
            }
        });

        if (!response.ok) {
            throw new Error(`HTTP 오류! 상태 코드: ${response.status}`);
        }

        const data = await response.json();
        console.log("검색 결과:", data);
        return data;
    } catch (error) {
        console.error("검색 중 오류 발생:", error.message);
        throw error;
    }
}

async function searchAlbums() {
    try {
        const data = await search();
        const albums = data.albums.items;

        if (albums.length === 0) {
            msg.innerHTML = '<p>검색 결과가 없습니다.</p>';
            return;
        }

        let albumsHtml = '<ul class="album-list">';
        albums.forEach(album => {
            const imageUrl = album.images.length > 0 ? album.images[0].url : 'https://via.placeholder.com/60';
            albumsHtml += `
                <li class="album-item">
                    <img src="${imageUrl}" alt="${album.name}">
                    <div>
                        <h3>${album.name}</h3>
                        <p>아티스트ID: ${album.artists.map(artist => artist.id).join(', ')}</p>
                        <p>앨범ID: ${album.id}</p>
                        <p>릴리스 날짜: ${album.release_date}</p>
                        <a href="${album.external_urls.spotify}" target="_blank">스포티파이에서 보기</a>
                    </div>
                </li>
            `;
        });
        albumsHtml += '</ul>';

        msg.innerHTML = albumsHtml;
    } catch (error) {
        msg.innerHTML = `<p class="error-message">검색 중 오류 발생: ${error.message}</p>`;
    }
}