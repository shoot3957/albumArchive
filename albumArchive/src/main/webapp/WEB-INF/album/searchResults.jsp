<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../parts/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
    <!-- CSS 링크 방식 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchResult.css">
    
</head>
<body>

<h1>검색 결과</h1>

<c:if test="${not empty albumList}">
    <div class="album-list">
        <c:forEach var="album" items="${albumList}">
    <a href="albumDetail.do?albumName=${album.name}" class="album-link">
        <div class="album-item">
            <img src="${pageContext.request.contextPath}${album.img}" class="album-img">
            <h3>${album.name}</h3>
            <p>💰 가격: ${album.price} 원</p>
            <p>❤️ 좋아요: ${album.likes}</p>
            <p>🎧 카테고리: ${album.category}</p>
        </div>
    </a>
</c:forEach>

    </div>
</c:if>

<c:if test="${empty albumList}">
    <p>검색 결과가 없습니다.</p>
</c:if>
<%@ include file="../parts/footer.jsp"%>
</body>
</html>
