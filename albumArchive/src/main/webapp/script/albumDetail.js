$(document).ready(function() {
    const albumNum = $("#albumNum").val();
    const albumName = $("#albumName").val();
    let isLiked = $("#isLike").val() === "true"; // 서버에서 전달된 isLiked 값
    const API_KEY = "AIzaSyDanqnv2jgOH7sGF54ZEa75KQMsyiSiISs"; // 발급받은 YouTube API 키로 교체

    console.log("isLiked:", isLiked);
    console.log("albumNum:", albumNum);
    console.log("albumName:", albumName);

    // 초기 좋아요 버튼 설정 및 YouTube 영상 로드
    updateLikeButton(isLiked);
    loadYouTubeVideo();

    // 좋아요 버튼 클릭 이벤트
    $("#likeButton").click(function() {
        $.ajax({
            url: "/albumArchive/like.do",
            type: "POST",
            data: { albumNum: albumNum },
            dataType: "json",
            success: function(response) {
                isLiked = response.liked;
                $("#likesCount").text(response.likes);
                updateLikeButton(isLiked);
            },
            error: function(xhr) {
                if (xhr.status === 401) {
                    alert("로그인이 필요합니다.");
                    window.location.href = "/albumArchive/login.do";
                } else {
                    alert("오류가 발생했습니다.");
                }
            }
        });
    });

    // 좋아요 버튼 UI 업데이트 함수
    function updateLikeButton(liked) {
        const button = $("#likeButton");
        if (liked) {
            button.addClass("liked");
            button.html("♥");
        } else {
            button.removeClass("liked");
            button.html("♡");
        }
    }

    // 탭 기능 및 비디오 컨테이너 제어
    $('.tab').click(function() {
        $('.tab').removeClass('active');
        $(this).addClass('active');
        $('.tab-content').removeClass('active');
        const target = $(this).data('target');
        $('#' + target).addClass('active');

        // 리뷰 탭이 활성화되면 비디오 컨테이너 숨김, 수록곡 탭이면 표시
        if (target === "reviews") {
            $('#videoContainer').hide();
        } else if (target === "tracks") {
            $('#videoContainer').show();
        }
    });
    $('.tab[data-target="tracks"]').click(); // 기본 탭 설정 (수록곡 탭 활성화)

    // 리뷰 수정 기능
    $('.edit-review').click(function(e) {
        e.preventDefault();
        const reviewNum = $(this).data('review-num');
        const reviewItem = $(this).closest('.review-item');
        const title = reviewItem.find('.review-title').text().trim();
        const info = reviewItem.find('.review-info').text().trim();

        const formHtml = `
            <form name="editForm" action="/albumArchive/reviewUpdate.do" method="post">
                <input type="hidden" name="reviewNum" value="${reviewNum}">
                <input type="hidden" name="albumName" value="${albumName}">
                <label>제목: <input type="text" name="title" value="${title}" required></label><br>
                <label>내용: <textarea name="info" rows="4" cols="50" required>${info}</textarea></label><br>
                <input type="submit" class="btn btn-edit-complete" value="수정완료">
                <input type="button" class="btn cancel-edit" value="취소">
            </form>
        `;
        reviewItem.html(formHtml);
    });

    // YouTube 영상 로드 함수
    function loadYouTubeVideo() {
        $.ajax({
            url: "https://www.googleapis.com/youtube/v3/search",
            type: "GET",
            data: {
                part: "snippet",
                q: albumName + " official video",
                type: "video",
                maxResults: 1,
                key: API_KEY
            },
            dataType: "json",
            success: function(data) {
                if (data.items && data.items.length > 0) {
                    const videoId = data.items[0].id.videoId;
                    $("#youtubePlayer").html(
                        `<iframe width="100%" height="100%" 
                                src="https://www.youtube.com/embed/${videoId}?autoplay=0" 
                                frameborder="0" 
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                                allowfullscreen></iframe>`
                    );
                } else {
                    $("#youtubePlayer").html("<p>관련 영상을 찾을 수 없습니다.</p>");
                }
            },
            error: function(xhr, status, error) {
                $("#youtubePlayer").html("<p>YouTube 영상 로드 실패: " + error + "</p>");
                console.error("YouTube API 오류:", error);
            }
        });
    }
});