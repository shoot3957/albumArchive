<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="${ctx}/css/login.css">
    <style>
        /* Modal 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        /* Modal Content */
        .modal-content {
            background-color: rgba(254, 254, 254, 0.95);
            margin: auto;
            padding: 25px;
            border: 1px solid #ddd;
            width: 300px;
            min-height: 400px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: #4CAF50;
            text-decoration: none;
        }

        /* Modal 내부 스타일 */
        .modal-content h2 {
            text-align: center;
            color: #333;
            font-size: 20px;
            margin-bottom: 25px;
        }

        .field label {
            display: block;
            color: #555;
            font-size: 13px;
            margin-bottom: 8px;
            padding-left: 100px;
        }

        .field input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 13px;
            background: #f9f9f9;
            box-sizing: border-box;
            outline: none;
        }

        .field input[type="text"]:focus {
            border-color: #4CAF50;
            background: #fff;
        }

        #button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #4CAF50;
            color: white;
            font-size: 14px;
            cursor: pointer;
            margin-top: 30px;
            transition: background 0Matching3s ease;
        }

        #button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
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
                <a href="#" id="findIdLink">아이디 찾기</a>
                <a href="/albumArchive/findPw.do">비밀번호 찾기</a>
                <a href="/albumArchive/join.do">회원가입</a>
            </div>
        </form>
    </div>

    <!-- 아이디 찾기 모달 -->
    <div id="findIdModal" class="modal">
        <div class="modal-content">
            <span class="close">×</span>
            <h2>아이디 찾기</h2>
            <form id="form">
                <div class="field">
                    <label for="email">이메일</label>
                    <input type="text" name="email" id="email">
                </div>
                <input type="submit" id="button" value="이메일 보내기">
            </form>
        </div>
    </div>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
    <script type="text/javascript">
        emailjs.init('UUDoB79tBIDdGUQ60');
    </script>
    <script src="${ctx}/script/findId.js"></script>
    <script>
        // 모달 관련 JavaScript
        var modal = document.getElementById("findIdModal");
        var btn = document.getElementById("findIdLink");
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

        // EmailJS 전송 로직
        document.getElementById('form').addEventListener('submit', function(e) {
            e.preventDefault();
            const email = document.getElementById('email').value;

            emailjs.send('your_service_id', 'your_template_id', { email: email })
                .then(function(response) {
                    alert('이메일이 성공적으로 전송되었습니다!');
                    modal.style.display = 'none';
                }, function(error) {
                    alert('이메일 전송에 실패했습니다: ' + error);
                });
        });
    </script>
    <%@ include file="../parts/footer.jsp"%>
</body>
</html>