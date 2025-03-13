<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

  <div class="inner">
  <h1 > 회원가입</h1>

<form action="${ctx}/join.do" method="post">
  <table>
  <tr>
    <td>이름</td>
    <td><input type="text" name="name" id="name" required autofocus /></td>
  </tr>
  <tr>
    <td>아이디</td>
    <td>
    <input type="text" name="id" id="id" required  />
    <input type="button" value="중복체크" id="checkId" class="btn-submit" />
    </td>
  </tr>
  <tr>
    <td>패스워드</td>
    <td><input type="password" name="pw" id="pw" required/></td>
  </tr>
   <tr>
	<td>이메일</td>
	<td><input type="text" name="email" id="email" required /></td>
	</tr>
	<tr>
	<td>전화번호</td>
	<td><input type="text" name="phone" id="phone" required /></td>
	</tr>
  <tr>
    <td colspan="2">
      <button class="btn-submit" > 회원가입 </button>
      <button class="btn-cancel">취소</button>
    </td>
  </tr>
</table>
</form>
</div>
<%@ include file="../parts/footer.jsp"%>