---------- TABLES ----------

CREATE TABLE IF NOT EXISTS recipes_ingredients
(
    recipe_id     BIGINT REFERENCES recipes (id) ON DELETE CASCADE ON UPDATE CASCADE,
    ingredient_id BIGINT REFERENCES ingredients (id) ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (recipe_id, ingredient_id)
);

---------- COMMENTS ----------

COMMENT ON TABLE recipes_ingredients IS 'Ингредиенты рецептов';

COMMENT ON COLUMN recipes_ingredients.recipe_id IS 'ID рецепта';
COMMENT ON COLUMN recipes_ingredients.ingredient_id IS 'ID ингредиента';

---------- INSERTS ----------

INSERT INTO recipes_ingredients (recipe_id, ingredient_id)
VALUES (1, 1),
       (1, 2),
       (1, 3);
