use album_record;

-- member 테이블
CREATE TABLE member (
    id VARCHAR(20) NOT NULL PRIMARY KEY ,
    pw VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    age INT NOT NULL
);
-- artist 테이블
CREATE TABLE artist (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    img VARCHAR(50) NOT NULL
);

-- album 테이블
CREATE TABLE album (
    name VARCHAR(50) NOT NULL PRIMARY KEY ,
    artist_num INT NOT NULL,
    info VARCHAR(1000) NOT NULL,
    img VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    likes INT NOT NULL,
    total_qty INT NOT NULL,
    category VARCHAR(50) NOT NULL,
    dates VARCHAR(50) NOT NULL
--     FOREIGN KEY (artist_num) REFERENCES artist(num)
);

-- inquiry 테이블
CREATE TABLE inquiry (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(20) NOT NULL,
    title VARCHAR(50) NOT NULL,
    info VARCHAR(1000) NOT NULL,
    answer VARCHAR(1000) NULL,
    img VARCHAR(50) NULL ,
    checks INT NOT NULL
--     FOREIGN KEY (user_id) REFERENCES member(id)
);

-- cart 테이블
CREATE TABLE cart (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(50) NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    img VARCHAR(50) NOT NULL,
    qty INT NOT NULL
--     FOREIGN KEY (album_name) REFERENCES album(name),
--     FOREIGN KEY (user_id) REFERENCES member(id)
);

-- like 테이블
CREATE TABLE likes (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(50) NOT NULL,
    name VARCHAR(20) NOT NULL
--     FOREIGN KEY (album_name) REFERENCES album(name),
--     FOREIGN KEY (name) REFERENCES member(id)
);



-- purchase 테이블
CREATE TABLE purchase (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(50) NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    total_price INT NOT NULL,
    dday VARCHAR(50) NOT NULL,
    total_qty int not null
--     FOREIGN KEY (album_name) REFERENCES album(name),
--     FOREIGN KEY (user_id) REFERENCES member(id)
);

-- search 테이블
CREATE TABLE search (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    artist_num INT NOT NULL,
    album_name VARCHAR(50) NOT NULL
--     FOREIGN KEY (artist_num) REFERENCES artist(num),
--     FOREIGN KEY (album_name) REFERENCES album(name)
);

-- review 테이블
CREATE TABLE review (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    info VARCHAR(1000) NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    album_name VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL
   --  FOREIGN KEY (user_id) REFERENCES member(id),
--     FOREIGN KEY (album_name) REFERENCES album(name)
);


CREATE TABLE song(
	num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	album_name VARCHAR(50) NOT NULL,
	name VARCHAR(50) NOT NULL
);






INSERT INTO member (id, pw, name, address, email, phone, age) VALUES
('user1', 'pass1234', '김민수', '서울시 강남구', 'minsu@example.com', '010-1234-5678', 25),
('user2', 'abc4321', '이영희', '부산시 해운대구', 'younghee@example.com', '010-9876-5432', 30),
('user3', 'xyz7890', '박지훈', '대구시 중구', 'jihoon@example.com', '010-5555-6666', 22);

INSERT INTO artist (num, name, img) VALUES
(1, 'BTS', '/images/bts.jpg'),
(2, 'BLACKPINK', '/images/blackpink.jpg'),
(3, 'IU', '/images/iu.jpg');

INSERT INTO album (name, artist_num, info, img, price, `like`, total_qty, category, `date`) VALUES
('Dynamite', 1, 'BTS의 대표 앨범', '/images/dynamite.jpg', 25000, 150, 500, 'K-POP', '2020-08-21'),
('The Album', 2, 'BLACKPINK 첫 정규 앨범', '/images/thealbum.jpg', 30000, 200, 300, 'K-POP', '2020-10-02'),
('Love Poem', 3, 'IU 감성 앨범', '/images/lovepoem.jpg', 20000, 120, 400, 'Ballad', '2019-11-01');

INSERT INTO inquiry (num, user_id, title, info, answer, img, `check`) VALUES
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

INSERT INTO song (num, album_name, name) VALUES
(1, 'Dynamite', 'Dynamite'),
(2, 'Dynamite', 'Life Goes On'),
(3, 'The Album', 'How You Like That'),
(4, 'The Album', 'Lovesick Girls'),
(5, 'The Album', 'Pretty Savage'),
(6, 'Love Poem', 'Love Poem'),
(7, 'Love Poem', 'Jam Jam'),
(8, 'Love Poem', 'Blueming');





