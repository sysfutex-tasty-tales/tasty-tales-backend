---------- TABLES ----------

CREATE TABLE IF NOT EXISTS user_details
(
    user_id                    BIGINT REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE PRIMARY KEY,

    username                   VARCHAR UNIQUE       NOT NULL,
    password_hash              VARCHAR              NOT NULL,

    is_account_non_expired     BOOLEAN DEFAULT TRUE NOT NULL,
    is_account_non_locked      BOOLEAN DEFAULT TRUE NOT NULL,
    is_credentials_non_expired BOOLEAN DEFAULT TRUE NOT NULL,
    is_enabled                 BOOLEAN DEFAULT TRUE NOT NULL
);

---------- COMMENTS ----------

COMMENT ON TABLE user_details IS 'Информация о пользователе';

COMMENT ON COLUMN user_details.user_id IS 'ID пользователя';
COMMENT ON COLUMN user_details.username IS 'Имя пользователя';
COMMENT ON COLUMN user_details.password_hash IS 'Хэш пароля';
COMMENT ON COLUMN user_details.is_account_non_expired IS 'Не истек ли срок действия учетной записи';
COMMENT ON COLUMN user_details.is_account_non_locked IS 'Не заблокирована ли учетная запись';
COMMENT ON COLUMN user_details.is_credentials_non_expired IS 'Не истек ли срок действия пароля';
COMMENT ON COLUMN user_details.is_enabled IS 'Включена ли учетная запись';

---------- INSERTS ----------

-- Password: "password"
INSERT INTO user_details (user_id, username, password_hash)
VALUES (1, 'sysfutex', '$2a$10$VffPR/KA610DUI.YgRuHDeeMVov8cmIg9x/zIJjQ/IrudGWQSZ4tC');
