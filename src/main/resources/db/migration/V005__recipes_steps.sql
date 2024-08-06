---------- TABLES ----------

CREATE TABLE IF NOT EXISTS recipes_steps
(
    recipe_id BIGINT REFERENCES recipes (id) ON DELETE CASCADE ON UPDATE CASCADE,
    step_id   BIGINT REFERENCES steps (id) ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (recipe_id, step_id)
);

---------- COMMENTS ----------

COMMENT ON TABLE recipes_steps IS 'Шаги рецептов';

COMMENT ON COLUMN recipes_steps.recipe_id IS 'ID рецепта';
COMMENT ON COLUMN recipes_steps.step_id IS 'ID шага';

---------- INSERTS ----------

INSERT INTO recipes_steps (recipe_id, step_id)
VALUES (1, 1),
       (1, 2),
       (1, 3);
