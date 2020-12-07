-- 
-- ユーザー情報テーブル
--

CREATE TABLE users (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    introduction VARCHAR(1000),
    office_phone_number VARCHAR(13),
    cell_phone_number VARCHAR(13),
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) ENGINE=InnoDB;

-- 
-- チャットルームテーブル
--

CREATE TABLE chatrooms (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    chatroom_name VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    file_transmission TINYINT(1) DEFAULT 0 NOT NULL,
    direct_chat TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT(10) NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT(10) NOT NULL,
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
) ENGINE=InnoDB;

-- 
-- ユーザー参加ルームテーブル
--

CREATE TABLE users_chatrooms (
    user_id INT(10) REFERENCES users (id),
    chatroom_id INT(10) REFERENCES chatrooms (id),
    joined_at DATETIME NOT NULL,
    PRIMARY KEY(user_id, chatroom_id)
) ENGINE=InnoDB;

-- 
-- タスクテーブル
--

CREATE TABLE tasks (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    chatroom_id INT(10) NOT NULL,
    task_content VARCHAR(1000) NOT NULL,
    management_user_id INT(10) NOT NULL,
    deadline DATETIME,
    is_compleated TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT(10) NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT(10) NOT NULL,
    FOREIGN KEY (management_user_id) REFERENCES users(id),
    FOREIGN KEY (chatroom_id) REFERENCES chatrooms(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
) ENGINE=InnoDB;

-- 
-- 投稿テーブル
--

CREATE TABLE posts (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    post_text VARCHAR(1000) NOT NULL,
    chatroom_id INT(10) NOT NULL,
    post_file_name VARCHAR(100),
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created_at DATETIME NOT NULL,
    created_by INT(10) NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by INT(10) NOT NULL,
    FOREIGN KEY (chatroom_id) REFERENCES chatrooms(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
) ENGINE=InnoDB;
