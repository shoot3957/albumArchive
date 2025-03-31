<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>어드민 앨범리스트</title>
    <link rel="stylesheet" href="${ctx}/css/adminAlbumList.css">
</head>
<body>
    <div class="album-container">
        <h1>어드민 앨범리스트</h1>

        <!-- 앨범 목록 테이블 -->
        <table class="album-table">
            <thead>
                <tr>
                    <th>앨범 번호</th>
                    <th>앨범 이름</th>
                    <th>아티스트 번호</th>
                    <th>가격</th>
                    <th>카테고리</th>
                    <th>발매일</th>
                    <th>작업</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="album" items="${albumList}">
                    <tr>
                        <td>${album.num}</td>
                        <td>${album.name}</td>
                        <td>${album.artistNum}</td>
                        <td>${album.price}</td>
                        <td>${album.category}</td>
                        <td>${album.dates}</td>
                        <td class="action-links">
                            <a href="deleteAlbum.do?num=${album.num}" class="delete-link" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty albumList}">
                    <tr>
                        <td colspan="7" class="empty-message">등록된 앨범이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- 앨범 추가 버튼 -->
        <div class="button-container">
            <button id="addAlbumBtn" class="add-btn">앨범 추가</button>
        </div>

        <!-- 모달 창 -->
        <div id="addAlbumModal" class="modal">
            <div class="modal-content">
                <span class="close">×</span>
                <h2>새 앨범 추가</h2>
                <form id="addAlbumForm" action="/albumArchive/addAlbum.do" method="post">
                    <div class="form-group">
                        <label>앨범 이름:</label>
                        <input type="text" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>아티스트 번호:</label>
                        <input type="number" name="artistNum" required>
                    </div>
                    <div class="form-group">
                        <label>설명:</label>
                        <textarea name="info" rows="3" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>가격:</label>
                        <input type="number" name="price" required>
                    </div>
                    <div class="form-group">
                        <label>재고 수량:</label>
                        <input type="number" name="totalQty" required>
                    </div>
                    <div class="form-group">
                        <label>카테고리:</label>
                        <input type="text" name="category" required>
                    </div>
                    <div class="form-group">
                        <label>발매일:</label>
                        <input type="date" name="dates" required>
                    </div>
                    <div class="form-group">
                        <label>이미지 URL:</label>
                        <input type="text" name="img" required>
                    </div>
                    <button type="submit" class="submit-btn">추가</button>
                </form>
            </div>
        </div>
    </div>

    <script src="${ctx}/script/albumInsert.js"></script>
</body>
</html>