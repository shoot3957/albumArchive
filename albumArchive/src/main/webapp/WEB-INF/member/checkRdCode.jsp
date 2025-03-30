<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인증코드 입력</title>
    <link rel="stylesheet" href="${ctx}/css/authCode.css">
</head>
<body>
    <div class="inner auth-container">
        <h1>인증코드 입력</h1>

        <form action="${ctx}/rdCodeResult.do" method="post">
            <div class="auth-code-section">
                <label for="myCode">인증코드 입력</label>
                <input type="text" name="myCode" id="myCode" required placeholder="인증코드를 입력하세요"/>
                <input type="hidden" name="rdCode" id="rdCode" value="${rdCode}">
                <input type="hidden" name="email" id="email" value="${email}">
                <button type="submit" class="btn-submit">확인</button>
            </div>
        </form>
    </div>
    <%@ include file="../parts/footer.jsp"%>
</body>
</html>