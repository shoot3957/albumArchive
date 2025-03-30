<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctx}/css/join.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <div class="inner-join">
        <h1>회원가입</h1>
        <form action="${ctx}/join.do" method="post">
            <table>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="id" id="id" required />
                        <input type="button" value="중복체크" id="checkId" class="btn-submit" />
                    </td>
                </tr>
                <tr>
                    <td>패스워드</td>
                    <td><input type="password" name="pw" id="pw" required /></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" id="name" required autofocus /></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="email" id="email" required /></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="address" id="address" required />
                        <input type="button" value="주소찾기" class="btn-submit" onclick="sample6_execDaumPostcode()" />
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="phone" id="phone" required /></td>
                </tr>
                <tr>
                    <td>나이</td>
                    <td><input type="number" name="age" id="age" required /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn-submit">회원가입</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script src="${ctx}/script/join.js"></script>
    <%@ include file="../parts/footer.jsp"%>
</body>
</html>