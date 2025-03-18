<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

 <form id="form">
  <div class="field">
    <label for="email">이메일</label>
    <input type="text" name="email" id="email">
  </div>

  <input type="submit" id="button" value="Send Email" >
</form>

<script type="text/javascript"
  src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>

<script type="text/javascript">
  emailjs.init('UUDoB79tBIDdGUQ60')
</script>
 <script src="${ctx}/script/findId.js"> </script>
 
<%@ include file="../parts/footer.jsp"%>