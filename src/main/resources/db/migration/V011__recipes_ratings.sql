---------- TABLES ----------

CREATE TABLE IF NOT EXISTS recipes_ratings
(
    recipe_id BIGINT REFERENCES recipes (id) ON DELETE CASCADE ON UPDATE CASCADE,
    user_id   BIGINT REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,

    rating    INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,

    PRIMARY KEY (recipe_id, user_id)
);

---------- COMMENTS ----------

COMMENT ON TABLE recipes_ratings IS 'Рейтинги рецептов';

COMMENT ON COLUMN recipes_ratings.recipe_id IS 'ID рецепта';
COMMENT ON COLUMN recipes_ratings.recipe_id IS 'ID пользователя';
COMMENT ON COLUMN recipes_ratings.rating IS 'Оценка';

---------- INSERTS ----------

INSERT INTO recipes_ratings (recipe_id, user_id, rating)
VALUES (1, 1, 5);
