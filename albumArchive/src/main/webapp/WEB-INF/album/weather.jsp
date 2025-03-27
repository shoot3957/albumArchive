<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../parts/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오늘의 앨범 추천</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mood.css">
</head>

<!-- ✅ body에 mood 클래스를 동적으로 추가 -->
<body class="${mood}">

    <div class="mood-tagline">
        <c:choose>
            <c:when test="${mood eq 'hot'}">🔥 더위를 날려줄 썸머 플레이리스트</c:when>
            <c:when test="${mood eq 'cold'}">🧤 추운 날씨엔 따뜻한 감성 앨범</c:when>
            <c:when test="${mood eq 'rainy'}">☔ 감성 촉촉한 비 오는 날의 선곡</c:when>
            <c:when test="${mood eq 'snowy'}">❄️ 눈 오는 날, 순백의 사운드</c:when>
            <c:otherwise>🎵 오늘 하루를 채워줄 데일리 앨범</c:otherwise>
        </c:choose>
    </div>

    <div class="album-list">
        <c:forEach var="album" items="${albumList}">
            <div class="album-item">
                <img src="${pageContext.request.contextPath}${album.img}" alt="${album.name}">
                <h3>${album.name}</h3>
            </div>
        </c:forEach>
    </div>

</body>
</html>

<%@ include file="../parts/footer.jsp"%>
