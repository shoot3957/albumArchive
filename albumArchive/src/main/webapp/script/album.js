// 앨범이 없을 때 호출되는 함수
function alertNoAlbum() {
    alert('앨범이 없습니다.');
    history.back();  // 이전 페이지로 돌아가기
}

// 장르가 선택되지 않았을 때 호출되는 함수
function alertNoGenre() {
    alert('장르를 선택해주세요.');
    history.back();  // 이전 페이지로 돌아가기
}

// 장르별 앨범이 없을 때, 메인 페이지로 리디렉션하는 함수
function redirectToHomePage(message) {
    alert(message);  // 동적으로 메시지를 전달받아서 사용
    window.location.href = 'main.do';  // 메인 페이지로 리디렉션
}
