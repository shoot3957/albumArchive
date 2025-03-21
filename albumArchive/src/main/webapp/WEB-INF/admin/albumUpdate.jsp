<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="../parts/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>앨범 수정 - ${album.name}</title>
    <style>
        .container { display: flex; margin: 20px; }
        .album-cover { flex: 1; }
        .album-details { flex: 2; margin-left: 20px; }
        .btn { margin-right: 10px; padding: 5px 10px; }
        .footer-note { font-size: 0.8em; color: gray; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        input[type="text"], input[type="number"], input[type="date"] {
            width: 100%; padding: 5px; box-sizing: border-box;
        }
    </style>
</head>
<body>
<h1>앨범 수정</h1>

<c:choose>
    <c:when test="${empty album}">
        <p>앨범 데이터를 불러오지 못했습니다.</p>
    </c:when>
    <c:otherwise>
        <form action="updateAlbum.do" method="post" enctype="multipart/form-data">
            <div class="container">
                <div class="album-cover">
                    <c:if test="${not empty album.img}">
                        <img src="./${album.img}" alt="Album Cover" style="width: 50%; height: 50%;">
                    </c:if>
                    <div class="form-group">
                        <label for="imgFile">앨범 커버 이미지:</label>
                        <input type="file" id="imgFile" name="imgFile" accept="image/*">
                    </div>
                </div>
                <div class="album-details">
                    <div class="form-group">
                        <label for="name">앨범 이름:</label>
                        <input type="text" id="name" name="name" value="${album.name}" required>
                    </div>
                    <div class="form-group">
                        <label for="price">가격 (원):</label>
                        <input type="number" id="price" name="price" value="${album.price}" min="0" required>
                    </div>
                    <div class="form-group">
                        <label for="dates">발매일:</label>
                        <input type="date" id="dates" name="dates" value="${album.dates}" required>
                    </div>
                    <div class="form-group">
                        <label for="likes">좋아요 수:</label>
                        <input type="number" id="likes" name="likes" value="${album.likes}" min="0" required>
                    </div>
                    <div class="buttons">
                        <button type="submit" class="btn btn-save">저장</button>
                        <button type="button" class="btn btn-cancel" onclick="window.location.href='albumDetail.do?albumName=${album.name}'">취소</button>
                    </div>
                </div>
            </div>
            <!-- 숨겨진 필드 -->
            <input type="hidden" name="id" value="${album.id}">
            <input type="hidden" name="artistId" value="${album.artistId}">
        </form>

        <div class="footer-note">
            * 사진은 실제 상품과 다를 수 있습니다. 품질 보증: KRPOPMART에서 구매 시 품질 보증 / 교환 및 반품은 구매일로부터 7일 이내
        </div>

        <c:if test="${album == null or empty album['id']}">
            <p style="color: red;">경고: albumId가 서버에서 제공되지 않았습니다.</p>
        </c:if>
    </c:otherwise>
</c:choose>

<%@ include file="../parts/footer.jsp" %>
</body>
</html>