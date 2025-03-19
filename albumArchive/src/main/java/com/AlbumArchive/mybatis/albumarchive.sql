USE album_record;

-- 회원(member) 테이블
CREATE TABLE member (
    id VARCHAR(20) NOT NULL PRIMARY KEY, -- 회원 ID (기본 키)
    pw VARCHAR(20) NOT NULL, -- 비밀번호
    name VARCHAR(50) NOT NULL, -- 이름
    address VARCHAR(50) NOT NULL, -- 주소
    email VARCHAR(50) NOT NULL, -- 이메일
    phone VARCHAR(20) NOT NULL, -- 전화번호
    age INT NOT NULL -- 나이
);

-- 아티스트(artist) 테이블
CREATE TABLE artist (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()), -- 아티스트 ID (UUID, 자동 생성)
    name VARCHAR(20) NOT NULL, -- 아티스트 이름
    img VARCHAR(50) NOT NULL -- 이미지 경로
);

-- 앨범(album) 테이블
CREATE TABLE album (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()), -- 앨범 ID (UUID, 자동 생성)
    name VARCHAR(50) NOT NULL, -- 앨범 이름
    artist_num INT NOT NULL, -- 아티스트 번호 (참고: artist 테이블의 id와 연결하려면 수정 필요)
    info VARCHAR(1000) NOT NULL, -- 앨범 정보
    img VARCHAR(50) NOT NULL, -- 이미지 경로
    price INT NOT NULL, -- 가격
    likes INT NOT NULL, -- 좋아요 수
    total_qty INT NOT NULL, -- 총 재고 수량
    category VARCHAR(50) NOT NULL, -- 카테고리
    dates VARCHAR(50) NOT NULL -- 발매일
);

-- 문의(inquiry) 테이블
CREATE TABLE inquiry (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 문의 번호 (자동 증가)
    user_id VARCHAR(20) NOT NULL, -- 회원 ID
    title VARCHAR(50) NOT NULL, -- 문의 제목
    info VARCHAR(1000) NOT NULL, -- 문의 내용
    answer VARCHAR(1000) NULL, -- 답변 (NULL 가능)
    img VARCHAR(50) NULL, -- 이미지 경로 (NULL 가능)
    checks INT NOT NULL -- 확인 여부
);

-- 장바구니(cart) 테이블
CREATE TABLE cart (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 장바구니 번호 (자동 증가)
    album_name VARCHAR(50) NOT NULL, -- 앨범 이름
    user_id VARCHAR(20) NOT NULL, -- 회원 ID
    price INT NOT NULL, -- 가격
    img VARCHAR(50) NOT NULL, -- 이미지 경로
    qty INT NOT NULL -- 수량
);

-- 좋아요(likes) 테이블
CREATE TABLE likes (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 좋아요 번호 (자동 증가)
    album_name VARCHAR(50) NOT NULL, -- 앨범 이름
    name VARCHAR(20) NOT NULL -- 회원 ID (member.id를 참조한다고 가정)
);

-- 구매(purchase) 테이블
CREATE TABLE purchase (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 구매 번호 (자동 증가)
    album_name VARCHAR(50) NOT NULL, -- 앨범 이름
    user_id VARCHAR(20) NOT NULL, -- 회원 ID
    total_price INT NOT NULL, -- 총 가격
    dday VARCHAR(50) NOT NULL, -- 배송일
    total_qty INT NOT NULL -- 총 구매 수량
);

-- 검색(search) 테이블
CREATE TABLE search (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 검색 번호 (자동 증가)
    category VARCHAR(50) NOT NULL, -- 카테고리
    artist_num INT NOT NULL, -- 아티스트 번호
    album_name VARCHAR(50) NOT NULL -- 앨범 이름
);

-- 리뷰(review) 테이블
CREATE TABLE review (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 리뷰 번호 (자동 증가)
    info VARCHAR(1000) NOT NULL, -- 리뷰 내용
    user_id VARCHAR(20) NOT NULL, -- 회원 ID
    album_name VARCHAR(50) NOT NULL, -- 앨범 이름
    title VARCHAR(50) NOT NULL -- 리뷰 제목
);

-- 노래(song) 테이블
CREATE TABLE song (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()), -- 노래 ID (UUID, 자동 생성)
    album_name VARCHAR(50) NOT NULL, -- 앨범 이름
    name VARCHAR(50) NOT NULL -- 노래 제목
);





INSERT INTO member (id, pw, name, address, email, phone, age) VALUES
('user1', 'pass1234', '김민수', '서울시 강남구', 'minsu@example.com', '010-1234-5678', 25),
('user2', 'abc4321', '이영희', '부산시 해운대구', 'younghee@example.com', '010-9876-5432', 30),
('user3', 'xyz7890', '박지훈', '대구시 중구', 'jihoon@example.com', '010-5555-6666', 22);

INSERT INTO artist (id, name, img) VALUES
('3Nrfpe0tUJi4K4DXYWgMUX', 'BTS', '/images/bts.jpg'),
('41MozSoPIsD1dJM0CLPjZF', 'BLACKPINK', '/images/blackpink.jpg'),
('3HqSLMAZ3g3d5poNaI7GOU', 'IU', '/images/iu.jpg');

INSERT INTO album (id, name, artist_num, info, img, price, likes, total_qty, category, dates) VALUES
('1Yo63a5AzPMyHiYMKYIrld','Dynamite', 1, 'BTS의 대표 앨범', '/images/dynamite.jpg', 25000, 150, 500, 'K-POP', '2020-08-21'),
('2gNPnKP1PDkB5SZz3IMKuX','The Album', 2, 'BLACKPINK 첫 정규 앨범', '/images/thealbum.jpg', 30000, 200, 300, 'K-POP', '2020-10-02'),
('2xEH7SRzJq7LgA0fCtTlxH', 'Love Poem', 3, 'IU 감성 앨범', '/images/lovepoem.jpg', 20000, 120, 400, 'Ballad', '2019-11-01');

INSERT INTO inquiry (num, user_id, title, info, answer, img, checks) VALUES
(1, 'user1', '배송 문의', '언제 배송되나요?', '3일 내 배송 예정입니다.', NULL, 1),
(2, 'user2', '환불 요청', '환불 어떻게 하나요?', null, '/images/refund.jpg', 0),
(3, 'user3', '앨범 재고', '재고 있나요?', '현재 재고 50개 남았습니다.', NULL, 1);

INSERT INTO cart (num, album_name, user_id, price, img, qty) VALUES
(1, 'Dynamite', 'user1', 25000, '/images/dynamite.jpg', 2),
(2, 'The Album', 'user2', 30000, '/images/thealbum.jpg', 1),
(3, 'Love Poem', 'user3', 20000, '/images/lovepoem.jpg', 3);

INSERT INTO likes (num, album_name, name) VALUES
(1, 'Dynamite', 'user1'),
(2, 'The Album', 'user2'),
(3, 'Love Poem', 'user3');

INSERT INTO purchase (num, album_name, user_id, total_price, dday,total_qty) VALUES
(1, 'Dynamite', 'user1', 50000, '2025-03-15',2),
(2, 'The Album', 'user2', 30000, '2025-03-16',1),
(3, 'Love Poem', 'user3', 60000, '2025-03-17',3);

INSERT INTO search (num, category, artist_num, album_name) VALUES
(1, 'K-POP', 1, 'Dynamite'),
(2, 'K-POP', 2, 'The Album'),
(3, 'Ballad', 3, 'Love Poem');

INSERT INTO review (num, info, user_id, album_name, title) VALUES
(1, '정말 좋은 앨범이에요!', 'user1', 'Dynamite', '최고의 앨범'),
(2, '노래가 너무 좋아요', 'user2', 'The Album', '강추!'),
(3, '감성적인 앨범', 'user3', 'Love Poem', 'IU 최고');

INSERT INTO song (id, album_name, name) VALUES
('72IwoG8tqvIWV10IHjpNNA', 'Dynamite', 'Dynamite'),
('2klid0zSCvIkOjXa0EKbVd', 'Dynamite', 'Life Goes On'),
('6bvZRLLkBKkmgpBJTTj3QK', 'The Album', 'How You Like That'),
('1GMufNnkKAnPLnqKJ5HHxW', 'The Album', 'Lovesick Girls'),
('28tufPkTcXmdNqTvi9hsoG', 'The Album', 'Pretty Savage'),
('7HrE6HtYNBbGqp5GmHbFV0', 'Love Poem', 'Love Poem'),
('3h7WIL3B6nP3171zl6HWj8', 'Love Poem', 'Jam Jam'),
('4Dr2hJ3EnVh2Aaot6fRwDO', 'Love Poem', 'Blueming');

