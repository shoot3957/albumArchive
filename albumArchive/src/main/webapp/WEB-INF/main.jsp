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
</head>
<body>
    <!-- 상단 네비게이션 바 -->
    <header>
        <div class="header-left">
            <button>로그인</button>
        </div>
        <div class="header-search">
            <input type="text" placeholder="검색">
        </div>
        <div class="header-right">
            <button>메뉴</button>
        </div>
    </header>

    <!-- 네비게이션 메뉴 -->
    <nav>
        <ul>
            <li><a href="albumSortedByGenre.do">장르별 보기</a></li>
            <li><a href="albumSortedByArtist.do">아티스트별 보기</a></li>
            <li><a href="#">오늘의 앨범</a></li>
        </ul>
    </nav>

    <!-- 메인 콘텐츠와 서브 콘텐츠 레이아웃 -->
    <div class="content-container">
        <!-- Main content: 앨범 리스트와 페이징 -->
        <section class="main-content">
            <div class="album-list">
                <c:forEach var="album" items="${albumList}">
                    <div class="album-item">
                        <img src="${pageContext.request.contextPath}${album.img}" alt="${album.name}" class="album-img">
                        <h3>${album.name}</h3>
                    </div>
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
        <section class="sub-content">
            <div class="album-slide">
                <div class="slider">
                    <c:forEach var="album" items="${topLikedAlbums}">
                        <a href="albumDetail.do?albumName=${album.name}">
                            <img src="${pageContext.request.contextPath}${album.img}" alt="${album.name}">
                        </a>
                    </c:forEach>
                </div>
            </div>
        </section>
    </div>

    <footer>
        <p>앨범 판매 사이트 &copy; 2025</p>
    </footer>

    <script src="${pageContext.request.contextPath}/script/slider.js"></script> <!-- 슬라이드쇼 JS -->
</body>
</html>

<%@ include file="parts/footer.jsp"%>
