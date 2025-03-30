<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
<title>장르별 앨범 리스트</title>
<link rel="stylesheet" href="${ctx}/css/list.css">
<!-- CSS 스타일 추가 -->
<script src="${pageContext.request.contextPath}/script/album.js"></script>
<!-- album.js 파일 로드 -->
</head>
<body>
	<div class="container">
		<h1 class="page-title">장르별 앨범 리스트</h1>

		<c:if test="${not empty albumListByGenre}">
			<div class="album-list">
				<c:forEach var="album" items="${albumListByGenre}">
					<div class="album-item">
						<img src="${pageContext.request.contextPath}${album.img}"
							alt="${album.name}" class="album-image">
						<div class="album-details">
							<h3 class="album-title">${album.name}</h3>
							<p class="album-info">${album.info}</p>
							<p class="album-price">가격: ${album.price}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>

		<c:if test="${empty albumListByGenre}">
			<p class="no-album-message">해당 장르의 앨범이 없습니다.</p>
		</c:if>
	</div>
</body>
</html>
