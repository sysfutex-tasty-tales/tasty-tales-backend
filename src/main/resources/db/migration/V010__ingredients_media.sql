---------- TABLES ----------

CREATE TABLE IF NOT EXISTS ingredients_media
(
    ingredient_id BIGINT REFERENCES ingredients (id) ON DELETE CASCADE ON UPDATE CASCADE,
    media_id      BIGINT REFERENCES media (id) ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (ingredient_id, media_id)
);

---------- COMMENTS ----------

COMMENT ON TABLE ingredients_media IS 'Медиафайлы ингредиентов';

COMMENT ON COLUMN ingredients_media.ingredient_id IS 'ID ингредиента';
COMMENT ON COLUMN ingredients_media.media_id IS 'ID медиафайла';

---------- INSERTS ----------

INSERT INTO ingredients_media (ingredient_id, media_id)
VALUES (1, 2),
       (2, 3),
       (3, 4);
