<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>어드민 회원 리스트</title>
    <link rel="stylesheet" href="${ctx}/css/adminMemberList.css">
</head>
<body>
    <div class="inner member-container">
        <c:choose>
            <c:when test="${empty memberList}">
                <h2 class="no-reservation">회원이 없습니다!</h2>
            </c:when>
            <c:otherwise>
                <h2 class="member-list">회원 리스트</h2>
                <table class="member-table">
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>비밀번호</th>
                            <th>주소</th>
                            <th>이메일</th>
                            <th>번호</th>
                            <th>나이</th>
                            <th>캐시</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="member" items="${memberList}">
                            <tr>
                                <td>${member.name}</td>
                                <td>${member.id}</td>
                                <td>${member.pw}</td>
                                <td>${member.address}</td>
                                <td>${member.email}</td>
                                <td>${member.phone}</td>
                                <td>${member.age}</td>
                                <td>${member.money}원</td>
                                <td>
                                    <form action="${ctx}/adminMemberDelete.do" method="post">
                                        <input type="hidden" name="id" value="${member.id}">
                                        <button type="submit" class="action-btn delete-btn"
                                            onclick="return confirm('정말 ${member.name}님을 삭제하시겠습니까?');">삭제</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="../parts/footer.jsp"%>
</body>
</html>