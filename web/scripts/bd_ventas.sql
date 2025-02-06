DROP DATABASE bd_ventas;
-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS bd_ventas;
USE bd_ventas;

-- Tabla Cliente
CREATE TABLE cliente (
  IdCliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Dni VARCHAR(8),
  Nombres VARCHAR(244),
  Direccion VARCHAR(244),
  Estado VARCHAR(1)
);

INSERT INTO cliente (IdCliente, Dni, Nombres, Direccion, Estado) VALUES
(17, '123', 'Juan Diego Monda Podrido', 'elmercenariosinpasajes@gmail.com', '1'),
(18, '321', 'Maria Melano Podrida', 'example@peru.edu.pe', '1'),
(19, '432', 'Andres yusexual', 'example@nasa.edu.pe', '1'),
(20, '234', 'Andres Mendoza', 'example@google.edu.pe', '1');

-- Tabla Empleado
CREATE TABLE empleado (
  IdEmpleado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Dni VARCHAR(8) NOT NULL,
  Nombres VARCHAR(255),
  Telefono VARCHAR(9),
  Estado VARCHAR(1),
  Correo VARCHAR(30),
  User VARCHAR(8) NOT NULL,
  Password VARCHAR(100) NOT NULL
);

INSERT INTO empleado (IdEmpleado, Dni, Nombres, Telefono, Estado, Correo, User, Password) VALUES
(1, '123', 'Pedro que gusto de verte', '988252459', '1', 'pedro.hernandez@example.com', 'emp01', '5ac0852e770506dcd80f1a36d20ba7878bf82244b836d9324593bd14bc56dcb5'),
(2, '456', 'Roman Riquelme', '988252459', '1', 'roman.riquelmegoat@example.com', 'Jo45', 'f6a5ff2e0c086df0b80dde284315ad9f24a24a189a2091dff7ed11bf095b5de0'),
(3, '789', 'Palermo Suarez', '453536458', '1', 'palermo.suarez@example.com', 'Em22', 'clave789'),
(8, '101', 'Juan Diego', '3205232', '1', 'juandiego@gmail.com', 'jd123', '9010e72389a80487d473017425c6ec7951068abed82a4df32459c91f0e45d2ea');

-- Tabla Producto
CREATE TABLE producto (
  IdProducto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Nombres VARCHAR(244),
  Precio DOUBLE,
  Stock INT UNSIGNED,
  Estado VARCHAR(1)
);

INSERT INTO producto (IdProducto, Nombres, Precio, Stock, Estado) VALUES
(2, 'Mouse Logitech 567', 20, 96, '1'),
(3, 'Laptop Lenovo Ideapad 520', 800, 99, '1'),
(4, 'HeadPhones Sony M333', 500, 98, '1'),
(7, 'Producto Nuevo w', 22, 35, '1');

-- Tabla Ventas
CREATE TABLE ventas (
  IdVentas INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  IdCliente INT UNSIGNED NOT NULL,
  IdEmpleado INT UNSIGNED NOT NULL,
  NumeroSerie VARCHAR(244),
  FechaVentas DATE,
  Monto DOUBLE,
  Estado VARCHAR(1),
  FOREIGN KEY (IdCliente) REFERENCES cliente(IdCliente),
  FOREIGN KEY (IdEmpleado) REFERENCES empleado(IdEmpleado)
);

INSERT INTO ventas (IdVentas, IdCliente, IdEmpleado, NumeroSerie, FechaVentas, Monto, Estado) VALUES
(94, 17, 2, '000000001', '2019-06-14', 20, '1'),
(95, 17, 2, '000000002', '2019-06-14', 0, '1'),
(96, 17, 2, '000000003', '2019-06-14', 0, '1'),
(97, 17, 2, '000000004', '2019-06-14', 820, '1');

-- Tabla Detalle_Ventas
CREATE TABLE detalle_ventas (
  IdDetalleVentas INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  IdVentas INT UNSIGNED NOT NULL,
  IdProducto INT UNSIGNED NOT NULL,
  Cantidad INT,
  PrecioVenta DOUBLE,
  FOREIGN KEY (IdVentas) REFERENCES ventas(IdVentas),
  FOREIGN KEY (IdProducto) REFERENCES producto(IdProducto)
);

INSERT INTO detalle_ventas (IdDetalleVentas, IdVentas, IdProducto, Cantidad, PrecioVenta) VALUES
(155, 94, 2, 1, 20),
(156, 97, 2, 1, 20),
(157, 97, 3, 1, 800);