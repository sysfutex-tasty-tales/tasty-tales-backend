---------- TABLES ----------

CREATE TABLE IF NOT EXISTS steps
(
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    number      INTEGER CHECK (number >= 1) NOT NULL,
    description TEXT                        NOT NULL
);

---------- COMMENTS ----------

COMMENT ON TABLE steps IS 'Шаги';

COMMENT ON COLUMN steps.id IS 'ID';
COMMENT ON COLUMN steps.number IS 'Порядковый номер';
COMMENT ON COLUMN steps.description IS 'Описание';

---------- INSERTS ----------

INSERT INTO steps (number, description)
VALUES (1, 'Оставить завариваться дошик на 15 минут'),
       (2, 'Котлеты обжарить до состояния ''опять всё сгорело нахуй'''),
       (3, 'Украсить веточками кильки в томатном соусе');
