require('dotenv').config();
const express = require('express');
const axios = require('axios');
const app = express();
const port = 3000;

// 환경 변수 설정
const YOUTUBE_API_KEY = process.env.YOUTUBE_API_KEY || 'YOUR_API_KEY'; // .env 파일에서 관리 권장

// EJS 설정
app.set('view engine', 'ejs');
app.use(express.static('public'));

// 앨범 상세 페이지 라우트
app.get('/album/:albumName', async (req, res) => {
    const albumName = req.params.albumName;

    try {
        // YouTube API로 영상 검색
        const response = await axios.get('https://www.googleapis.com/youtube/v3/search', {
            params: {
                part: 'snippet',
                q: `${albumName} official video`,
                type: 'video',
                maxResults: 1,
                key: YOUTUBE_API_KEY
            }
        });

        const videoId = response.data.items.length > 0 ? response.data.items[0].id.videoId : null;

        // 앨범 데이터 (예시로 하드코딩, 실제로는 DB 사용)
        const album = {
            name: albumName,
            price: 15000,
            dates: '2023-10-20'
        };

        // EJS 템플릿 렌더링
        res.render('albumDetail', { album, videoId });
    } catch (error) {
        console.error('YouTube API 오류:', error.message);
        res.render('albumDetail', { album: { name: albumName }, videoId: null });
    }
});

// 서버 시작
app.listen(port, () => {
    console.log(`서버가 http://localhost:${port}에서 실행 중입니다.`);
});