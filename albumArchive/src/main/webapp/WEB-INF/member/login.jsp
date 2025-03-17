<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

  <div class="inner">
  <h1 > 로그인</h1>

<form action="${ctx}/login.do" method="post">
  <table>
  <tr>
    <td>아이디</td>
    <td>
    <input type="text" name="id" id="id" required  />
    </td>
  </tr>
  <tr>
    <td>패스워드</td>
    <td><input type="password" name="pw" id="pw" required/></td>
  </tr>
   <td colspan="2">
      <button class="btn-submit" > 로그인 </button>
   </td>
	
 	<td>
   <a href="/albumArchive/findId.do">아이디 찾기</a> <!-- 문자 인증 -->
   <a href="/albumArchive/findPw.do">비밀번호 찾기</a>  <!-- 이메일 인증  -->
 	</td>
   
   
</table>
</form>
</div>
<%@ include file="../parts/footer.jsp"%>