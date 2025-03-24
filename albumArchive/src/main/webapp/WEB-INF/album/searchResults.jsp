<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
</head>
<body>

<h1>검색 결과</h1>

<c:if test="${not empty albumList}">
    <div class="album-list">
        <c:forEach var="album" items="${albumList}">
            <div class="album-item">
                <img src="${pageContext.request.contextPath}/images/${album.img}" alt="${album.name}" class="album-img">
                <h3>${album.name}</h3>
                <p>가격: ${album.price} 원</p>
                <p>좋아요: ${album.likes}</p>
                <p>카테고리: ${album.category}</p>
            </div>
        </c:forEach>
    </div>
</c:if>

<c:if test="${empty albumList}">
    <p>검색 결과가 없습니다.</p>
</c:if>

</body>
</html>
