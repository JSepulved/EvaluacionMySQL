CREATE SCHEMA minimarket_donjose;

USE minimarket_donjose;


CREATE TABLE TipoProducto (
	tipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    categoria VARCHAR(25)
);

CREATE TABLE Producto (
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_producto VARCHAR(25),
    precio DOUBLE
);

CREATE TABLE Proveedor (
	proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_proveedor VARCHAR(30),
    contacto VARCHAR(45),
    fecha_visita DATE
);

CREATE TABLE Venta (
	venta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_venta DATE,
    monto DOUBLE
);    

CREATE TABLE Gasto (
	gasto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha_gasto DATE,
    total_gasto DOUBLE,
    descripcion VARCHAR(45)
);

CREATE TABLE ProductoProveedor (
	productoProveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL
);


ALTER TABLE Gasto ADD proveedor_id INTEGER NOT NULL;

ALTER TABLE Producto ADD proveedor_id INTEGER NOT NULL;
ALTER TABLE Producto ADD tipoProducto_id INTEGER NOT NULL;

ALTER TABLE ProductoProveedor ADD producto_id INTEGER NOT NULL;
ALTER TABLE ProductoProveedor ADD proveedor_id INTEGER NOT NULL;

ALTER TABLE Venta ADD producto_id INTEGER NOT NULL;

ALTER TABLE Venta 
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id);

ALTER TABLE Gasto
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id);

ALTER TABLE Producto
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id);
ALTER TABLE Producto
ADD FOREIGN KEY (tipoProducto_id) REFERENCES TipoProducto (tipoProducto_id);

ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id);
ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id);


INSERT INTO TipoProducto (categoria) VALUES ("Bebidas");
INSERT INTO TipoProducto (categoria) VALUES ("Cereales");
INSERT INTO TipoProducto (categoria) VALUES ("Helados");
INSERT INTO TipoProducto (categoria) VALUES ("Galletas");

INSERT INTO Proveedor (nombre_proveedor,contacto,fecha_visita) VALUES ("Coca-Cola Company","cocacola@gmail.com","2023-02-28");
INSERT INTO Proveedor (nombre_proveedor,contacto,fecha_visita) VALUES ("Nestle","nestle@gmail.com","2023-03-01");
INSERT INTO Proveedor (nombre_proveedor,contacto,fecha_visita) VALUES ("Savory","savory@gmail.com","2023-03-03");
INSERT INTO Proveedor (nombre_proveedor,contacto,fecha_visita) VALUES ("Costa","costa@gmail.com","2023-03-01");

INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Fanta",1990,1,1);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Sprite",1990,1,1);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Milo",3599,2,2);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Chocapic",2190,2,2);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Centella",350,3,3);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Chocolito",850,3,3);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Tuareg",570,4,4);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Frac",630,4,4);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Mono Rolls",5580,2,4);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Mono Choc",4590,2,4);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Danky",1799,3,2);
INSERT INTO Producto (nombre_producto,precio,tipoProducto_id,proveedor_id) VALUES ("Crocanty",850,3,2);

INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-01-05",1990,2);
INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-01-07",850,6);
INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-01-08",1990,1);
INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-02-14",570,7);
INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-02-19",1990,1);
INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-02-25",3599,3);
INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-03-01",350,5);
INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-03-09",630,8);
INSERT INTO Venta (fecha_venta,monto,producto_id) VALUES ("2023-03-14",2190,4);

INSERT INTO Gasto (fecha_gasto,total_gasto,descripcion,proveedor_id) VALUES ("2023-02-28",45600,"reposicion bebidas",1);
INSERT INTO Gasto (fecha_gasto,total_gasto,descripcion,proveedor_id) VALUES ("2023-03-01",60990,"reposicion cereales",2);
INSERT INTO Gasto (fecha_gasto,total_gasto,descripcion,proveedor_id) VALUES ("2023-03-03",34500,"reposicion helados",3);
INSERT INTO Gasto (fecha_gasto,total_gasto,descripcion,proveedor_id) VALUES ("2023-02-28",38990,"reposicion galletas",4);

INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (1,1);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (2,1);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (3,2);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (4,2);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (5,3);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (6,3);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (7,4);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (8,4);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (9,4);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (10,4);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (11,2);
INSERT INTO ProductoProveedor (producto_id,proveedor_id) VALUES (12,2);

SELECT Venta.fecha_venta, Venta.monto, Producto.nombre_producto
FROM Venta JOIN Producto ON Venta.producto_id = Producto.producto_id;

SELECT Venta.monto FROM Venta;

SELECT * FROM Gasto;

SELECT * FROM Producto WHERE nombre_producto LIKE 'c%'; 