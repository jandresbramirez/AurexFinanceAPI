CREATE TABLE Estudiante(
    EstudianteId INT identity(1, 1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    TipoDocumentoId INT NOT NULL,
    ProgramaId INT NOT NULL,
    GeneroId INT NOT NULL,
    NoDocumento BIGINT NOT NULL,
    Direccion VARCHAR(50),
    Email VARCHAR(250)
);

CREATE TABLE Genero(
    GeneroId INT identity(1, 1) PRIMARY KEY,
    Genero VARCHAR(50) NOT NULL
);

CREATE TABLE TipoDocumento(
    TipoDocumentoId INT identity(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Programa(
    ProgramaId INT identity(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

-- Convertir llaves foráneas
ALTER TABLE Estudiante
ADD CONSTRAINT FK_Estudiante_Rel_Genero_GeneroId
FOREIGN KEY(GeneroId) REFERENCES Genero(GeneroId);

ALTER TABLE Estudiante
ADD CONSTRAINT FK_Estudiante_Rel_Programa_ProgramaId
FOREIGN KEY(ProgramaId) REFERENCES Programa(ProgramaId);

ALTER TABLE Estudiante
ADD CONSTRAINT FK_Estudiante_Rel_TipoDocumento_TipoDocumentoId
FOREIGN KEY(TipoDocumentoId) REFERENCES TipoDocumento(TipoDocumentoId);

-- Procedimiento Almacenado para añadir un nuevo genero
CREATE PROCEDURE AddGenero
@Nombre VARCHAR(50)
AS 
BEGIN
INSERT INTO Genero(Nombre)
VALUES (@Nombre)
END;

-- Tabla genero 2 registros
EXEC AddGenero 'Femenino';
EXEC AddGenero 'Masculino';

SELECT * FROM Genero;

-- 5 PROGRAMAS 4 ESTUDIANTES


-- Procedimiento almacenado para añadir un nuevo programa
CREATE PROCEDURE AddPrograma
@Nombre VARCHAR(50)
AS 
BEGIN
INSERT INTO Programa(Nombre)
VALUES (@Nombre)
END;

EXEC AddPrograma 'Ciencias Computacionales';
EXEC AddPrograma 'Probabilidad';
EXEC AddPrograma 'Aeronáutica';
EXEC AddPrograma 'Inglés';
EXEC AddPrograma 'Programación Avanzada';


-- Procedimiento almacenado para añadir un nuevo Tipo de Documento
CREATE PROCEDURE AddDocumento
@Nombre VARCHAR(50)
AS 
BEGIN
INSERT INTO TipoDocumento(Nombre)
VALUES (@Nombre)
END;

EXEC AddDocumento 'Tarjeta de Identidad';
EXEC AddDocumento 'Cédula de Ciudadania';
EXEC AddDocumento 'Cédula de Extranjería';
EXEC AddDocumento 'Pasaporte';
EXEC AddDocumento 'Registro Cívil';
EXEC AddDocumento 'Licencia de Conducción';

-- Procedimiento almacenado para añadir un nuevo Tipo de Documento
CREATE PROCEDURE AddEstudiante
@Nombre VARCHAR(50),
@Apellido VARCHAR(50),
@FechaNacimiento DATE,
@TipoDocumentoId INT,
@ProgramaId INT NOT NULL,
@GeneroId INT NOT NULL,
@NoDocumento BIGINT NOT NULL,
@Direccion VARCHAR(50),
@Email VARCHAR(250)

AS 
BEGIN
INSERT INTO Estudiante(Nombre, Apellido, FechaNacimiento, TipoDocumentoId, 
ProgramaId, GeneroId, NoDocumento, Direccion, Email)
VALUES (@Nombre, @Apellido, @FechaNacimiento, @TipoDocumentoId,
@ProgramaId, @GeneroId, @NoDocumento, @Direccion, @Email)
END;

EXEC AddEstudiante 'Andres','Ballen','2004-09-06', 2, 4, 2, 146583,'Calle 13 Diagonal 7', 'andres@gmail.com'; --1
EXEC AddEstudiante 'María', 'Gómez', '2003-05-15', 1, 1, 1, 108421, 'Carrera 10 #20-30', 'maria@gmail.com';
EXEC AddEstudiante 'Carlos', 'Rodríguez', '2002-07-22', 4, 2, 2, 174802, 'Av. Siempre Viva 742', 'carlos@gmail.com';
EXEC AddEstudiante 'Ana', 'López', '2001-03-30', 3, 3, 1, 107703, 'Calle 45 #67-89', 'ana@gmail.com';
EXEC AddEstudiante 'Pedro', 'Martínez', '2000-11-18', 4, 4, 2, 159004, 'Diagonal 23 #45-67', 'pedro@gmail.com';
EXEC AddEstudiante 'Laura', 'Hernández', '2003-08-25', 5, 5, 1, 100705, 'Carrera 5 #12-34', 'laura@gmail.com';
EXEC AddEstudiante 'Diego', 'García', '2002-12-05', 6, 1, 2, 147816, 'Calle 78 #90-12', 'diego@gmail.com';
EXEC AddEstudiante 'Sofía', 'Fernández', '2004-02-14', 1, 2, 1, 188887, 'Av. Bolívar #15-20', 'sofia@gmail.com';
EXEC AddEstudiante 'Javier', 'Torres', '2001-06-09', 2, 3, 2, 108468, 'Carrera 8 #40-50', 'javier@gmail.com';
EXEC AddEstudiante 'Isabel', 'Ramírez', '2000-04-17', 3, 4, 1, 100449, 'Calle 100 #25-30', 'isabel@gmail.com';
EXEC AddEstudiante 'Miguel', 'Díaz', '2003-10-31', 4, 5, 2, 198410, 'Diagonal 15 #35-45', 'miguel@gmail.com';
EXEC AddEstudiante 'Carmen', 'Vargas', '2002-09-12', 5, 1, 1, 199011, 'Carrera 30 #22-11', 'carmen@gmail.com';
EXEC AddEstudiante 'Ricardo', 'Castro', '2001-01-28', 6, 2, 2, 100272, 'Calle 50 #60-70', 'ricardo@gmail.com';
EXEC AddEstudiante 'Patricia', 'Morales', '2000-07-03', 1, 3, 1, 136013, 'Av. Caracas #18-25', 'patricia@gmail.com';
EXEC AddEstudiante 'Fernando', 'Ortiz', '2004-05-19', 2, 4, 2, 182814, 'Carrera 45 #33-44', 'fernando@gmail.com';
EXEC AddEstudiante 'Rosa', 'Gutiérrez', '2003-12-08', 3, 5, 1, 103815, 'Calle 22 #55-66', 'rosa@gmail.com';
EXEC AddEstudiante 'Luis', 'Jiménez', '2002-04-21', 4, 1, 2, 151016, 'Diagonal 8 #77-88', 'luis@gmail.com';
EXEC AddEstudiante 'Teresa', 'Reyes', '2001-08-14', 5, 2, 1, 101117, 'Carrera 12 #99-00', 'teresa@gmail.com';
EXEC AddEstudiante 'José', 'Mendoza', '2000-02-27', 6, 3, 2, 117818, 'Calle 33 #11-22', 'jose@gmail.com';
EXEC AddEstudiante 'Gabriel', 'Peña', '2003-03-25', 2, 5, 2, 196020, 'Carrera 7 #44-55', 'gabriel@gmail.com';