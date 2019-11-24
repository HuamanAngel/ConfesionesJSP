CREATE DATABASE confesiones;
USE confesiones;
CREATE TABLE usuario(
	idUsuario int NOT NULL AUTO_INCREMENT,
    nombre varchar(45) NOT NULL,
    apellidos varchar(45) NOT NULL,
    institucion varchar(45) NOT NULL,
    sexo VARCHAR(5),
    nombreUsuario varchar(10) NOT NULL UNIQUE,
    contraseña varchar(8) NOT NULL UNIQUE,
	numTelefono int NOT NULL,
	modalidadPago varchar(10) NOT NULL,
	PRIMARY KEY(idUsuario)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO usuario VALUE(1,'Anonimo','Anonimo','unmsm','HF','Anonimo','aBzJdea',9999,'NotInfo');

CREATE TABLE confesion(
	idConfesion int NOT NULL AUTO_INCREMENT,
	confesion varchar(400) NOT NULL,
	idUsConf int NOT NULL,
    etiqueta VARCHAR(20),
    direccionIp VARCHAR(22),
	tiempo TIMESTAMP,
	precio FLOAT(5,2),
    PRIMARY KEY(idConfesion),
    KEY idUsConf(idUsConf)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO confesion VALUE(1,'Mi primera confesion es la sgt:',1,'unmsm',3434,'2019-11-13 10:10:10',12.00);

ALTER TABLE Confesion
	ADD CONSTRAINT Confesion_ibfk_1 FOREIGN KEY (idUsConf) REFERENCES Usuario (idUsuario) ON DELETE CASCADE ON UPDATE CASCADE;