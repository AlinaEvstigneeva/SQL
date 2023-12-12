CREATE DATABASE homework_6;
USE homework_6;

-- ЗАДАНИЕ №1
/* Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' */

DELIMITER //
DROP FUNCTION IF EXISTS second_to_days//
CREATE FUNCTION second_to_days(num INT)
RETURNS VARCHAR(300) DETERMINISTIC
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT DEFAULT 60;
    DECLARE result VARCHAR (300);
    SET days = num DIV 86400;
    SET num = num % 86400;
    SET hours = num DIV 3600;
    SET num = num % 3600;
    SET minutes = num DIV 60;
    SET num = num % 60;
    SET result = CONCAT(days, ' ', 'days', ' ', hours, ' ', 'hours', ' ', minutes, ' ', 'minutes', ' ', num, ' ', 'seconds');
    RETURN result;
END //

SELECT second_to_days(123456)//




-- ЗАДАНИЕ №2
/* Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 */

DROP PROCEDURE IF EXISTS even_numbers//
DROP TABLE result//
CREATE PROCEDURE even_numbers (IN num1 INT, IN num2 INT)
BEGIN
	DECLARE i INT DEFAULT 0;
    CREATE TABLE result (result INT);
    WHILE i < num2 DO
		IF num1 % 2 = 0 THEN
			INSERT INTO result (result)
            VALUE (num1);
            SET num1 = num1 + 1;
		ELSE 
			SET num1 = num1 + 1;
		END IF;
		SET i = i + 1;
	END WHILE;
    SELECT * FROM result;
END//

CALL even_numbers(1, 10)//