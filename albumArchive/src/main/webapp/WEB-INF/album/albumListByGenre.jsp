<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>장르별 앨범 리스트</title>
    <script src="/script/album.js"></script> <!-- album.js 파일 로드 -->
</head>
<body>
    <h1>장르별 앨범 리스트</h1>
    <div>
        <c:forEach var="album" items="${albumListByGenre}">
            <div>
                <img src="${album.img}" alt="${album.name}" width="100">
                <h3>${album.name}</h3>
                <p>${album.info}</p>
                <p>가격: ${album.price}</p>
                <p>좋아요: ${album.likes}</p>
                <p>카테고리: ${album.category}</p>
                <p>등록일: ${album.dates}</p>
            </div>
        </c:forEach>
    </div>
</body>
</html>
