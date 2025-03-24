document.getElementById('form').addEventListener('submit', function (event) {
    event.preventDefault();

	document.addEventListener("DOMContentLoaded", function () {
	    emailjs.init("service_q57z5p7");  // EmailJS 초기화
	});

    const btn = document.getElementById('button');
    const email = document.getElementById('email').value;

    if (!email) {
        alert("이메일을 입력하세요.");
        return;
    }

    btn.value = '확인 중...';

    // AJAX 요청으로 이메일 유효성 검사
    fetch('validEmailAjax.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'email=' + encodeURIComponent(email)
    })
    .then(response => response.json())
    .then(data => {
        if (!data.id) {
            alert("해당 이메일 주소를 가진 아이디가 존재하지 않습니다.");
            btn.value = 'Send Email';
        } else {
            // EmailJS를 이용하여 이메일 전송
            sendEmail(data.id, email);
        }
    })
    .catch(error => {
        console.error('오류 발생:', error);
        alert("서버 요청 중 오류가 발생했습니다.");
        btn.value = 'Send Email';
    });
});

// EmailJS를 사용하여 이메일 전송하는 함수
function sendEmail(userId, email) {
    const btn = document.getElementById('button');
    btn.value = 'Sending...';

    const serviceID = 'service_q57z5p7';
    const templateID = 'template_v9y5tt2';

    // 전송할 데이터 확인
    const emailParams = {
        user_id: userId,
        user_email: email
    };
    console.log("EmailJS에 전달할 데이터:", emailParams);

    emailjs.send(serviceID, templateID, emailParams)
    .then((response) => {
        console.log("EmailJS 응답:", response);
        btn.value = 'Send Email';
        alert('이메일이 성공적으로 전송되었습니다!');

        // main.do로 페이지 이동
        window.location.href = "/albumArchive/login.do";

    })
    .catch(err => {
        console.error('이메일 전송 오류:', err);
        btn.value = 'Send Email';
        alert('이메일 전송에 실패했습니다.');
    });
}