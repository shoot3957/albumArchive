<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 정보 - ${album.name}</title>
<style>
/* 기존 스타일 */
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

/* 모달 스타일 (마이페이지에서 가져옴) */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	overflow: auto;
}

.modal-content {
	position: relative;
	background-color: #fff;
	margin: 10% auto;
	padding: 20px;
	border-radius: 5px;
	width: 80%;
	max-width: 500px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.close {
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	color: #aaa;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
}

#editForm {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

#editForm label {
	font-weight: bold;
}

#editForm input[type="text"], #editForm input[type="number"], #editForm textarea
	{
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 100%;
}

#editForm button {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

#editForm button:hover {
	background-color: #45a049;
}

.readonly-field {
	padding: 8px;
	background-color: #f0f0f0;
	border-radius: 4px;
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
						<div class="likes-info">
							좋아요: <span id="likesCount">${album.likes}</span> <span
								id="likeButton" class="like-button"></span>
						</div>
						<div class="buttons">
							<c:if test="${loginId != 'admin'}">
								<button type="button" class="btn btn-cart">장바구니</button>
								<button type="button" class="btn btn-buy">구매</button>
							</c:if>
							<c:if test="${loginId == 'admin'}">
								<button type="button" class="btn btn-edit" id="openEditModal">수정</button>
								<form action="/albumArchive/delete.do" method="post"
									style="display: inline;">
									<input type="hidden" name="num" value="${album.num}">
									<button type="submit" class="btn btn-delete"
										onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</form>

			<!-- 모달창 추가 -->
			<div id="editModal" class="modal">
				<div class="modal-content">
					<span class="close" id="closeEditModal">×</span>
					<h3>앨범 수정</h3>
					<form id="editForm" action="${ctx}/adminAlbumUpdate.do"
						method="post">
						<input type="hidden" name="num" value="${album.num}">
						<div>
							<label>앨범 번호:</label>
							<div class="readonly-field">${album.num}</div>
						</div>
						<div>
							<label>앨범 이름:</label>
							<div class="readonly-field">${album.name}</div>
						</div>
						<div>
							<label>아티스트 번호:</label>
							<div class="readonly-field">${album.artistNum}</div>
						</div>
						<div>
							<label>정보:</label>
							<textarea name="info" rows="4" required>${album.info}</textarea>
						</div>
						<div>
							<label>가격:</label> <input type="number" name="price"
								value="${album.price}" min="0" required>
						</div>
						<div>
							<label>재고 수량:</label> <input type="number" name="totalQty"
								value="${album.totalQty}" min="0" required>
						</div>
						<div>
							<label>좋아요 수:</label>
							<div class="readonly-field">${album.likes}</div>
						</div>
						<div>
							<label>카테고리:</label>
							<div class="readonly-field">${album.category}</div>
						</div>
						<div>
							<label>발매일:</label>
							<div class="readonly-field">${album.dates}</div>
						</div>
						<button type="submit">저장</button>
					</form>
				</div>
			</div>

			<!-- 탭 컨테이너 (수록곡, 리뷰) -->
			<div class="tab-container">
				<div class="tab-list">
					<div class="tab active" data-target="tracks">수록곡</div>
					<div class="tab" data-target="reviews">리뷰</div>
				</div>

				<div id="tracks" class="tab-content active">
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
								<label>내용: <textarea name="info" rows="4" cols="50"
										required></textarea></label><br>
								<button type="submit" class="btn">리뷰 등록</button>
							</form>
						</c:if>
						<c:if test="${empty loginId}">
							<p>
								<a href="/albumArchive/login.do">로그인</a> 후 리뷰를 작성할 수 있습니다.
							</p>
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
											<a href="#" class="edit-review"
												data-review-num="${review.num}">수정</a>
										</c:if>
										<a
											href="/albumArchive/reviewDelete.do?reviewNum=${review.num}&albumName=${album.name}"
											onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
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

			<div class="footer-note">* 사진은 실제 상품과 다를 수 있습니다. 품질 보증:
				KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내</div>

			<input id="albumNum" type="hidden" value="${album.num}">
			<input id="loginId" type="hidden" value="${loginId}">
			<input id="artistNum" type="hidden" value="${album.artistNum}">
			<input id="isLike" type="hidden" value="${isLiked}">
		</c:otherwise>
	</c:choose>

	<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 모달 제어
        var modal = document.getElementById("editModal");
        var btn = document.getElementById("openEditModal");
        var span = document.getElementById("closeEditModal");

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // 앨범 수정 폼 유효성 검사
        const editForm = document.getElementById('editForm');
        editForm.addEventListener('submit', function(event) {
            const priceInput = editForm.querySelector('input[name="price"]');
            const totalQtyInput = editForm.querySelector('input[name="totalQty"]');

            if (priceInput.value < 0) {
                alert('가격은 0 이상이어야 합니다.');
                event.preventDefault();
                priceInput.focus();
                return;
            }

            if (totalQtyInput.value < 0) {
                alert('재고 수량은 0 이상이어야 합니다.');
                event.preventDefault();
                totalQtyInput.focus();
                return;
            }
        });

        // 탭 제어
        const tabs = document.querySelectorAll('.tab');
        const tabContents = document.querySelectorAll('.tab-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', function() {
                tabs.forEach(t => t.classList.remove('active'));
                tabContents.forEach(content => content.classList.remove('active'));

                tab.classList.add('active');
                document.getElementById(tab.getAttribute('data-target')).classList.add('active');
            });
        });
    });
    </script>
	<script src="${ctx}/script/albumDetail.js"></script>
	<%@ include file="../parts/footer.jsp"%>
</body>
</html>