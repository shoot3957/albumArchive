<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 정보 - ${album.name}</title>
<link rel="stylesheet" href="${ctx}/css/albumDetail.css">
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
						좋아요: <span id="likesCount">${album.likes}</span> <span id="likeButton" class="like-button"></span>
					</div>

					<div class="buttons">
						<c:if test="${loginId != 'admin'}">
							<form action="${ctx}/cartAdd.do" method="post" style="display:inline;">
								<input type="hidden" name="id" value="${loginId}">
								<input type="hidden" name="album_num" value="${album.num}">
								<input type="hidden" name="price" value="${album.price}">
								<input type="hidden" name="qty" value="1">
								<button type="submit" class="btn btn-cart">장바구니에 추가</button>
							</form>
						</c:if>
						<c:if test="${loginId == 'admin'}">
							<button type="button" class="btn btn-edit" id="openEditModal">수정</button>
						</c:if>
					</div>
				</div>
			</div>

			<!-- 모달창 -->
			<div id="editModal" class="modal">
				<div class="modal-content">
					<span class="close" id="closeEditModal">×</span>
					<h3>앨범수정</h3>
					<form id="editForm" action="${ctx}/adminAlbumUpdate.do" method="post">
						<input type="hidden" name="num" value="${album.num}">
						<div><label>앨범 번호:</label><div class="readonly-field">${album.num}</div></div>
						<div><label>앨범 이름:</label><div class="readonly-field">${album.name}</div></div>
						<div><label>아티스트 번호:</label><div class="readonly-field">${album.artistNum}</div></div>
						<div><label>정보:</label><textarea name="info" rows="4" required>${album.info}</textarea></div>
						<div><label>가격:</label><input type="number" name="price" value="${album.price}" min="0" required></div>
						<div><label>재고 수량:</label><input type="number" name="totalQty" value="${album.totalQty}" min="0" required></div>
						<div><label>좋아요 수:</label><div class="readonly-field">${album.likes}</div></div>
						<div><label>카테고리:</label><div class="readonly-field">${album.category}</div></div>
						<div><label>발매일:</label><div class="readonly-field">${album.dates}</div></div>
						<button type="submit">저장</button>
					</form>
				</div>
			</div>

			<!-- 수록곡/리뷰 -->
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
								<label>내용: <textarea name="info" rows="4" cols="50" required></textarea></label><br>
								<button type="submit" class="btn">리뷰 등록</button>
							</form>
						</c:if>
						<c:if test="${empty loginId}">
							<p><a href="/albumArchive/login.do">로그인</a> 후 리뷰를 작성할 수 있습니다.</p>
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
										</c:if>
										<a href="/albumArchive/reviewDelete.do?reviewNum=${review.num}&albumName=${album.name}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
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

			<div class="footer-note">* 사진은 실제 상품과 다를 수 있습니다. 품질 보증: KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내</div>

			<input type="hidden" name="albumName" value="${album.name}">
			<input id="albumNum" type="hidden" value="${album.num}">
			<input id="loginId" type="hidden" value="${loginId}">
			<input id="artistNum" type="hidden" value="${album.artistNum}">
			<input id="isLike" type="hidden" value="${isLiked}">
		</c:otherwise>
	</c:choose>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var modal = document.getElementById("editModal");
			var btn = document.getElementById("openEditModal");
			var span = document.getElementById("closeEditModal");

			if (btn) {
				btn.onclick = function() {
					modal.style.display = "block";
				}
			}
			if (span) {
				span.onclick = function() {
					modal.style.display = "none";
				}
			}
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}

			const editForm = document.getElementById('editForm');
			if (editForm) {
				editForm.addEventListener('submit', function(event) {
					const priceInput = editForm.querySelector('input[name="price"]');
					const totalQtyInput = editForm.querySelector('input[name="totalQty"]');
					if (priceInput.value < 0) {
						alert('가격은 0 이상이어야 합니다.');
						event.preventDefault();
						priceInput.focus();
					}
					if (totalQtyInput.value < 0) {
						alert('재고 수량은 0 이상이어야 합니다.');
						event.preventDefault();
						totalQtyInput.focus();
					}
				});
			}
		});
	</script>
	<script src="${ctx}/script/albumDetail.js"></script>
	<%@ include file="../parts/footer.jsp"%>
</body>
</html>
