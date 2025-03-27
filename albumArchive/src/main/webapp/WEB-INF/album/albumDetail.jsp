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
                                        <c:if test="${loginId == review.userId}">
                                            <a href="#" class="edit-review" data-review-num="${review.num}">수정</a>
                                            <a href="/albumArchive/reviewDelete.do?reviewNum=${review.num}&albumName=${album.name}" onclick="return confirm('정말 삭제하시겠습니까, 씨발?')">삭제</a>
                                        </c:if>
                                        <c:if test="${loginId == 'admin'}">
                                            <a href="/albumArchive/reviewDelete.do?reviewNum=${review.num}&albumName=${album.name}" onclick="return confirm('정말 삭제하시겠습니까, 씨발?')">삭제</a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${review.num == null || review.num <= 0}">
                                <p>리뷰 번호가 유효하지 않습니다: ${review.title} 뭐야 이게</p>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty reviews}">
                            <p>아직 리뷰가 없습니다, 씨발.</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="footer-note">
                * 사진은 실제 상품과 다를 수 있습니다. 품질 보증: KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내
            </div>

            <input id="albumNum" type="hidden" value="${album.num}">
            <input id="loginId" type="hidden" value="${loginId}">
            <input id="artistNum" type="hidden" value="${album.artistNum}">
        </c:otherwise>
    </c:choose>
    <%@ include file="../parts/footer.jsp"%>
</body>
</html>

  <script>
        $(document).ready(function() {
            const albumNum = $("#albumNum").val();
            let isLiked = ${isLiked ? 'true' : 'false'};

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
                            alert("로그인이 필요합니다, ");
                            window.location.href = "/albumArchive/login.do";
                        } else {
                            alert("오류가 발생했습니다,");
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

            $('.tab').click(function() {
                $('.tab').removeClass('active');
                $(this).addClass('active');

                $('.tab-content').removeClass('active');
                const target = $(this).data('target');
                $('#' + target).addClass('active');
            });

            $('.tab[data-target="tracks"]').click();

            $('.edit-review').click(function(e) {
                e.preventDefault();
                // $(this).data('review-num') 방식 사용
                const reviewNum = { num : $(this).data('review-num')};
                // 데이터가 제대로 가져와지지 않을 경우 attr()로 대체 시도
                if (!!$(this).data('review-num')) {
                    reviewNum.num= $(this).attr('data-review-num');
                }
                const reviewItem = $(this).closest('.review-item');
                const title = reviewItem.find('.review-title').text().trim();
                const info = reviewItem.find('.review-info').text().trim();
                const albumName = "${album.name}";

                console.log("reviewNum: " + reviewNum.num + ", 이게 제대로 나와야 함");
                console.log("title: " + title);
                console.log("info: " + info);
                console.log("albumName: " + albumName);
         
				test($(this).attr('data-review-num'));

			     const formHtml = `
	                    <form name="editForm" id="editForm" action="/albumArchive/reviewUpdate.do" method="post">
	                        <input type="hidden" name="reviewNum" >
	                        <input type="hidden" name="albumName" value="The Album">
	                        <label>제목: <input type="text" name="title"  required></label><br>
	                        <label>내용: <textarea name="info" rows="4" cols="50" required></textarea></label><br>
	                        <input type="button" onClick="test(form, ${reviewNum.num})" class="btn" value="수정완료"></input>
	                        <input type="reset" class="btn cancel-edit" value="취소"></input>
	                    </form>
	                `;
	                
                reviewItem.html(formHtml);

                $('.cancel-edit').click(function() {
                    window.location.reload();
                });
            });
        });
        
        function test(form , num) {
        console.log(num)

            console.log("reviewNum: " + form.reviewNum.value);
         //   console.log("title: " + form.title.value);
         //   console.log("info: " + form.info.value);
          //  console.log("albumName: " + form.albumName.value);
        	
          }
    </script>