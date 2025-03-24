<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="member-inner">
    <h2 class="member-list">마이페이지</h2>
    <form id="updateForm" action="${ctx}/updateMember.do" method="post">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input type="text" id="id" name="id" value="${m.id}" readonly></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" id="pw" name="pw" value="${m.pw}"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" id="name" name="name" value="${m.name}" readonly></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" id="address" name="address" value="${m.address}"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" id="email" name="email" value="${m.email}"></td>
            </tr>
            <tr>
                <td>번호</td>
                <td><input type="text" id="phone" name="phone" value="${m.phone}" readonly></td>
            </tr>
            <tr>
                <td>나이</td>
                <td><input type="number" id="age" name="age" value="${m.age}" readonly></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" id="updateButton" value="정보 수정">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="/albumArchive/deleteMember.do?id=${m.id}">회원탈퇴</a>           
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const updateForm = document.getElementById('updateForm');
    const pwInput = document.getElementById('pw');
    const addressInput = document.getElementById('address');
    const emailInput = document.getElementById('email');
    const updateButton = document.getElementById('updateButton');

    updateButton.addEventListener('click', function(event) {
        event.preventDefault(); // 폼 기본 제출 막기

        // 비밀번호 유효성 검사
        if (!pwInput.value) {
            alert('비밀번호를 입력해주세요');
            pwInput.focus();
            pwInput.style.border = '2px solid red';
            return;
        } else if (pwInput.value.length < 8) {
            alert('비밀번호는 최소 8자 이상이어야 합니다.');
            pwInput.focus();
            pwInput.style.border = '2px solid red';
            return;
        } else {
             pwInput.style.border = '';
        }

        // 주소 유효성 검사
        if (!addressInput.value) {
            alert('주소를 입력해주세요');
            addressInput.focus();
            addressInput.style.border = '2px solid red';
            return;
        } else if (!/^[가-힣]+시\s*[가-힣]+구$/.test(addressInput.value)) {
            alert('주소는 "XX시 XX구" 형식이어야 합니다 (예: 서울시 강남구)');
            addressInput.focus();
            addressInput.style.border = '2px solid red';
            return;
        } else {
            addressInput.style.border = '';
        }

        // 이메일 유효성 검사
        if (!emailInput.value) {
            alert('이메일을 입력해주세요');
            emailInput.focus();
            emailInput.style.border = '2px solid red';
            return;
        } else if (!isValidEmail(emailInput.value)) {
            alert('유효한 이메일 주소를 입력해주세요');
            emailInput.focus();
            emailInput.style.border = '2px solid red';
            return;
        } else {
            emailInput.style.border = '';
        }

        // 모든 유효성 검사 통과 후 폼 제출
        updateForm.submit();
    });

    // 이메일 유효성 검사 함수
    function isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }
});
</script>
<%@ include file="../parts/footer.jsp"%>