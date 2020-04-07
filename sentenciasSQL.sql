--1.iniciar sql:
mysql_start

--2.iniciar mariadb o sql (tenemos dos comandos para esto)
--(inicia sin usuario contraseña)
mysql 

--inicia con usuario y contraseña
mysql -u root -p 

--3.crear la base de datos llamada "uniminutodb"
CREATE DATABASE uniminutodb;

--4.listar bases de datos
show databases;

--5.Entrar a la base de datos que queremos modificar.
use uniminutodb;

--6.Crear una tabla dentro de la base de datos.(podemos  copiar y pegar todo o podemos poner linea por linea)
CREATE TABLE persona(
id_persona int(6) NOT NULL AUTO_INCREMENT,
nombre varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
apellido varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
telefono varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
codigoPostal varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
fechaDeNacimiento varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
lugarDeNacimiento varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
sexo char (1) COLLATE utf8_spanish_ci DEFAULT NULL,
profesion varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
correoElectronico varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
tipoDeIdentificacion varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
numeroDeIdentificacion varchar (50) COLLATE utf8_spanish_ci DEFAULT NULL,
PRIMARY KEY (id_persona)
)AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--7.Mirar el contenido de la tabla
SELECT * FROM persona;

--8.LLenar la tabla con mil registros (recordemos usar la direccion donde el )
LOAD DATA INFILE 'F:\\base de datos\\prueba.csv'
INTO TABLE persona
FIELDS TERMINATED BY  ',' 
LINES TERMINATED BY '\n';

--9.Imprimimir los 1000 registros
SELECT * FROM persona;


--10.Consulta de edades 
--calcular edades y filtrar por ellas
SELECT id_persona,nombre,apellido,fechaDeNacimiento, TIMESTAMPDIFF(YEAR, fechaDeNacimiento, CURDATE()) AS edad FROM persona;

--filtrar por edades y agrupar cuantas personas hay con la misma edad.
SELECT TIMESTAMPDIFF(YEAR, fechaDeNacimiento, CURDATE()) AS edad, COUNT(*) FROM persona GROUP BY edad;

--filtrar por primera persona que apareza con una edad del grupo en la tabla .
SELECT id_persona,nombre,apellido,TIMESTAMPDIFF(YEAR, fechaDeNacimiento, CURDATE()) AS edad, COUNT(*) FROM persona GROUP BY edad;


--11.Filtrar por genero o sexo
-- filtrar masculino
SELECT * FROM `persona` WHERE sexo="M";
--filtrar por femenino
SELECT * FROM `persona` WHERE sexo="F";

--12.Filtrar por un apellido.(dentro de las comillas de apillo se debe poner el apellido buscado)
SELECT * FROM `persona` WHERE apellido="Bene";

--13.Filtrar por edad y sexo.
SELECT id_persona,nombre,apellido,telefono,fechaDeNacimiento,lugarDeNacimiento,sexo, TIMESTAMPDIFF(YEAR, fechaDeNacimiento, CURDATE()) AS edad FROM persona WHERE sexo="M";

