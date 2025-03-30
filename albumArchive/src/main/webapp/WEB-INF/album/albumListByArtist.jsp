<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../parts/header.jsp"%>
<html>
<head>
<title>아티스트별 앨범 리스트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/artistAlbum.css">

<script src="${pageContext.request.contextPath}/script/album.js"></script>
</head>
<body>
	<div class="container">
		<h1 class="page-title">아티스트별 앨범 리스트</h1>

		<!-- 앨범 리스트의 크기 확인 -->
		<c:if test="${not empty albumListByArtist}">
			<p class="album-count">앨범 리스트 크기: ${fn:length(albumListByArtist)}</p>
			<!-- 앨범 리스트의 크기를 출력 -->
		</c:if>

		<!-- 앨범 리스트가 비어 있지 않으면 출력 -->
		<c:if test="${not empty albumListByArtist}">
			<div class="album-list">
				<c:forEach var="album" items="${albumListByArtist}">
    <a href="albumDetail.do?albumName=${album.name}" class="album-link">
        <div class="album-item">
            <img src="${pageContext.request.contextPath}${album.img}" alt="${album.name}" class="album-image">
            <div class="album-details">
                <h3 class="album-title">${album.name}</h3>
                <p class="album-info">${album.info}</p>
                <p class="album-price">가격: ${album.price}원</p>
                <p class="album-likes">좋아요: ${album.likes}</p>
                <p class="album-category">카테고리: ${album.category}</p>
                <p class="album-dates">발매일: ${album.dates}</p>
            </div>
        </div>
    </a>
</c:forEach>

			</div>
		</c:if>

		<!-- 앨범 리스트가 비어 있을 경우 메시지 출력 -->
		<c:if test="${empty albumListByArtist}">
			<p class="no-album-message">해당 아티스트의 앨범이 없습니다.</p>
		</c:if>
	</div>
</body>
</html>
<%@ include file="../parts/footer.jsp"%>