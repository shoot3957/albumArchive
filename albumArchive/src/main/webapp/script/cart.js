/**
 * 
 */// 수량 업데이트 요청을 보내는 JavaScript 예시
function updateCartQuantity(cartId, qty) {
    fetch(`/cartUpdate.do`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `cartId=${cartId}&qty=${qty}`,
    })
    .then(response => {
        if (response.ok) {
            window.location.reload();  // 장바구니 페이지로 리디렉션
        } else {
            console.error("수량 업데이트 실패");
        }
    })
    .catch(error => console.error('Error:', error));
}
