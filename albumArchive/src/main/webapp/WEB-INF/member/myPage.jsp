<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/css/myPage.css">
<div class="member-inner">
    <h2 class="member-list">마이페이지</h2>
    
    <form id="updateForm" action="${ctx}/updateMember.do" method="post">
        <table class="member-table">
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
                <td>캐시</td>
                <td>${m.money}원</td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" id="updateButton" value="정보 수정">
                    <a id="chargeButton" class="charge-button">캐시 충전하기</a>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="/albumArchive/deleteMember.do?id=${m.id}" class="delete-button">회원탈퇴</a>
                </td>
            </tr>
        </table>
    </form>

    <!-- 캐시 충전 모달 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">×</span>
            <h3>캐시 충전</h3>
            <form id="chargeForm" action="${ctx}/chargeMoney.do" method="post">
                <input type="hidden" name="id" value="${m.id}">
                <input type="hidden" name="qMoney" value="${m.money}">
                <div class="charge-amount-container">
                    <label for="chargeAmount">충전 금액:</label>
                    <input type="number" id="chargeAmount" name="chargeAmount" min="1000" max="1000000" step="1000" value="1000" required>
                </div>
                <button type="submit">충전하기</button>
            </form>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const updateForm = document.getElementById('updateForm');
    const pwInput = document.getElementById('pw');
    const emailInput = document.getElementById('email');
    const updateButton = document.getElementById('updateButton');

    updateButton.addEventListener('click', function(event) {
        event.preventDefault();

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

        updateForm.submit();
    });

    function isValidEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }
});
</script>

<%@ include file="../parts/footer.jsp"%>
