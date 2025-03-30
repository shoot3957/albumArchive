<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
 
<link rel="stylesheet" href="${ctx}/css/artist.css"> 
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
<%@ include file="../parts/footer.jsp"%>
    