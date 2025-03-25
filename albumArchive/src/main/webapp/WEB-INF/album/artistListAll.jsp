<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아티스트 목록</title>
    <style>
        .artist-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .artist-item {
            border: 1px solid #ddd;
            padding: 20px;
            text-align: center;
            width: 200px;
            height: 250px;
        }
        .artist-img {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>

    <h1>아티스트 목록</h1>
    
    <div class="artist-list">
        <!-- 아티스트 목록을 출력 -->
        <c:forEach var="artist" items="${artistList}">
            <div class="artist-item">
                <a href="albumSortedByArtist.do?artist_num=${artist.num}">
                    <img src="${pageContext.request.contextPath}/images/artists/${artist.name}.jpg" alt="${artist.name}" class="artist-img">
                </a>
                <h3>${artist.name}</h3>
            </div>
        </c:forEach>
    </div>

</body>
</html>
