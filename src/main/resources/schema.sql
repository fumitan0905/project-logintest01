DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS login_user;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS performance ;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS health;
DROP TABLE IF EXISTS cook;

-- ロール
CREATE TABLE roles(
    id INTEGER PRIMARY KEY,    -- ロールのID
    name VARCHAR(32) NOT NULL  -- ロールの名前
);

-- ユーザー
CREATE TABLE login_user(
    id INTEGER PRIMARY KEY,         -- ユーザーのID
    name VARCHAR(128) NOT NULL,     -- ユーザーの表示名
    email VARCHAR(256) NOT NULL,    -- メールアドレス（ログイン時に利用）
    password VARCHAR(128) NOT NULL  -- ハッシュ化済みのパスワード
);

-- ユーザーとロールの対応付け
CREATE TABLE user_role(
    user_id INTEGER,    -- ユーザーのID
    role_id INTEGER,    -- ロールのID
    CONSTRAINT pk_user_role PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_user_role_user_id FOREIGN KEY (user_id) REFERENCES login_user(id),
    CONSTRAINT fk_user_role_role_id FOREIGN KEY (role_id) REFERENCES roles(id)
);


-- 選手テーブル
CREATE TABLE players
(
   id SERIAL PRIMARY KEY,
   player_Id INTEGER,
   name TEXT,
   height INTEGER,
   weight INTEGER,
   age INTEGER,
   position TEXT,
   birthplace TEXT,
   body_fat_per INTEGER
);

--成績テーブル
CREATE TABLE performance
(
   id SERIAL PRIMARY KEY,
   
   goals INTEGER,
   asists INTEGER,
   foul INTEGER,
   fouled INTEGER,
   yellowcard INTEGER,
   redcard INTEGER,
   games INTEGER,
   player_id INTEGER REFERENCES Players(id)
);

-- コメントテーブル
CREATE TABLE comments
(
   id SERIAL PRIMARY KEY,
   title TEXT,
   mail TEXT,
   content TEXT,
   createdAt TIMESTAMP
);

-- 健康管理テーブル
CREATE TABLE health
(
	id SERIAL PRIMARY KEY,
	player_health_id INTEGER REFERENCES Players(id),
	wakeup_time TIME,
	bedtime_time TIME,
	breakfast_id INTEGER,
	lunch_id INTEGER,
	dinner_id INTEGER,
	eat_date DATE
);

-- 料理テーブル
CREATE TABLE cook
(
	id SERIAL PRIMARY KEY,
	dish_name TEXT,
	dish_calories INTEGER
);