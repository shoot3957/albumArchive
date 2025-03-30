<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/css/inquiry.css">

<div class="inquiry-detail-inner">
  <div class="detail-container">
    <h2 class="detail-title">${info.title}</h2>
    <div class="detail-content">
      ${info.info}
    </div>

    <c:if test="${info.checks == 1}">
      <h3 class="answer-title">답변:</h3>
      <div class="answer-content">
        ${info.answer}
      </div>
    </c:if>
    <c:if test="${info.checks == 0 and id eq 'admin'}">
      <form action="${ctx}/adminSendAnswer.do?id=${info.user_id}" method="post" class="answer-form">
        <h3 class="answer-form-title">답변 작성</h3>
        <textarea rows="6" name="answer" class="answer-textarea" placeholder="여기에 답변을 작성해 주세요" required></textarea>
        <div class="answer-form-buttons">
          <button type="submit" class="btn answer-btn-primary">답변 등록</button>
          <button type="button" class="btn answer-btn-secondary" onclick="location.href='${ctx}/adminInquiryList.do'">취소</button>
        </div>
      </form>
    </c:if>
  </div>
</div>
<%@ include file="../parts/footer.jsp"%>