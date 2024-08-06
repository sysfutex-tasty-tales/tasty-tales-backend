---------- TABLES ----------

CREATE TABLE IF NOT EXISTS users
(
    id        BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    name      VARCHAR                 NOT NULL,

    joined_at TIMESTAMP DEFAULT NOW() NOT NULL
);

---------- COMMENTS ----------

COMMENT ON TABLE users IS 'Пользователи';

COMMENT ON COLUMN users.id IS 'ID';
COMMENT ON COLUMN users.name IS 'Имя';
COMMENT ON COLUMN users.joined_at IS 'Дата и время регистрации';

---------- INSERTS ----------

INSERT INTO users (name)
VALUES ('Михаил');
