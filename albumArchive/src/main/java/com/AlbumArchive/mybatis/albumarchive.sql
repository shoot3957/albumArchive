USE album_record;

-- 회원(member) 테이블
CREATE TABLE member (
    id VARCHAR(20) NOT NULL PRIMARY KEY,
    pw VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    age INT NOT NULL
);

-- 아티스트(artist) 테이블
CREATE TABLE artist (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    img VARCHAR(100) NOT NULL
);

-- 앨범(album) 테이블
CREATE TABLE album (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    artist_num INT NOT NULL,
    info VARCHAR(1000) NOT NULL,
    price INT NOT NULL,
    likes INT NOT NULL,
    total_qty INT NOT NULL,
    category VARCHAR(50) NOT NULL,
    dates VARCHAR(50) NOT NULL,
    img VARCHAR(100) NOT NULL
);

-- 문의(inquiry) 테이블
CREATE TABLE inquiry (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    info VARCHAR(1000) NOT NULL,
    answer VARCHAR(1000) NULL,
    img VARCHAR(50) NULL,
    checks INT NOT NULL
);

-- 장바구니(cart) 테이블
CREATE TABLE cart (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_num INT NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    qty INT NOT NULL,
    img VARCHAR(100) NOT NULL
);

-- 좋아요(likes) 테이블
CREATE TABLE likes (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_num INT NOT NULL,
    name VARCHAR(20) NOT NULL
);

-- 구매(purchase) 테이블
CREATE TABLE purchase (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_num INT NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    total_price INT NOT NULL,
    dday VARCHAR(50) NOT NULL,
    total_qty INT NOT NULL,
    img VARCHAR(100) NOT NULL
);

-- 검색(search) 테이블
CREATE TABLE search (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    artist_num INT NOT NULL,
    album_name INT NOT NULL
);

-- 리뷰(review) 테이블
CREATE TABLE review (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    info VARCHAR(1000) NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    album_num INT NOT NULL,
    title VARCHAR(50) NOT NULL
);

-- 노래(song) 테이블
CREATE TABLE song (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    album_num INT NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- 데이터 삽입
INSERT INTO member (id, pw, name, address, email, phone, age) VALUES
('user1', 'pass1234', '김민수', '서울시 강남구', 'minsu@example.com', '010-1234-5678', 25),
('user2', 'abc4321', '이영희', '부산시 해운대구', 'younghee@example.com', '010-9876-5432', 30),
('user3', 'xyz7890', '박지훈', '대구시 중구', 'jihoon@example.com', '010-5555-6666', 22);

INSERT INTO artist (name, img) VALUES
('BTS', '/images/artists/bts.jpg'),
('BLACKPINK', '/images/artists/blackpink.jpg'),
('IU', '/images/artists/iu.jpg');

INSERT INTO album (name, artist_num, info, price, likes, total_qty, category, dates, img) VALUES
('Dynamite', 1, 'BTS의 대표 앨범', 25000, 150, 500, 'K-POP', '2020-08-21', '/images/albums/dynamite.jpg'),
('The Album', 2, 'BLACKPINK 첫 정규 앨범', 30000, 200, 300, 'K-POP', '2020-10-02', '/images/albums/thealbum.jpg'),
('Love Poem', 3, 'IU 감성 앨범', 20000, 120, 400, 'Ballad', '2019-11-01', '/images/albums/lovepoem.jpg');

INSERT INTO inquiry (user_id, title, info, answer, img, checks) VALUES
('user1', '배송 문의', '언제 배송되나요?', '3일 내 배송 예정입니다.', NULL, 1),
('user2', '환불 요청', '환불 어떻게 하나요?', NULL, '/images/refund.jpg', 0),
('user3', '앨범 재고', '재고 있나요?', '현재 재고 50개 남았습니다.', NULL, 1);

INSERT INTO cart (album_num, user_id, price, qty, img) VALUES
(1, 'user1', 25000, 2, '/images/albums/dynamite.jpg'),
(2, 'user2', 30000, 1, '/images/albums/thealbum.jpg'),
(3, 'user3', 20000, 3, '/images/albums/lovepoem.jpg');

INSERT INTO likes (album_num, name) VALUES
(1, 'user1'),
(2, 'user2'),
(3, 'user3');

INSERT INTO purchase (album_num, user_id, total_price, dday, total_qty, img) VALUES
(1, 'user1', 50000, '2025-03-15', 2, '/images/albums/dynamite.jpg'),
(2, 'user2', 30000, '2025-03-16', 1, '/images/albums/thealbum.jpg'),
(3, 'user3', 60000, '2025-03-17', 3, '/images/albums/lovepoem.jpg');

INSERT INTO search (category, artist_num, album_name) VALUES
('K-POP', 1, 1),
('K-POP', 2, 2),
('Ballad', 3, 3);

INSERT INTO review (info, user_id, album_num, title) VALUES
('정말 좋은 앨범이에요!', 'user1', 1, '최고의 앨범'),
('노래가 너무 좋아요', 'user2', 2, '강추!'),
('감성적인 앨범', 'user3', 3, 'IU 최고');

INSERT INTO song (album_num, name) VALUES
(1, 'Dynamite'),
(1, 'Life Goes On'),
(2, 'How You Like That'),
(2, 'Lovesick Girls'),
(2, 'Pretty Savage'),
(3, 'Love Poem'),
(3, 'Jam Jam'),
(3, 'Blueming');