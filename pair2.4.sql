 -- Pair 2.4 (24/06/2025)
 CREATE SCHEMA `tienda_zapatillas`;
 USE `tienda_zapatillas`;
 CREATE TABLE zapatillas (
	id_zapatilla INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL
    );
    
CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    num_tel INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    país VARCHAR(45) NOT NULL,
    codigo_postal CHAR(45) NOT NULL
    );
    
CREATE TABLE empleados (
	id_empleado INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL
    );
    
CREATE TABLE facturas (
	id_factura INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    num_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_zapatilla
		FOREIGN KEY (id_zapatilla)
		REFERENCES zapatillas(id_zapatilla),
    CONSTRAINT fk_empleado
		FOREIGN KEY (id_empleado)
		REFERENCES empleados (id_empleado),    
	CONSTRAINT fk_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES clientes(id_cliente)
        );
    
-- Pair 2.5 (25/06/2025)
/* En este ejercicio vamos a corregir los errores que hemos encontrado en nuestras tablas.
Tabla Zapatillas: Se nos ha olvidado introducir la marca y la talla de las zapatillas que tenemos en nuestra BBDD. Por lo tanto, debemos incluir:
marca: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
talla: es un entero, no nulo*/
ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL;  
ALTER TABLE zapatillas
ADD COLUMN talla INT NOT NULL;
-- Tabla Empleados
-- salario: es un entero, no nulo. Pero puede que el salario de nuestros empleados tenga decimales, por lo que le cambiaremos el tipo a decimal.
ALTER TABLE empleados
MODIFY COLUMN salario FLOAT NOT NULL;
-- Tabla Clientes
-- pais: la hemos incluido en la tabla pero nuestro negocio solo distribuye a España, por lo que es una columna que no hará falta. La eliminaremos
DELETE FROM clientes
WHERE país; -- es para eliminar filas
ALTER TABLE clientes
DROP COLUMN país;
SELECT * FROM clientes;
-- Tabla Facturas:
-- total: madre mía!!! Se nos ha olvidado incluir el total de la cada factura generada😨!Creemos esa columna con un tipo de datos decimal.
ALTER TABLE facturas
ADD COLUMN total FLOAT;
-- Lo primero que vamos a hacer es insertar datos en nuestra BBDD con los siguientes datos:
INSERT INTO zapatillas (id_zapatilla, modelo, color, marca, talla) VALUES
(1, 'XQYUN', 'Negro', 'Nike', 42),
(2, 'UOPMN', 'Rosas', 'Nike', 39),
(3, 'OPNYT', 'Verdes', 'Adidas', 35); 
INSERT INTO empleados (id_empleado, nombre, tienda, salario, fecha_incorporacion) VALUES
(1, 'Laura', 'Alcobendas', 25987.0, '2010-09-03'),
(2, 'Maria', 'Sevilla', 0.0, '2001-04-11'),
(3, 'Ester', 'Oviedo', 30165.98, '2000-11-29');
INSERT INTO clientes (id_cliente, nombre, num_tel, email, direccion, ciudad, provincia, codigo_postal) VALUES
(1, 'Monica', 1234567289, 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'),
(2, 'Lorena', 289345678, 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', '12346'),
(3, 'Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', '23456');
INSERT INTO facturas (id_factura, num_factura, fecha, id_zapatilla, id_empleado, id_cliente, total) VALUES
(1, '123', '2001-12-11', 1, 2, 1, 54.98),
(2, '1234', '2005-05-23', 1, 1, 3, 89.91),
(3, '12345', '2015-09-18', 2, 3, 3, 76.23);
-- De nuevo nos hemos dado cuenta que hay algunos errores en la inserción de datos. En este ejercicios los actualizaremos para que nuestra BBDD este perfecta.
-- Tabla zapatillas 
-- En nuestra tienda no vendemos zapatillas Rosas... ¿Cómo es posible que tengamos zapatillas de color rosa? 🤔 En realidad esas zapatillas son amarillas
UPDATE zapatillas 
SET color='Amarillas' 
WHERE color='Rosas';
SELECT * FROM zapatillas;
-- Tabla empleados
-- Laura se ha cambiado de ciudad y ya no vive en Alcobendas, se fue cerquita del mar, ahora vive en A Coruña.
UPDATE empleados o clientes  -- es tabal de clientes o de empleados???? ciudad no sale en empleados
SET ciudad='A Coruña' 
WHERE color='Rosas';
SELECT * FROM ¿?;
-- Tabla clientes
-- El Numero de teléfono de Monica esta mal!!! Metimos un dígito de más. En realidad su número es: 123456728
UPDATE clientes 
SET num_tel='123456728' 
WHERE num_tel='1234567289';
SELECT * FROM clientes;
-- Tabla facturas
-- El total de la factura de la zapatilla cuyo id es 2 es incorrecto. En realidad es: 89,91.
UPDATE facturas 
SET total=89.91 
WHERE total=89.91; -- es igual lo que había y el nuevo dato
SELECT * FROM facturas;