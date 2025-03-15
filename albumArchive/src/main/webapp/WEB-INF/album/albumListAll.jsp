<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>앨범 리스트</title>
</head>
<body>
    <h1>앨범 리스트</h1>
    <div>
        <c:forEach var="album" items="${albumList}">
            <div>
                <img src="${album.img}" alt="${album.name}" width="100">
                <h3>${album.name}</h3>
                <p>${album.info}</p>
                <p>가격: ${album.price}</p>
                <p>좋아요: ${album.like}</p>
                <p>카테고리: ${album.category}</p>
                <p>등록일: ${album.date}</p>
            </div>
        </c:forEach>
    </div>
</body>
</html>
