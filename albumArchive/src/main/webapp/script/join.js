let isIdValid = 0;
const form = document.querySelector('form');
const inputs = form.querySelectorAll('input');
const idInput = document.querySelector('#id');
const checkIdButton = document.querySelector('#checkId');

// 폼 제출 이벤트
form.addEventListener('submit', (event) => {
    event.preventDefault();
    if (isIdValid !== 1) {
        alert('먼저 아이디 중복 확인을 해주세요');
        idInput.focus();
        return;
    }
    if (validateAll()) {
        form.submit();
    }
});

// 실시간 유효성 검사
inputs.forEach(input => {
    input.addEventListener('input', () => validateField(input));
});

// 중복 체크 버튼 이벤트
checkIdButton.addEventListener('click', async () => {
    const id = idInput.value.trim();

    if (!id) {
        alert('ID를 입력해주세요');
        idInput.focus();
        idInput.style.border = '2px solid red';
        return;
    }

    try {
        const response = await fetch('vaildIdAjax.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            },
            body: new URLSearchParams({ id }).toString(),
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const result = await response.text();
        handleIdValidationResult(result);
    } catch (error) {
        console.error('ID validation error:', error);
        alert('아이디 확인 중 오류가 발생했습니다');
        idInput.style.border = '2px solid orange';
    }
});

// ID 입력 시 중복 체크 상태 초기화
idInput.addEventListener('input', () => {
    if (isIdValid !== 0) {
        isIdValid = 0;
        idInput.removeAttribute('readonly');
    }
});

// 필드 유효성 검사 함수
function validateField(input) {
    const value = input.value.trim();
    let isValid = true;
    let message = '';

    switch (input.id) {
        case 'id':
            if (!value) {
                message = '아이디를 입력해주세요';
                isValid = false;
            }
            break;
        case 'pw':
            if (!value) {
                message = '패스워드를 입력해주세요';
                isValid = false;
            } else if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/.test(value)) {
                message = '비밀번호는 4자리 이상, 영어와 숫자를 섞어야 합니다';
                isValid = false;
            }
            break;
        case 'name':
            if (!value) {
                message = '이름을 입력해주세요';
                isValid = false;
            }
            break;
        case 'email':
            if (!value) {
                message = '이메일을 입력해주세요';
                isValid = false;
            } else if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(value)) {
                message = '올바른 이메일 형식이 아닙니다';
                isValid = false;
            }
            break;
        case 'phone':
            if (!value) {
                message = '전화번호를 입력해주세요';
                isValid = false;
            } else if (!/^010-\d{3,4}-\d{4}$/.test(value)) {
                message = '전화번호 형식(010-XXXX-XXXX)이 맞지 않습니다';
                isValid = false;
            }
            break;
        case 'address':
            if (!value) {
                message = '주소를 입력해주세요';
                isValid = false;
            } else if (!/^[가-힣]+시\s*[가-힣]+구$/.test(value)) {
                message = '주소는 "XX시XX구" 형식이어야 합니다 (예: 서울시강남구)';
                isValid = false;
            }
            break;
        case 'age':
            if (!value) {
                message = '나이를 입력해주세요';
                isValid = false;
            } else if (!/^\d+$/.test(value)) {
                message = '나이는 숫자만 입력 가능합니다';
                isValid = false;
            } else {
                const ageNum = parseInt(value, 10);
                if (ageNum < 0 || ageNum > 80) {
                    message = '나이는 0세 이상 80세 이하만 가능합니다';
                    isValid = false;
                }
            }
            break;
    }

    input.style.border = isValid ? '2px solid green' : '2px solid red';
    showError(input, message);

    if (!isValid && document.activeElement !== input) {
        input.focus();
    }

    return isValid;
}

// 모든 필드 유효성 검사
function validateAll() {
    let isValid = true;
    inputs.forEach(input => {
        if (!validateField(input)) {
            isValid = false;
        }
    });
    return isValid && isIdValid === 1;
}

// ID 중복 체크 결과 처리
function handleIdValidationResult(data) {
    const passInput = document.querySelector('#pw');

    switch (data) {
        case 'valid':
            alert('이 아이디는 사용 가능합니다');
            idInput.style.border = '2px solid green';
            idInput.setAttribute('readonly', 'true');
            passInput.focus();
            isIdValid = 1;
            break;
        case 'notValid':
            alert('이 아이디는 사용 불가능합니다');
            idInput.style.border = '2px solid red';
            idInput.value = '';
            idInput.focus();
            isIdValid = -1;
            break;
        default:
            alert('예상치 못한 응답입니다');
            idInput.style.border = '2px solid orange';
            isIdValid = 0;
    }
}

// 오류 메시지 표시
function showError(input, message) {
    let errorElement = input.nextElementSibling;
    if (!errorElement || !errorElement.classList.contains('error-message')) {
        errorElement = document.createElement('div');
        errorElement.classList.add('error-message');
        input.parentNode.insertBefore(errorElement, input.nextSibling);
    }
    errorElement.textContent = message;
    errorElement.style.color = 'red';
}

// 스타일 추가
const style = document.createElement('style');
style.textContent = `
    input[readonly] {
        background-color: #f0f0f0;
    }
    .error-message {
        font-size: 0.8em;
        margin: 2px 0;
    }
`;
document.head.appendChild(style);


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            // 주소 타입에 따라 주소값 가져오기
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            // 도로명 주소일 경우 참고항목을 조합
            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
            } else {
                extraAddr = ''; // 지번 주소일 때는 참고항목을 비워둡니다.
            }

            // 우편번호와 주소를 해당 필드에 넣는다.
            document.getElementById("address").value = addr + extraAddr;  // 주소와 참고항목을 합쳐서 넣기
        }
    }).open();
}
