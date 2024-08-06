---------- TABLES ----------

CREATE TABLE IF NOT EXISTS recipes
(
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    name        VARCHAR                 NOT NULL,
    description TEXT                    NOT NULL,

    is_verified BOOLEAN   DEFAULT FALSE NOT NULL,

    author_id   BIGINT REFERENCES users (id) ON DELETE SET NULL ON UPDATE CASCADE,

    created_at  TIMESTAMP DEFAULT NOW() NOT NULL,
    updated_at  TIMESTAMP DEFAULT NULL
);

---------- COMMENTS ----------

COMMENT ON TABLE recipes IS 'Рецепты';

COMMENT ON COLUMN recipes.id IS 'ID';
COMMENT ON COLUMN recipes.name IS 'Название';
COMMENT ON COLUMN recipes.description IS 'Описание';
COMMENT ON COLUMN recipes.is_verified IS 'Подтвержден ли рецепт администрацией';
COMMENT ON COLUMN recipes.author_id IS 'ID автора';
COMMENT ON COLUMN recipes.created_at IS 'Дата и время создания';
COMMENT ON COLUMN recipes.updated_at IS 'Дата и время обновления';

---------- INSERTS ----------

INSERT INTO recipes (name, description, is_verified, author_id)
VALUES ('Райское наслаждение',
        'Гастрит – это воспаление слизистой оболочки желудка. Гастрит приводит к нарушению процесса пищеварения, а также к ухудшению общего состояния организма.',
        TRUE,
        1);
