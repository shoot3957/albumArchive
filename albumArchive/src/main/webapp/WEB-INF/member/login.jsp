<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="inner">
    <h1>로그인</h1>

    <form action="${ctx}/login.do" method="post">
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" required />
        </div>
        <div class="form-group">
            <label for="pw">비밀번호</label>
            <input type="password" name="pw" id="pw" required />
        </div>
        <button class="btn-submit">로그인</button>
        <div class="links">
            <a href="/albumArchive/findId.do">아이디 찾기</a>
            <a href="/albumArchive/findPw.do">비밀번호 찾기</a>
            <a href="/albumArchive/join.do">회원가입</a>
        </div>
    </form>
</div>
<%@ include file="../parts/footer.jsp"%>