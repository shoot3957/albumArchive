<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="parts/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>앨범 판매 사이트</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"> <!-- CSS 연결 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
</head>
<body>

    <!-- 네비게이션 메뉴 -->
    <nav>
        <ul>
            <li>
                <a href="#">장르별 보기</a>
                <div class="dropdown">
                    <a href="albumSortedByGenre.do?category=K-POP">K-POP</a>
                    <a href="albumSortedByGenre.do?category=Ballad">발라드</a>
                    <a href="albumSortedByGenre.do?category=OST">OST</a>
                    <a href="albumSortedByGenre.do?category=Hiphop">힙합</a>
                    <a href="albumSortedByGenre.do?category=Rock">락</a>
                </div>
            </li>
            <li><a href="artistListAll.do">아티스트별 보기</a></li>
            <li><a href="weather.do">오늘의 앨범</a></li>
        </ul>
    </nav>

    <!-- 메인 콘텐츠와 서브 콘텐츠 레이아웃 -->
    <div class="content-container">
        <!-- Main content: 앨범 리스트와 페이징 -->
        <section class="main-content">
            <div class="album-list">
    <c:forEach var="album" items="${albumList}">
        <a href="albumDetail.do?albumName=${album.name}">
            <div class="album-item">
                <img src="${pageContext.request.contextPath}${album.img}" alt="${album.name}" class="album-img">
                <h3>${album.name}</h3>
            </div>
        </a>
    </c:forEach>
</div>


            <!-- 페이징 버튼 -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="main.do?page=${currentPage - 1}&sortOrder=${param.sortOrder}">이전</a>
                </c:if>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="main.do?page=${i}&sortOrder=${param.sortOrder}" class="<c:if test='${i == currentPage}'>active</c:if>">${i}</a>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="main.do?page=${currentPage + 1}&sortOrder=${param.sortOrder}">다음</a>
                </c:if>
            </div>
        </section>
        <!-- Sub content: 좋아요 순 슬라이드 -->
<!-- Sub content: 좋아요 순 슬라이드 -->
<section class="sub-content">
    <h2 class="section-title">👍 좋아요 TOP 10</h2>
    <div class="album-fade">
        <c:forEach var="album" items="${topLikedAlbums}" varStatus="status">
            <a href="albumDetail.do?albumName=${album.name}" 
               class="fade-album ${status.first ? 'active' : ''}">
                <img 
                    src="${pageContext.request.contextPath}${album.img}" 
                    alt="${album.name}">
            </a>
        </c:forEach>
    </div>
</section>



    </div>

    <script src="${pageContext.request.contextPath}/script/slider.js"></script> <!-- 슬라이드쇼 JS -->
</body>
</html>
<%@ include file="parts/footer.jsp"%>
