<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 이 footer 태그는 body의 마지막 자식 요소로 와야 합니다. --%>
<footer>
    <div class="footer-content">
      <p>앨범 판매 사이트 © 2025</p>
      <%-- 링크들을 span이나 목록(ul/li)으로 감싸면 더 구조적입니다 --%>
      <span>이용약관</span> |
      <span>이메일 무단수집거부</span> |
      <span>게임정보 취급(처리)방침</span> |
      <span>윤리경영</span> |
      <span>보안신고</span> |
      <span>Contact Us</span> |
      <span>사업장 소개</span> |
      <span>사이트맵</span> |
      <span>웹접근성 도움말</span><br /> <%-- 작은 화면에서는 CSS로 숨겨질 수 있음 --%>
      <%-- 저작권 문구도 p 태그로 감싸는 것이 좋음 --%>
      <p style="margin-top: 10px;">COPYRIGHTⓒ2024 PARK YEONMI, All rights reserved.</p>
    </div>
</footer>

<%-- 주의: 이 파일은 단독으로 완전한 HTML 페이지가 아닙니다. --%>
<%-- </body>와 </html> 태그는 이 파일을 include하는 상위 JSP 파일에 있어야 합니다. --%>