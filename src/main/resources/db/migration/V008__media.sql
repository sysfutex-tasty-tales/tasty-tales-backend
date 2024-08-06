---------- TABLES ----------

CREATE TABLE IF NOT EXISTS media
(
    id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    path VARCHAR UNIQUE NOT NULL
);

---------- COMMENTS ----------

COMMENT ON TABLE media IS 'Метаданные медиафайлов';

COMMENT ON COLUMN media.id IS 'ID';
COMMENT ON COLUMN media.path IS 'Путь к медиафайлу';

---------- INSERTS ----------

INSERT INTO media (path)
VALUES ('recipes/the_taste_of_paradise.png'),
       ('ingredients/doshik.png'),
       ('ingredients/cutlets.png'),
       ('ingredients/sprat.png');
