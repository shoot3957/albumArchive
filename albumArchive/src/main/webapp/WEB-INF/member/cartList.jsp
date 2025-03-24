<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
   
    
</head>
<body>

<h1>장바구니</h1>

<!-- 장바구니 목록 출력 -->
<c:forEach var="cartItem" items="${cartList}">
    <div class="cart-item">
        <img src="${pageContext.request.contextPath}/images/${cartItem.album_num}.jpg" alt="${cartItem.album_num}" class="cart-item-img">
        <h3>${cartItem.album_num}</h3>
        <p>가격: ${cartItem.price} 원</p>
        
        <!-- 수량 조절 -->
        <form action="cartUpdate.do" method="post">
            <input type="hidden" name="cartId" value="${cartItem.num}" />
            <input type="number" name="qty" value="${cartItem.qty}" min="1" />
            <button type="submit">수량 업데이트</button>
        </form>

        <!-- 장바구니 항목 삭제 -->
        <form action="cartRemove.do" method="post">
            <input type="hidden" name="cartId" value="${cartItem.num}" />
            <button type="submit">삭제</button>
        </form>

        <p>수량: ${cartItem.qty}</p>
        <p>총 금액: ${cartItem.price * cartItem.qty} 원</p>
    </div>
</c:forEach>

</body>
</html>
