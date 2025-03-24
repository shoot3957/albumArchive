<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="inner">
    <h1>비밀번호 찾기</h1>

    <form action="${ctx}/findPw.do" method="post">
        <table>
            <c:if test="${passData != 'notValid'}">
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="id" id="id" required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn-submit">확인</button>
                    </td>
                </tr>
            </c:if>
    </form>

            <c:if test="${not empty passData}">
                <c:if test="${passData == 'valid'}">
                    <script>
                        alert("아이디가 올바르지 않습니다.");
                        history.back();
                    </script>
                </c:if>
                <c:if test="${passData == 'notValid'}">
                    <tr>
                        <td colspan="2">
                            <form id="emailForm">
                                <div class="field">
                                    <label for="email">이메일</label>
                                    <input type="text" name="email" id="email">
                                    <input type="hidden" name="rdCode" id="rdCode" value="${rdCode}">
                                    <input type="hidden" name="myCode" id="myCode" value="0">
                                </div>
                                <input type="submit" id="button" value="이메일 보내기">
                            </form>
                        </td>
                    </tr>
                </c:if>
            </c:if>
        </table>
</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
<script defer src="${ctx}/script/sendRdCode.js"></script>
<script type="text/javascript">
    emailjs.init('UUDoB79tBIDdGUQ60');
</script>
<%@ include file="../parts/footer.jsp"%>