<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/css/inquriyInfo.css">
<div class="container inquiry-detail-inner">
    <div class="inquiry-box">
        <h2 class="inquiry-title">${info.title}</h2>
        <div class="inquiry-content">${info.info}</div>

        <c:if test="${info.checks == 1}">
            <h3 class="answer-title">답변:</h3>
            <div class="answer-content">${info.answer}</div>
        </c:if>

        <c:if test="${info.checks == 0}">
            <form action="${ctx}/adminSendAnswer.do?id=${info.user_id}" method="post" class="answer-form">
                <textarea name="answer" class="form-control" rows="5" required></textarea>
                <button type="submit" class="btn btn-primary">답변하기</button>
            </form>
        </c:if>
    </div>
</div>

<%@ include file="../parts/footer.jsp"%>
