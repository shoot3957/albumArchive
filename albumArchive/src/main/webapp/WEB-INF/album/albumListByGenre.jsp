<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ include file="../parts/header.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>장르별 앨범 리스트</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/genreAlbumList.css">
    <!-- 페이지별 CSS 추가 -->
    <script src="${pageContext.request.contextPath}/script/album.js"></script>
    <!-- 페이지별 JS 로드 -->
</head>
<body>
    <div class="container genre-list-container">
        <h1 class="page-title">장르별 앨범 리스트</h1>

        <c:if test="${not empty albumListByGenre}">
            <div class="album-grid">
                <c:forEach var="album" items="${albumListByGenre}">
                    <div class="album-square">
                        <a href="${pageContext.request.contextPath}/albumDetail.do?num=${album.num}">
                            <img src="${pageContext.request.contextPath}${album.img}" alt="${album.name}" class="album-image">
                            <div class="album-details">
                                <h3 class="album-artist">${album.name}</h3>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty albumListByGenre}">
            <p class="no-album-message">해당 장르의 앨범이 없습니다.</p>
        </c:if>
    </div>
    <%@ include file="../parts/footer.jsp"%>
</body>
</html>