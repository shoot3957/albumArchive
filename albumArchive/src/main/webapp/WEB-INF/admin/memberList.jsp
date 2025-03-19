<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="inner">

  <c:choose>
    <c:when test="${empty memberList}">
      <h2 class="no-reservation">회원이 없습니다!</h2>
    </c:when>
    <c:otherwise>
      <h2 class="member-list">회원 리스트</h2>
      <table border="1">
        <tr height="40">
          <th width="150" align="center">이름</th>
          <th width="150" align="center">아이디</th>
          <th width="150" align="center">비밀번호</th>
          <th width="150" align="center">주소</th>
          <th width="150" align="center">이메일</th>
          <th width="150" align="center">번호</th>
          <th width="150" align="center">나이</th>
          <th width="90" align="center">삭제</th>
        </tr>
        <c:forEach var="member" items="${memberList}">
          <tr>
            <td align="center">${member.name}</td>
            <td align="center">${member.id}</td>
            <td align="center">${member.pw}</td>
            <td align="center">${member.address}</td>
            <td align="center">${member.email}</td>
            <td align="center">${member.phone}</td>
            <td align="center">${member.age}</td>
            <td align="center">
              <form action="${ctx}/adminMemberDelete.do" method="post" style="display:inline;">
                <input type="hidden" name="id" value="${member.id}">
                <button type="submit" class="action-btn delete-btn" onclick="return confirm('정말 ${member.name}님을 삭제하시겠습니까?');">삭제</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </table>
    </c:otherwise>
  </c:choose>
</div>
<%@ include file="../parts/footer.jsp"%>