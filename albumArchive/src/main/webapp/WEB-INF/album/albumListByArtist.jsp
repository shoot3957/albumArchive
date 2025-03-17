<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>아티스트별 앨범 리스트</title>
    <script src="${pageContext.request.contextPath}/script/album.js"></script>
</head>
<body>
    <h1>아티스트별 앨범 리스트</h1>

    <!-- 앨범 리스트의 크기 확인 -->
    <c:if test="${not empty albumListByArtist}">
        <p>앨범 리스트 크기: ${fn:length(albumListByArtist)}</p> <!-- 앨범 리스트의 크기를 출력 -->
    </c:if>
    
    <!-- 앨범 리스트가 비어 있지 않으면 출력 -->
    <c:if test="${not empty albumListByArtist}">
        <div>
            <c:forEach var="album" items="${albumListByArtist}">
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
    </c:if>

    <!-- 앨범 리스트가 비어 있을 경우 메시지 출력 -->
    <c:if test="${empty albumListByArtist}">
        <p>해당 아티스트의 앨범이 없습니다.</p>
    </c:if>

</body>
</html>
