<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

  <div class="inner">
  <h1 > 인증코드 입력</h1>

<form action="${ctx}/rdCodeResult.do" method="post">
  <table>
  <tr>
    <td>인증코드 입력</td>
    <td>
    <input type="text" name="myCode" id="myCode" required/>
    <input type="hidden" name="rdCode" id="rdCode" value= ${rdCode}>
    <input type="hidden" name="email" id="email" value= ${email}>
    </td>
    <td colspan="2">
      <button class="btn-submit" > 확인 </button>
   </td>
  </tr>
</table>
</form>
</div>
<%@ include file="../parts/footer.jsp"%>