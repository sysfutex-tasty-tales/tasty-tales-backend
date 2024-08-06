---------- TABLES ----------

CREATE TABLE IF NOT EXISTS recipes_media
(
    recipe_id BIGINT REFERENCES recipes (id) ON DELETE CASCADE ON UPDATE CASCADE,
    media_id  BIGINT REFERENCES media (id) ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (recipe_id, media_id)
);

---------- COMMENTS ----------

COMMENT ON TABLE recipes_media IS 'Медиафайлы рецептов';

COMMENT ON COLUMN recipes_media.recipe_id IS 'ID рецепта';
COMMENT ON COLUMN recipes_media.media_id IS 'ID медиафайла';

---------- INSERTS ----------

INSERT INTO recipes_media (recipe_id, media_id)
VALUES (1, 1);
