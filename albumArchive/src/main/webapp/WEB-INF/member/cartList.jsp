<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="${ctx}/css/cartList.css">
</head>
<body>
    <div class="cart-container">
        <h1>장바구니</h1>
        
        <c:if test="${empty cartList}">
            <p class="empty-cart">장바구니가 비어 있습니다.</p>
        </c:if>
        
        <c:if test="${not empty cartList}">
            <div class="cart-items">
                <c:forEach var="cartItem" items="${cartList}">
                    <div class="cart-item">
                        <div class="cart-details">
                            <h3>${cartItem.name}</h3>
                            <p>가격: <span class="price">${cartItem.price}</span> 원</p>
                            <p>수량: <span class="qty">${cartItem.qty}</span></p>
                            <p>총 금액: <span class="total">${cartItem.price * cartItem.qty}</span> 원</p>
                        </div>

                        <div class="cart-actions">
                            <!-- 수량 업데이트 -->
                            <form action="cartUpdate.do?id=${loginId}" method="post">
                                <input type="hidden" name="cartId" value="${cartItem.num}" />
                                <input type="number" name="qty" value="${cartItem.qty}" min="1" class="qty-input" />
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

            <!-- 총합 계산 -->
            <div class="cart-summary">
                <p>총합: <span id="cart-total">
                    <c:set var="total" value="0"/>
                    <c:forEach var="cartItem" items="${cartList}">
                        <c:set var="total" value="${total + (cartItem.price * cartItem.qty)}"/>
                    </c:forEach>
                    ${total}
                </span> 원</p>
            </div>

            <!-- 구매하기 버튼 -->
            <form action="checkout.do?id=${loginId}" method="post" class="checkout-form">
                <button type="submit" class="checkout-btn">구매하기</button>
            </form>
        </c:if>
    </div>
    
    <%@ include file="../parts/footer.jsp"%>
</body>
</html>