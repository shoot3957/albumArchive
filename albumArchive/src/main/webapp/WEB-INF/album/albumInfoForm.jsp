<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
<title>앨범 없데이트</title>
<script src="/script/album.js"></script>
</head>
<body>
	<h1>앨범 수정</h1>
	<form action="" method="post">
		<div class="container">
			<div class="album-cover"></div>
			<div class="album-details">
				<div class="album-title"></div>
				<div class="artist-name"></div>
				<div class="price-info">
					 <span style="color: red;"></span> <span
						style="color: green;"></span>
				</div>
				<div class="discount-info"></div>
				<div class="release-info">출시일: 2005-04-08 품질: 3,000원</div>
				<div class="buttons">
					<button class="btn btn-like">찜하기</button>
					<button class="btn btn-cart">장바구니</button>
					<button class="btn btn-buy">구매</button>
				</div>
			</div>
			<div class="footer-note">* 사진은 실제 상품과 다를 수 있습니다. 품질 보증:
				KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내</div>
		</div>
	</form>
</body>
</html>
