<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="inner">

  <c:choose>
    <c:when test="${empty list}">
      <h2 class="no-reservation">문의가 없습니다</h2>
    </c:when>
    <c:otherwise>
      <h2 class="inquiry-list">문의 리스트</h2>
      <table border="1">
        <c:forEach var="item" items="${list}">
          <tr>
            <td align="center">
              <img src="${ctx}/${item.img}" alt="문의 이미지" width="100" height="100">
            </td>
            <td align="center">
              <a href="">${item.title}</a>
            </td>
            <td align="center">${item.user_id}</td>
            <td align="center">${item.info}</td>
            <td align="center">
              <c:if test="${item.checks == 0}">
                <a href="">답장</a>  <!-- Assuming you have a reply page -->
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </table>
    </c:otherwise>
  </c:choose>
</div>
<%@ include file="../parts/footer.jsp"%>