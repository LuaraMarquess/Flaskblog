-- Atualiza o type do staff --
UPDATE `flaskblogdb`.`staff` SET `emp_type` = 'admin' WHERE (`emp_id` = '1');
UPDATE `flaskblogdb`.`staff` SET `emp_type` = 'author' WHERE (`emp_id` = '2');
UPDATE `flaskblogdb`.`staff` SET `emp_type` = 'author' WHERE (`emp_id` = '4');
UPDATE `flaskblogdb`.`staff` SET `emp_type` = 'author' WHERE (`emp_id` = '5');
UPDATE `flaskblogdb`.`staff` SET `emp_type` = 'author' WHERE (`emp_id` = '7');
UPDATE `flaskblogdb`.`staff` SET `emp_type` = 'author' WHERE (`emp_id` = '8');

-- Mostra todos os registros da tabela 'staff' --
SELECT * FROM staff;

-- Mostra todos os registros da tabela 'article' --

SELECT * FROM staff;

-- Mostra todos os registros da tabela 'article' --
SELECT * FROM article;

SELECT * FROM staff where emp_id ='5';

SELECT * FROM staff where emp_name = 'Maria Oliveria';

SELECT * FROM staff order by emp_name desc;

SELECT * FROM staff where emp_name like 'Maria%';





