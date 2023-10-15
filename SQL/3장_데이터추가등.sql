USE mydata;

-- 테이블 생성(열 이름, 데이터 타입, not null(필수) 유무, 디폴트 설정)
CREATE TABLE IF NOT EXISTS tasks(
	task_id INT AUTO_INCREMENT
    , title VARCHAR(255) NOT NULL
    , start_date DATE
    , due_date DATE
    , priority TINYINT NOT NULL DEFAULT 3
    , DESCRIPTION TEXT
    , PRIMARY KEY (task_id)
);

-- 교재 p.71
INSERT INTO tasks(title, priority)
VALUES ('Learn MySQL', 1);

SELECT * 
FROM tasks;

INSERT INTO tasks(title, priority)
VALUES ('Learn ORACLE', default);

SELECT * FROM tasks;

-- 다중행 추가 INSERT
INSERT INTO tasks(title, priority)
VALUES 
	('sample_1', 5),
    ('sample_2', 2),
    ('sample_3', 1);

SELECT * FROM tasks;

-- 날짜 추가
INSERT INTO tasks(title, start_date, due_date)
VALUES ('insert date', '2023-10-05', '2023-10-06');

SELECT * FROM tasks;