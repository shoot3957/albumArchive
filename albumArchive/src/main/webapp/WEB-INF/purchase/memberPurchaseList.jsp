<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/css/purchase.css">

<div class="purchase-inner">
  <c:choose>
    <c:when test="${empty list}">
      <h2 class="no-reservation">구매 내역이 없습니다</h2>
    </c:when>
    <c:otherwise>
      <h2 class="purchase-list">구매 리스트</h2>
      <table border="1">
        <tr height="40">
          <th width="150" align="center">구매번호</th>
          <th width="150" align="center">앨범 이름</th>
          <th width="150" align="center">회원 ID</th>
          <th width="150" align="center">총 가격</th>
          <th width="150" align="center">배송일</th>
          <th width="150" align="center">총 구매 수량</th>
        </tr>
        <c:forEach var="list" items="${list}">
          <tr>
            <td align="center">${list.num}</td>
            <td align="center">${list.album_name}</td>
            <td align="center">${list.user_id}</td>
            <td align="center">${list.total_price}</td>
            <td align="center">${list.dday}</td>
            <td align="center">${list.total_qty}</td>
          </tr>
        </c:forEach>
      </table>
    </c:otherwise>
  </c:choose>
</div>
<%@ include file="../parts/footer.jsp"%>