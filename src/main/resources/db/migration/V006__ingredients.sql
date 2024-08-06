---------- TABLES ----------

CREATE TABLE IF NOT EXISTS ingredients
(
    id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    name VARCHAR UNIQUE NOT NULL
);

---------- COMMENTS ----------

COMMENT ON TABLE ingredients IS 'Ингредиенты';

COMMENT ON COLUMN ingredients.id IS 'ID';
COMMENT ON COLUMN ingredients.name IS 'Название';

---------- INSERTS ----------

INSERT INTO ingredients (name)
VALUES ('Дошик'),
       ('Котлеты'),
       ('Килька в томатном соусе');
