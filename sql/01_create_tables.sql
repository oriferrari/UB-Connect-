-- UB CONNECT+
-- SQL DDL - Creación de tablas
-- Motor: PostgreSQL / Supabase

DROP TABLE IF EXISTS cursada;
DROP TABLE IF EXISTS comision;
DROP TABLE IF EXISTS materia;
DROP TABLE IF EXISTS plan_estudio;
DROP TABLE IF EXISTS carrera;
DROP TABLE IF EXISTS profesor;
DROP TABLE IF EXISTS alumno;

CREATE TABLE carrera (
    id_carrera INT PRIMARY KEY,
    nombre_carrera VARCHAR(100) NOT NULL UNIQUE,
    titulo_otorgado VARCHAR(100) NOT NULL,
    duracion_anios INT NOT NULL CHECK (duracion_anios BETWEEN 1 AND 10)
);

CREATE TABLE plan_estudio (
    id_plan INT PRIMARY KEY,
    anio_plan INT NOT NULL CHECK (anio_plan >= 2000),
    descripcion VARCHAR(200),
    id_carrera INT NOT NULL,
    CONSTRAINT fk_plan_carrera
        FOREIGN KEY (id_carrera)
        REFERENCES carrera(id_carrera)
);

CREATE TABLE materia (
    id_materia INT PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL,
    anio INT NOT NULL CHECK (anio BETWEEN 1 AND 5),
    semestre INT NOT NULL CHECK (semestre IN (1, 2)),
    carga_horaria INT NOT NULL CHECK (carga_horaria > 0),
    porcentaje_asistencia INT NOT NULL CHECK (porcentaje_asistencia BETWEEN 0 AND 100),
    id_plan INT NOT NULL,
    CONSTRAINT fk_materia_plan
        FOREIGN KEY (id_plan)
        REFERENCES plan_estudio(id_plan)
);

CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE comision (
    id_comision INT PRIMARY KEY,
    turno VARCHAR(50) NOT NULL CHECK (turno IN ('Mañana', 'Tarde', 'Noche')),
    aula VARCHAR(50),
    cupo INT NOT NULL CHECK (cupo > 0),
    id_materia INT NOT NULL,
    id_profesor INT NOT NULL,
    CONSTRAINT fk_comision_materia
        FOREIGN KEY (id_materia)
        REFERENCES materia(id_materia),
    CONSTRAINT fk_comision_profesor
        FOREIGN KEY (id_profesor)
        REFERENCES profesor(id_profesor)
);

CREATE TABLE alumno (
    legajo INT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    email_institucional VARCHAR(120) NOT NULL UNIQUE,
    estado_academico VARCHAR(50) NOT NULL CHECK (estado_academico IN ('Activo', 'Inactivo', 'Egresado'))
);

CREATE TABLE cursada (
    id_cursada INT PRIMARY KEY,
    legajo INT NOT NULL,
    id_comision INT NOT NULL,
    asistencia DECIMAL(5,2) NOT NULL CHECK (asistencia BETWEEN 0 AND 100),
    estado VARCHAR(50) NOT NULL CHECK (estado IN ('Cursando', 'Regular', 'Aprobada', 'Recursa')),
    nota_final DECIMAL(4,2) CHECK (nota_final BETWEEN 0 AND 10),
    CONSTRAINT fk_cursada_alumno
        FOREIGN KEY (legajo)
        REFERENCES alumno(legajo),
    CONSTRAINT fk_cursada_comision
        FOREIGN KEY (id_comision)
        REFERENCES comision(id_comision),
    CONSTRAINT uq_alumno_comision
        UNIQUE (legajo, id_comision)
);