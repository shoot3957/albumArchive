<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ include file="../parts/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>앨범 정보 - ${album.name}</title>
    <style>
        .like-button {
            cursor: pointer;
            font-size: 24px;
            display: inline-block;
            margin-left: 5px;
        }
        .liked {
            color: red;
        }
        .album-details {
            margin-top: 20px;
        }
        .buttons {
            margin-top: 10px;
        }
        .btn {
            padding: 5px 10px;
            margin-right: 5px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            const albumNum = $("#albumNum").val();
            let isLiked = ${isLiked ? 'true' : 'false'}; // 서버에서 전달된 초기값

            updateLikeButton(isLiked);

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
        });
    </script>
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
                            <img src="${album.img}" alt="Album Cover" style="width: 50%; height: 50%;">
                        </c:if>
                    </div>
                    <div class="album-details">
                        <div class="album-title">${album.name}</div>
                        <div class="price-info">
                            <span style="color: red;">가격: ${album.price}원</span>
                        </div>
                        <div class="release-info">발매일: ${album.dates}</div>
                        <div class="likes-info">
                            좋아요: <span id="likesCount">${album.likes}</span>
                            <span id="likeButton" class="like-button"></span>
                        </div>
                        <div class="buttons">
                            <button type="button" class="btn btn-cart">장바구니</button>
                            <button type="button" class="btn btn-buy">구매</button>
                        </div>
                    </div>
                </div>
            </form>

            <div id="trackList">
                <h3>수록곡</h3>
                <ul>
                    <c:forEach var="song" items="${songs}">
                        <li>곡 제목: ${song.name}</li>
                    </c:forEach>
                </ul>
            </div>

            <div class="footer-note">
                * 사진은 실제 상품과 다를 수 있습니다. 품질 보증: KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내
            </div>

            <input id="albumNum" type="hidden" value="${album.num}">
            <input id="artistNum" type="hidden" value="${album.artistNum}">
        </c:otherwise>
    </c:choose>
    <%@ include file="../parts/footer.jsp"%>
</body>
</html>