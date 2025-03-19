
const ctx = "${pageContext.request.contextPath}";
document.getElementById('emailForm').addEventListener('submit', function (event) {
    event.preventDefault();

    // EmailJS 초기화 (DOMContentLoaded 안으로 이동하지 않아도 즉시 실행 가능)
    emailjs.init('UUDoB79tBIDdGUQ60'); // JSP에서 사용된 Public Key로 유지

    const btn = document.getElementById('button');
    const email = document.getElementById('email').value;
    const rdCode = document.getElementById('rdCode').value; // JSP에서 hidden input으로 전달된 rdCode
	const myCode = document.getElementById('myCode').value;

    if (!email) {
        alert("이메일을 입력하세요.");
        return;
    }

    btn.value = '확인 중...';

    // AJAX 요청으로 이메일 유효성 검사 (필요 시 유지, 여기서는 생략 가능)
    fetch('validEmailAjax.do', { // 컨텍스트 경로 추가
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'email=' + encodeURIComponent(email)
    })
    .then(response => response.json())
    .then(data => {
        if (!data.id) { // 서버에서 이메일 유효성을 boolean으로 반환한다고 가정
            alert("해당 이메일 주소를 가진 계정이 존재하지 않습니다.");
            btn.value = 'Send Email';
        } else {
            sendEmail(email, rdCode, myCode); // rdCode를 전송
        }
    })
    .catch(error => {
        console.error('오류 발생:', error);
        alert("서버 요청 중 오류가 발생했습니다.");
        btn.value = 'Send Email';
    });
});

// EmailJS를 사용하여 이메일 전송하는 함수
function sendEmail(email, rdCode,myCode) {
    const btn = document.getElementById('button');
    btn.value = 'Sending...';

    const serviceID = 'service_q57z5p7';
    const templateID = 'template_mrojhyu';
	console.log(email);

    // 전송할 데이터
    const emailParams = {
        user_email: email,
        rd_code: rdCode // rdCode를 템플릿에 전달
    };
    console.log("EmailJS에 전달할 데이터:", emailParams);

    emailjs.send(serviceID, templateID, emailParams)
    .then((response) => {
        console.log("EmailJS 응답:", response);
        btn.value = 'Send Email';
        alert('인증 코드가 이메일로 전송되었습니다!');
		fetch('checkRdCode.do', {
		            method: 'POST',
		            headers: {
		                'Content-Type': 'application/x-www-form-urlencoded'
		            },
		            body: 'email=' + encodeURIComponent(email) + '&rdCode=' + encodeURIComponent(rdCode) + 
					'&myCode=' + encodeURIComponent(myCode)
		        })
		        .then(response => {
		            if (!response.ok) throw new Error('서버 응답 오류');
		            return response.text(); // JSP로 이동 시 HTML 반환 가정
		        })
		        .then(html => {
		            // 서버가 JSP의 HTML을 반환하면 DOM에 반영하거나 리디렉션
		            document.body.innerHTML = html; // 예: 새로운 JSP 내용을 페이지에 표시
		            // 또는 리디렉션: window.location.href = ctx + '/verifyCodeController.do';
		        })
		        .catch(err => {
		            console.error('컨트롤러 이동 오류:', err);
		            alert('페이지 이동 중 오류가 발생했습니다.');
		        });
    })
    .catch(err => {
        console.error('이메일 전송 오류:', err);
        btn.value = 'Send Email';
        alert('이메일 전송에 실패했습니다.');
    });
}