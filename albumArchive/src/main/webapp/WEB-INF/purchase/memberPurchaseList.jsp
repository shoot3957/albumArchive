<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 리스트</title>
    <link rel="stylesheet" href="${ctx}/css/purchase.css">
</head>
<body>
    <div class="purchase-inner">
        <c:choose>
            <c:when test="${empty list}">
                <h2 class="no-reservation">구매 내역이 없습니다</h2>
            </c:when>
            <c:otherwise>
                <h2 class="purchase-list">구매 리스트</h2>
                <table class="purchase-table">
                    <thead>
                        <tr>
                            <th>구매번호</th>
                            <th>앨범 이름</th>
                            <th>회원 ID</th>
                            <th>총 가격</th>
                            <th>배송일</th>
                            <th>총 구매 수량</th>
                            <th>환불</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${list}">
                            <tr>
                                <td>${list.num}</td>
                                <td>${list.album_name}</td>
                                <td>${list.user_id}</td>
                                <td>${list.total_price}</td>
                                <td>${list.dday}</td>
                                <td>${list.total_qty}</td>
                                <td>
                                    <a href="deletePurchase.do?num=${list.num}&qty=${list.total_qty}&price=${list.total_price}&albumName=${list.album_name}&loginId=${loginId}" 
                                       class="delete-link" 
                                       onclick="return confirm('정말 환불하시겠습니까?');">환불</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
    <%@ include file="../parts/footer.jsp"%>
</body>
</html>