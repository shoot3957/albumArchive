<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ctx}/css/login.css">
<link rel="stylesheet" href="${ctx}/css/list.css">
<link rel="stylesheet" href="${ctx}/css/inquiry.css">
<link rel="stylesheet" href="${ctx}/css/purchase.css">
<link rel="stylesheet" href="${ctx}/css/myPage.css">
<title>albumArchive</title>

<body></body>

	<header>
		<div class="container">
			<nav>
				<div class="banner">
			<c:if test="${loginId eq 'admin'}">
					<a href="/albumArchive/adminMemberList.do">회원관리</a>
					<a href="/albumArchive/join.do">앨범관리</a>
					<a href="/albumArchive/adminInquiryList.do">문의관리</a>
					<a href="/albumArchive/adminPurchaseList.do">판매리스트</a>
					<a href="/albumArchive/join.do">리뷰관리</a>
					<a href="${ctx}/logout.do">로그아웃</a>
			</c:if>
			<c:if test="${loginId eq null}">
					<a href="/albumArchive/join.do">회원가입</a>
					<a href="${ctx}/login.do">로그인</a>
			</c:if>
			<c:if test="${loginId ne null and loginId ne 'admin'}">
                        <a href="${ctx}/cartList.do?id=${loginId}">장바구니</a>
                        <a href="/albumArchive/adminInquiryList.do">문의하기</a>
                        <a href="${ctx}/myPage.do?id=${loginId}">마이페이지</a>
                        <a href="/albumArchive/memberPurchaseList.do?id=${loginId}">구매내역</a>
                        <a href="${ctx}/logout.do">로그아웃</a>
                    </c:if>
				</div>
			</nav>

			

		</div>
	</header>