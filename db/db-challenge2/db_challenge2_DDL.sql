-- 
-- ユーザー情報テーブル
--

CREATE TABLE users (
    user_id INT(10) PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    introduction VARCHAR(1000),
    office_phone_number VARCHAR(13),
    cell_phone_number VARCHAR(13),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL
) ENGINE=InnoDB;

-- 
-- チャットルームテーブル
--

CREATE TABLE chatrooms (
    chatroom_id INT(10) PRIMARY KEY AUTO_INCREMENT,
    chatroom_name VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    file_transmission TINYINT(1) DEFAULT 0 NOT NULL,
    direct_chat TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT(10) REFERENCES users (user_id) NOT NULL,
    update_at DATETIME NOT NULL,
    update_by INT(10) REFERENCES users (user_id) NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL
) ENGINE=InnoDB;

-- 
-- ユーザー参加ルームテーブル
--

CREATE TABLE users_chatrooms (
    user_id INT(10) REFERENCES users (user_id),
    chatroom_id INT(10) REFERENCES chatroom (chatroom_id),
    joined_at DATETIME NOT NULL,
    PRIMARY KEY(user_id, chatroom_id)
) ENGINE=InnoDB;

-- 
-- タスクテーブル
--

CREATE TABLE tasks (
    task_id INT(10) PRIMARY KEY AUTO_INCREMENT,
    management_user_id INT(10) REFERENCES users (user_id) NOT NULL,
    chatroom_id INT(10) REFERENCES chatrooms (chatroom_id) NOT NULL,
    deadline DATETIME,
    is_compleated TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT(10) REFERENCES users (user_id) NOT NULL,
    update_at DATETIME NOT NULL,
    update_by INT(10) REFERENCES users (user_id) NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL
) ENGINE=InnoDB;

-- 
-- 投稿テーブル
--

CREATE TABLE posts (
    post_id INT(10) PRIMARY KEY AUTO_INCREMENT,
    post_text VARCHAR(1000) NOT NULL,
    chatroom_id INT(10) REFERENCES chatrooms (chatroom_id) NOT NULL,
    post_file_name VARCHAR(100),
    created_at DATETIME NOT NULL,
    created_by INT(10) REFERENCES users (user_id) NOT NULL,
    update_at DATETIME NOT NULL,
    update_by INT(10) REFERENCES users (user_id) NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL
) ENGINE=InnoDB;
