<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="./${ctx}/css/cartList.css">
</head>
<body>

<h1>장바구니</h1>

<div class="cart-container">
    <c:forEach var="cartItem" items="${cartList}">
        <div class="cart-item">
            <div class="cart-details">
                <h3>${cartItem.name}</h3>
                <p>가격: ${cartItem.price} 원</p>
                <p>수량: ${cartItem.qty}</p>
                <p>총 금액: ${cartItem.price * cartItem.qty} 원</p>
            </div>

            <div class="cart-actions">
                <!-- 수량 업데이트 -->
                <form action="cartUpdate.do?id=${loginId}" method="post">
                    <input type="hidden" name="cartId" value="${cartItem.num}" />
                    <input type="number" name="qty" value="${cartItem.qty}" min="1" />
                    <button type="submit" class="update-btn">수량 변경</button>
                </form>

                <!-- 삭제 버튼 -->
                <form action="cartRemove.do?id=${loginId}" method="post">
                    <input type="hidden" name="cartId" value="${cartItem.num}" />
                    <button type="submit" class="delete-btn">삭제</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>

<!-- 구매하기 버튼 -->
<form action="checkout.do?id=${loginId}" method="post">
    <button type="submit" class="checkout-btn">구매하기</button>
</form>

</body>
</html>