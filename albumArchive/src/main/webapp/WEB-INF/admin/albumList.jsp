<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드민 앨범리스트</title>
<style>
/* 테이블 스타일 */
table {
	width: 90%;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	text-align: center;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
	color: #333;
}

.action-links a {
	margin: 0 5px;
	text-decoration: none;
	color: #007bff;
}

.action-links a:hover {
	text-decoration: underline;
}

/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
}
</style>
</head>
<body>
	<h1 style="text-align: center;">어드민 앨범리스트</h1>

	<!-- 앨범 목록 테이블 -->
	<table>
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
					<td class="action-links"><a
						href="deleteAlbum.do?num=${album.num}"
						onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
				</tr>
			</c:forEach>
			<c:if test="${empty albumList}">
				<tr>
					<td colspan="7">등록된 앨범이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>

	<!-- 앨범 추가 버튼 -->
	<div style="text-align: center; margin-top: 20px;">
		<button id="addAlbumBtn"
			style="padding: 10px 20px; background-color: #007bff; color: white; border: none; cursor: pointer;">앨범
			추가</button>
	</div>

	<!-- 모달 창 -->
	<div id="addAlbumModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>새 앨범 추가</h2>
			<form id="addAlbumForm" action="/albumArchive/addAlbum.do"
				method="post">
				<label>앨범 이름: <input type="text" name="name" required></label><br>
				<label>아티스트 번호: <input type="number" name="artistNum"
					required></label><br> <label>설명: <textarea name="info"
						rows="3" required></textarea></label><br> <label>가격: <input
					type="number" name="price" required></label><br> <label>재고
					수량: <input type="number" name="totalQty" required>
				</label><br> <label>카테고리: <input type="text" name="category"
					required></label><br> <label>발매일: <input type="date"
					name="dates" required></label><br> <label>이미지 URL: <input
					type="text" name="img" required></label><br>
				<button type="submit">추가</button>
			</form>
		</div>
	</div>
	<script src="./${ctx}/script/albumInsert.js"></script>
	<%@ include file="../parts/footer.jsp"%>