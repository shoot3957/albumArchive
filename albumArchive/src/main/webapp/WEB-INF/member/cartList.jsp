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
        
        <!-- 수량 조정 -->
        <div class="quantity">
            <button onclick="updateQty(${cartItem.num}, -1)">-</button>
            <span id="qty-${cartItem.num}">${cartItem.qty}</span>
            <button onclick="updateQty(${cartItem.num}, 1)">+</button>
        </div>

        <p>수량: <span id="qty-${cartItem.num}">${cartItem.qty}</span></p>
        <p>총 금액: <span id="total-${cartItem.num}">${cartItem.price * cartItem.qty}</span> 원</p>
        
        <!-- 삭제 버튼 -->
        <button onclick="removeFromCart(${cartItem.num})">삭제</button>
    </div>
</c:forEach>

<script>
    // 장바구니에서 앨범 삭제
    function removeFromCart(cartId) {
        if (confirm('정말로 이 앨범을 장바구니에서 삭제하시겠습니까?')) {
            window.location.href = `${contextPath}/removeFromCart.do?cartId=${cartId}`;
        }
    }

    // 수량 업데이트 (수량 -1 또는 +1)
    function updateQty(cartId, delta) {
        const qtyElement = document.getElementById(`qty-${cartId}`);
        let currentQty = parseInt(qtyElement.innerText);

        // 수량 변경
        currentQty += delta;
        if (currentQty < 1) {
            alert('수량은 최소 1개 이상이어야 합니다.');
            return;
        }

        qtyElement.innerText = currentQty;

        // 총 금액 갱신
        const price = document.getElementById(`total-${cartId}`).innerText;
        const totalPrice = currentQty * parseInt(price);
        document.getElementById(`total-${cartId}`).innerText = totalPrice;

        // 서버로 수량 업데이트 요청
        window.location.href = `${contextPath}/updateCartQty.do?cartId=${cartId}&qty=${currentQty}`;
    }
</script>

</body>
</html>
