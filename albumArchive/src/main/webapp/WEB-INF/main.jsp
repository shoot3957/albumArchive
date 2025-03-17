<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="./parts/header.jsp"%>

<main>
<h1>메인 홈</h1>
<li><a href="albumListAll.do">앨범 리스트</a></li>
<li><a href="albumSortedByGenre.do?category=Ballad">발라드 앨범 리스트</a></li>
<li><a href="albumSortedByLikes.do">좋아요 순 보기</a>
<li><a href="albumSortedByArtist.do?artist_num=2">2번 아티스트앨범보기</a></li>
<c:if test="${sessionScope.loginId ne null}">
        <c:choose>
            <c:when test="${sessionScope.loginId eq 'admin'}">
                <p>관리자님 어서오세요</p>
            </c:when>
            <c:otherwise>
                <p><c:out value="${sessionScope.loginId}님 어서오세요" /></p>
            </c:otherwise>
        </c:choose>
    </c:if>
</main>

<%@ include file="./parts/footer.jsp"%>