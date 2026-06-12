-- =====================================================
-- UB CONNECT+
-- SQL DML - DATOS DE PRUEBA
-- =====================================================

-- =====================================
-- CARRERA
-- =====================================

INSERT INTO carrera VALUES
(1, 'Ingeniería en Informática', 'Ingeniero en Informática', 5);

-- =====================================
-- PLAN DE ESTUDIO
-- =====================================

INSERT INTO plan_estudio VALUES
(1, 2023, 'Plan de Estudios 2023 - Ingeniería en Informática', 1);

-- =====================================
-- MATERIAS
-- =====================================

INSERT INTO materia VALUES
(101, 'Introducción a la Programación', 1, 1, 72, 75, 1),
(102, 'Lógica', 1, 1, 72, 75, 1),
(103, 'Álgebra', 1, 2, 72, 75, 1),
(104, 'Análisis Matemático I', 1, 2, 96, 75, 1),
(105, 'Programación I', 1, 2, 96, 75, 1),

(106, 'Programación II', 2, 1, 96, 75, 1),
(107, 'Análisis Matemático II', 2, 1, 96, 75, 1),
(108, 'Física I', 2, 1, 72, 75, 1),
(109, 'Ingeniería de Software I', 2, 2, 72, 75, 1),
(110, 'Programación III', 2, 2, 96, 75, 1),

(111, 'Base de Datos I', 3, 1, 72, 75, 1),
(112, 'Probabilidad y Estadística', 3, 1, 72, 75, 1),
(113, 'Matemática Discreta', 3, 1, 72, 75, 1),
(114, 'Redes de Datos I', 3, 2, 72, 75, 1),
(115, 'Proyecto de Construcción de Software', 3, 2, 96, 75, 1);

-- =====================================
-- PROFESORES
-- =====================================

INSERT INTO profesor VALUES
(1, 'Rolando', 'Titiosky', 'rolando.titiosky@ub.edu.ar'),
(2, 'Paula', 'Angeleri', 'paula.angeleri@ub.edu.ar'),
(3, 'Mariano', 'Gonzalez', 'mariano.gonzalez@ub.edu.ar'),
(4, 'Carlos', 'Fernandez', 'carlos.fernandez@ub.edu.ar'),
(5, 'Laura', 'Martinez', 'laura.martinez@ub.edu.ar');

-- =====================================
-- COMISIONES
-- =====================================

INSERT INTO comision VALUES
(1001, 'Mañana', 'Aula 101', 40, 101, 1),
(1002, 'Mañana', 'Aula 102', 40, 102, 2),
(1003, 'Tarde', 'Aula 103', 35, 103, 3),
(1004, 'Noche', 'Aula 104', 35, 104, 4),
(1005, 'Mañana', 'Aula 105', 40, 105, 5),

(1006, 'Tarde', 'Aula 201', 35, 106, 1),
(1007, 'Noche', 'Aula 202', 35, 107, 2),
(1008, 'Mañana', 'Aula 203', 40, 108, 3),
(1009, 'Tarde', 'Aula 204', 40, 109, 4),
(1010, 'Noche', 'Aula 205', 40, 110, 5),

(1011, 'Mañana', 'Laboratorio A', 30, 111, 1),
(1012, 'Tarde', 'Aula 301', 35, 112, 2),
(1013, 'Mañana', 'Aula 302', 35, 113, 3),
(1014, 'Noche', 'Laboratorio B', 30, 114, 4),
(1015, 'Tarde', 'Aula 303', 35, 115, 5);

-- =====================================
-- ALUMNOS
-- =====================================

INSERT INTO alumno VALUES
(2023001,'Oriana','Ferrari','45123456','oriana.ferrari@comunidad.ub.edu.ar','Activo'),
(2023002,'Tomas','Garcia Arcapalo','45234567','tomas.garcia@comunidad.ub.edu.ar','Activo'),
(2023003,'Federico','Ferrante','45345678','federico.ferrante@comunidad.ub.edu.ar','Activo'),
(2023004,'Valentina','Baldasarre','45456789','valentina.baldasarre@comunidad.ub.edu.ar','Activo'),
(2023005,'Delfina','Favonio','45567890','delfina.favonio@comunidad.ub.edu.ar','Activo'),
(2023006,'Julieta','Cwik','45678901','julieta.cwik@comunidad.ub.edu.ar','Activo'),
(2023007,'Gianluca','Boffa','45789012','gianluca.boffa@comunidad.ub.edu.ar','Activo'),
(2023008,'Santiago','Aparicio','45890123','santiago.aparicio@comunidad.ub.edu.ar','Activo'),
(2023009,'Lucas','Aguero','45901234','lucas.aguero@comunidad.ub.edu.ar','Activo'),
(2023010,'Lorenzo','De Mauri','46012345','lorenzo.demauri@comunidad.ub.edu.ar','Activo'),
(2023011,'Juan Cruz','Ferro','46123456','juancruz.ferro@comunidad.ub.edu.ar','Activo');

-- =====================================
-- CURSADAS
-- =====================================

INSERT INTO cursada VALUES
(1,2023001,1011,90,'Aprobada',9),
(2,2023002,1011,85,'Regular',8),
(3,2023003,1011,92,'Aprobada',10),
(4,2023004,1012,88,'Regular',7),
(5,2023005,1012,95,'Aprobada',9),

(6,2023006,1013,80,'Regular',7),
(7,2023007,1013,76,'Regular',6),
(8,2023008,1014,98,'Aprobada',10),
(9,2023009,1014,83,'Regular',8),
(10,2023010,1015,91,'Aprobada',9),

(11,2023011,1015,87,'Regular',8),
(12,2023001,1009,78,'Cursando',NULL),
(13,2023002,1010,82,'Cursando',NULL),
(14,2023003,1008,89,'Cursando',NULL),
(15,2023004,1007,93,'Cursando',NULL);