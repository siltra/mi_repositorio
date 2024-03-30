create database Alke_Wallet;

USE Alke_Wallet;

select * from usuarios;

CREATE TABLE usuarios (
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo_electronico VARCHAR(100),
    contraseña VARCHAR(50),
    saldo DECIMAL(10,2),
    fecha_creacion DATE
);
select * from transaccion;
CREATE TABLE transaccion (
    transaction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    valor DECIMAL(10,2),
    transaction_date DATE,
    currency_id INT,
    FOREIGN KEY (sender_user_id) REFERENCES usuarios(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES usuarios(user_id),
    FOREIGN KEY (currency_id ) REFERENCES moneda(currency_id)
);

select * from moneda;
create table moneda(
	currency_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_symbol CHAR(10)
);

-- Insertar datos de usuarios
INSERT INTO usuarios (nombre, correo_electronico, contraseña, saldo, fecha_creacion) VALUES
('Marco','marco@correo.cl','123456','20000.00','2023-03-20'),
('Cesar','cesar@correo.cl','123456','100000.00','2023-03-21'),
('Lorena','lorena@correo.cl','123456','500000.00','2023-03-22'),
('David','david@correo.cl','123456','3000000.00','2023-03-23'),
('Alfredo','alfredo@correo.cl','123456','50000.00','2023-03-24');
    
    -- Insertar datos de transacciones
INSERT INTO transaccion (transaction_id, sender_user_id, receiver_user_id, valor, transaction_date, currency_id) VALUES
(1, 1, 2, 50.00, '2024-03-28', 1),
(2, 3, 4, 100.00, '2024-03-27', 1),
(3, 5, 1, 20.00, '2024-03-26', 2),
(4, 1, 5, 200.00, '2024-03-25', 2),
(5, 2, 3, 30.00, '2024-03-24', 1);

 
    -- Insertar datos de monedas
INSERT INTO Moneda (currency_id, currency_name, currency_symbol) VALUES
(1, 'Dólar', 'USD'),
(2, 'Euro', 'EUR');

-- Consultas SQL

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
SELECT u.nombre, m.currency_name  
FROM usuarios u
JOIN transaccion t ON u.user_id = t.sender_user_id
JOIN moneda m ON t.currency_id = m.currency_id;

-- Consulta para obtener todas las transacciones registradas
SELECT u.nombre, t.sender_user_id, t.receiver_user_id   
FROM usuarios u
JOIN transaccion t ON u.user_id = t.sender_user_id
JOIN moneda m ON t.currency_id = m.currency_id;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico
SELECT u.nombre, t.sender_user_id, t.receiver_user_id   
FROM usuarios u
JOIN transaccion t ON u.user_id = t.sender_user_id
JOIN moneda m ON t.currency_id = m.currency_id and u.user_id = 1;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
UPDATE usuarios
SET correo_electronico = 'alfredo@correo.cl' WHERE user_id = 5;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
DELETE FROM Transaccion
WHERE transaction_id = 2;


    

    