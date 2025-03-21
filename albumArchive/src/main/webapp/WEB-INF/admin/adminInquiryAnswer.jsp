<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="inner">
  <div style="width: 80%; margin: 0 auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
    <h2 style="text-align: center; font-size: 2em; margin-bottom: 20px;">${info.title}</h2>
    <div style="font-size: 1.2em; line-height: 1.6; margin-bottom: 30px; padding: 10px; border: 1px solid #eee; border-radius: 3px;">
      ${info.info}
    </div>

    <c:if test="${info.checks == 1}">
      <h3 style="margin-top: 30px; margin-bottom: 10px;">답변:</h3>
      <div style="font-size: 1.1em; line-height: 1.5; padding: 10px; border: 1px solid #eee; border-radius: 3px; background-color: #f9f9f9;">
        ${info.answer}
      </div>
    </c:if>
    <c:if test="${info.checks == 0}">
    	<form action="${ctx}/adminSendAnswer.do?id=${info.user_id}" method="post">
    		<textarea rows="5" cols="80" name="answer"></textarea>
    		<button type="submit">답변하기</button>
    	</form>
    </c:if>
  </div>
</div>
<%@ include file="../parts/footer.jsp"%>