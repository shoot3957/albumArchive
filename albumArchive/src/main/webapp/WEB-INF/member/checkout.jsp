<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 페이지</title>
</head>
<body>

<h1>구매 내역</h1>

<!-- 장바구니 내용 표시 -->
<c:forEach var="cartItem" items="${cartList}">
    <div class="cart-item">
        <h3>${cartItem.name}</h3>
        <p>가격: ${cartItem.price} 원</p>
        <p>수량: ${cartItem.qty}</p>
        <p>총 금액: ${cartItem.price * cartItem.qty} 원</p>
    </div>
</c:forEach>

<h2>총 금액: ${totalAmount} 원</h2>

<!-- 로그인한 사용자의 캐시(money) 표시 -->
<p>현재 보유한 캐시: ${userMoney} 원</p>

<!-- 결제하기 버튼 -->
<form action="processPurchase.do" method="post">
    <!-- 로그인 ID를 hidden 필드로 전달 -->
    <input type="hidden" name="id" value="${loginId}">
    <button type="submit">결제하기</button>
</form>

</body>
</html>
