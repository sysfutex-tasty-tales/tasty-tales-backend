---------- TABLES ----------

CREATE TABLE IF NOT EXISTS recipes_comments
(
    id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    recipe_id  BIGINT REFERENCES recipes (id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    user_id    BIGINT REFERENCES users (id) ON DELETE SET NULL ON UPDATE CASCADE,

    comment    TEXT                                                               NOT NULL,

    created_at TIMESTAMP DEFAULT NOW()                                            NOT NULL,
    updated_at TIMESTAMP DEFAULT NULL
);

---------- COMMENTS ----------

COMMENT ON TABLE recipes_comments IS 'Комментарии к рецептам';

COMMENT ON COLUMN recipes_comments.id IS 'ID';
COMMENT ON COLUMN recipes_comments.recipe_id IS 'ID рецепта';
COMMENT ON COLUMN recipes_comments.user_id IS 'ID пользователя';
COMMENT ON COLUMN recipes_comments.comment IS 'Текст комментария';
COMMENT ON COLUMN recipes_comments.created_at IS 'Дата и время создания';
COMMENT ON COLUMN recipes_comments.updated_at IS 'Дата и время обновления';

---------- INSERTS ----------

INSERT INTO recipes_comments (recipe_id, user_id, comment)
VALUES (1, 1, 'Чел...'),
       (1, 1, 'А вообще не, норм');
