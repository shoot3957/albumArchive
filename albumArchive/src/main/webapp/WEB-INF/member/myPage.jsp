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
                <td>캐시</td>
                <td>${m.money}원</td>
            </tr>
            <tr>
    		    <td colspan="2" align="center">
      			    <input type="submit" id="updateButton" value="정보 수정">
      			    <a id="chargeButton" class="charge-button">캐시 충전하기</a>
   				 </td>
			</tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="/albumArchive/deleteMember.do?id=${m.id}">회원탈퇴</a>
                </td>
            </tr>
        </table>
    </form>

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
            pwInput.style.border = '2px solid red';
            return;
        } else if (!/^[가-힣]+시\s*[가-힣]+구$/.test(addressInput.value)) {
            alert('주소는 "XX시 XX구" 형식이어야 합니다 (예: 서울시 강남구)');
            addressInput.focus();
            pwInput.style.border = '2px solid red';
            return;
        } else {
            pwInput.style.border = '';
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
            pwInput.style.border = '2px solid red';
            return;
        } else {
            pwInput.style.border = '';
        }

        // 모든 유효성 검사 통과 후 폼 제출
        updateForm.submit();
    });

    // 이메일 유효성 검사 함수
    function isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    var modal = document.getElementById("myModal");

    var btn = document.getElementById("chargeButton");

    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    const chargeForm = document.getElementById('chargeForm');
    chargeForm.addEventListener('submit', function(event) {
        const chargeAmountInput = document.getElementById('chargeAmount');
        const chargeAmount = parseInt(chargeAmountInput.value);

        if (chargeAmount < 1000) {
            alert('최소 충전 금액은 1,000원 입니다.');
            event.preventDefault(); // 폼 제출 막기
            chargeAmountInput.focus();
        } else if (chargeAmount > 1000000) {
            alert('최대 충전 금액은 1,000,000원 입니다.');
            event.preventDefault(); // 폼 제출 막기
            chargeAmountInput.focus();
        }
    });
});
</script>
<%@ include file="../parts/footer.jsp"%>

<style>
/* 모달 스타일 */
.modal {
  display: none; /* 기본적으로 숨김 */
  position: fixed; /* 화면에 고정 */
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
  z-index: 1000; /* 다른 요소 위에 표시 */
  overflow: auto; /* 내용이 넘치면 스크롤 */
}

/* 모달 내용 스타일 */
.modal-content {
  position: relative;
  background-color: #fff;
  margin: 10% auto; /* 화면 중앙에 배치 */
  padding: 20px;
  border-radius: 5px;
  width: 80%;
  max-width: 500px; /* 최대 너비 제한 */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* 닫기 버튼 스타일 */
.close {
  position: absolute;
  top: 0;
  right: 0;
  padding: 10px;
  color: #aaa;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
}

/* 폼 스타일 */
#chargeForm {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

#chargeForm label {
  font-weight: bold;
}

#chargeForm input[type="number"] {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

#chargeForm button {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

#chargeForm button:hover {
  background-color: #45a049;
}

/* "충전 금액:" 레이블과 입력 필드를 가로로 정렬 */
.charge-amount-container {
  display: flex;
  align-items: center; /* 세로 중앙 정렬 */
  gap: 10px; /* 레이블과 입력 필드 사이 간격 */
}
</style>