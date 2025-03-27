<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ include file="../parts/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
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
        .tab-container {
            margin-top: 20px;
        }
        .tab-list {
            display: flex;
            border-bottom: 2px solid #000;
            margin-bottom: 20px;
        }
        .tab {
            padding: 10px 20px;
            cursor: pointer;
            font-weight: bold;
        }
        .tab.active {
            border-bottom: 3px solid #000;
        }
        .tab-content {
            display: none;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
        }
        .tab-content.active {
            display: block;
        }
        .review-form {
            margin-top: 20px;
        }
        .review-list {
            margin-top: 20px;
        }
        .review-item {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
            position: relative;
        }
        .review-actions {
            position: absolute;
            right: 10px;
            top: 10px;
        }
        .review-actions a {
            margin-left: 5px;
            text-decoration: none;
            color: #007bff;
        }
        .review-actions a:hover {
            text-decoration: underline;
        }
        .video-container {
            margin-top: 20px;
            text-align: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>앨범 정보</h1>

    <c:choose>
        <c:when test="${empty album}">
            <p>앨범 데이터를 불러오지 못했습니다.</p>
        </c:when>
        <c:otherwise>
            <div class="container">
                <div class="album-cover">
                    <c:if test="${not empty album.img}">
                        <img src="./${album.img}" alt="Album Cover" style="width: 50%; height: 50%;">
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
                        <c:if test="${loginId != 'admin'}">
                            <button type="button" class="btn btn-cart">장바구니</button>
                            <button type="button" class="btn btn-buy">구매</button>
                        </c:if>
                        <c:if test="${loginId == 'admin'}">
                            <a href="/albumArchive/edit.do?num=${album.num}" class="btn btn-edit">수정</a>
                            <form action="/albumArchive/delete.do" method="post" style="display: inline;">
                                <input type="hidden" name="num" value="${album.num}">
                                <button type="submit" class="btn btn-delete" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="tab-container">
                <div class="tab-list">
                    <div class="tab" data-target="tracks">수록곡</div>
                    <div class="tab" data-target="reviews">리뷰</div>
                </div>

                <div id="tracks" class="tab-content">
                    <h3>수록곡</h3>
                    <ul>
                        <c:forEach var="song" items="${songs}">
                            <li>곡 제목: ${song.name}</li>
                        </c:forEach>
                    </ul>
                </div>

                <div id="reviews" class="tab-content">
                    <div class="review-form">
                        <h3>리뷰 작성</h3>
                        <c:if test="${not empty loginId}">
                            <form action="/albumArchive/review.do" method="post">
                                <input type="hidden" name="albumNum" value="${album.num}">
                                <input type="hidden" name="albumName" value="${album.name}">
                                <label>제목: <input type="text" name="title" required></label><br>
                                <label>내용: <textarea name="info" rows="4" cols="50" required></textarea></label><br>
                                <button type="submit" class="btn">리뷰 등록</button>
                            </form>
                        </c:if>
                        <c:if test="${empty loginId}">
                            <p>리뷰를 작성하려면 <a href="/albumArchive/login.do">로그인</a>이 필요합니다.</p>
                        </c:if>
                    </div>

                    <div class="review-list">
                        <h3>리뷰 목록</h3>
                        <c:forEach var="review" items="${reviews}">
                            <c:if test="${review.num != null && review.num > 0}">
                                <div class="review-item">
                                    <h4 class="review-title">${review.title}</h4>
                                    <p class="review-info">${review.info}</p>
                                    <small>작성자: ${review.userId}</small>
                                    <div class="review-actions">
                                        <c:if test="${loginId == review.userId || loginId == 'admin'}">
                                            <a href="#" class="edit-review" data-review-num="${review.num}">수정</a>
                                            <a href="/albumArchive/reviewDelete.do?reviewNum=${review.num}&albumName=${album.name}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${review.num == null || review.num <= 0}">
                                <p>리뷰 번호가 유효하지 않습니다: ${review.title}</p>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty reviews}">
                            <p>아직 리뷰가 없습니다</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="video-container" id="videoContainer">
                <h3>관련 영상</h3>
                <div id="youtubePlayer"></div>
            </div>

            <div class="footer-note">
                * 사진은 실제 상품과 다를 수 있습니다. 품질 보증: KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내
            </div>

            <input id="albumNum" type="hidden" value="${album.num}">
            <input id="albumName" type="hidden" value="${album.name}">
            <input id="loginId" type="hidden" value="${loginId}">
            <input id="artistNum" type="hidden" value="${album.artistNum}">
            <input id="isLike" type="hidden" value="${isLiked}">
        </c:otherwise>
    </c:choose>
	<script src="${ctx}/script/albumDetail.js"></script>
	<%@ include file="../parts/footer.jsp"%>