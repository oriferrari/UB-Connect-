-- =====================================================
-- UB CONNECT+
-- SQL DQL - CONSULTAS DE PRUEBA
-- =====================================================

-- =====================================
-- 1. CONSULTAS SIMPLES
-- =====================================

-- Mostrar todas las carreras
SELECT *
FROM carrera;

-- Mostrar todos los alumnos
SELECT *
FROM alumno;

-- Mostrar todas las materias
SELECT *
FROM materia;

-- Mostrar todos los profesores
SELECT *
FROM profesor;

-- Mostrar todas las comisiones
SELECT *
FROM comision;

-- Mostrar todas las cursadas
SELECT *
FROM cursada;


-- =====================================
-- 2. CONSULTAS CON WHERE
-- =====================================

-- Mostrar alumnos activos
SELECT *
FROM alumno
WHERE estado_academico = 'Activo';

-- Mostrar materias de tercer año
SELECT *
FROM materia
WHERE anio = 3;

-- Mostrar materias del primer semestre
SELECT *
FROM materia
WHERE semestre = 1;

-- Mostrar cursadas aprobadas
SELECT *
FROM cursada
WHERE estado = 'Aprobada';

-- Mostrar cursadas con asistencia mayor o igual al 75%
SELECT *
FROM cursada
WHERE asistencia >= 75;

-- Mostrar cursadas con nota final mayor o igual a 7
SELECT *
FROM cursada
WHERE nota_final >= 7;


-- =====================================
-- 3. CONSULTAS CON ORDER BY
-- =====================================

-- Ordenar alumnos por apellido
SELECT *
FROM alumno
ORDER BY apellido ASC;

-- Ordenar materias por año y semestre
SELECT *
FROM materia
ORDER BY anio ASC, semestre ASC;

-- Ordenar cursadas por nota final de mayor a menor
SELECT *
FROM cursada
WHERE nota_final IS NOT NULL
ORDER BY nota_final DESC;


-- =====================================
-- 4. CONSULTAS CON INNER JOIN
-- =====================================

-- Mostrar cada materia con su plan de estudio
SELECT 
    m.id_materia,
    m.nombre_materia,
    p.anio_plan,
    p.descripcion
FROM materia m
INNER JOIN plan_estudio p
ON m.id_plan = p.id_plan;

-- Mostrar cada plan con su carrera
SELECT
    p.id_plan,
    p.anio_plan,
    c.nombre_carrera,
    c.titulo_otorgado
FROM plan_estudio p
INNER JOIN carrera c
ON p.id_carrera = c.id_carrera;

-- Mostrar cada comisión con su materia y profesor
SELECT
    co.id_comision,
    m.nombre_materia,
    co.turno,
    co.aula,
    co.cupo,
    pr.nombre AS nombre_profesor,
    pr.apellido AS apellido_profesor
FROM comision co
INNER JOIN materia m
ON co.id_materia = m.id_materia
INNER JOIN profesor pr
ON co.id_profesor = pr.id_profesor;

-- Mostrar alumnos con sus materias cursadas
SELECT
    a.legajo,
    a.nombre,
    a.apellido,
    m.nombre_materia,
    cu.asistencia,
    cu.estado,
    cu.nota_final
FROM alumno a
INNER JOIN cursada cu
ON a.legajo = cu.legajo
INNER JOIN comision co
ON cu.id_comision = co.id_comision
INNER JOIN materia m
ON co.id_materia = m.id_materia;

-- Mostrar alumnos, materias, profesores y estados de cursada
SELECT
    a.nombre AS nombre_alumno,
    a.apellido AS apellido_alumno,
    m.nombre_materia,
    pr.nombre AS nombre_profesor,
    pr.apellido AS apellido_profesor,
    cu.estado,
    cu.asistencia,
    cu.nota_final
FROM cursada cu
INNER JOIN alumno a
ON cu.legajo = a.legajo
INNER JOIN comision co
ON cu.id_comision = co.id_comision
INNER JOIN materia m
ON co.id_materia = m.id_materia
INNER JOIN profesor pr
ON co.id_profesor = pr.id_profesor;


-- =====================================
-- 5. CONSULTAS CON LEFT JOIN
-- =====================================

-- Mostrar todos los alumnos, aunque no tengan cursadas
SELECT
    a.legajo,
    a.nombre,
    a.apellido,
    cu.id_cursada,
    cu.estado
FROM alumno a
LEFT JOIN cursada cu
ON a.legajo = cu.legajo;

-- Mostrar todas las materias y sus comisiones, si existen
SELECT
    m.nombre_materia,
    co.id_comision,
    co.turno,
    co.aula
FROM materia m
LEFT JOIN comision co
ON m.id_materia = co.id_materia;


-- =====================================
-- 6. CONSULTAS CON FUNCIONES DE AGREGACIÓN
-- =====================================

-- Contar cantidad total de alumnos
SELECT COUNT(*) AS total_alumnos
FROM alumno;

-- Contar cantidad total de materias
SELECT COUNT(*) AS total_materias
FROM materia;

-- Contar cantidad de cursadas por estado
SELECT
    estado,
    COUNT(*) AS cantidad
FROM cursada
GROUP BY estado;

-- Calcular promedio general de notas finales
SELECT
    AVG(nota_final) AS promedio_general
FROM cursada
WHERE nota_final IS NOT NULL;

-- Mostrar nota máxima registrada
SELECT
    MAX(nota_final) AS nota_maxima
FROM cursada
WHERE nota_final IS NOT NULL;

-- Mostrar nota mínima registrada
SELECT
    MIN(nota_final) AS nota_minima
FROM cursada
WHERE nota_final IS NOT NULL;


-- =====================================
-- 7. CONSULTAS CON GROUP BY Y ORDER BY
-- =====================================

-- Cantidad de alumnos por comisión
SELECT
    co.id_comision,
    m.nombre_materia,
    COUNT(cu.legajo) AS cantidad_alumnos
FROM comision co
INNER JOIN materia m
ON co.id_materia = m.id_materia
LEFT JOIN cursada cu
ON co.id_comision = cu.id_comision
GROUP BY co.id_comision, m.nombre_materia
ORDER BY cantidad_alumnos DESC;

-- Promedio de nota final por materia
SELECT
    m.nombre_materia,
    AVG(cu.nota_final) AS promedio_materia
FROM materia m
INNER JOIN comision co
ON m.id_materia = co.id_materia
INNER JOIN cursada cu
ON co.id_comision = cu.id_comision
WHERE cu.nota_final IS NOT NULL
GROUP BY m.nombre_materia
ORDER BY promedio_materia DESC;

-- Promedio de asistencia por materia
SELECT
    m.nombre_materia,
    AVG(cu.asistencia) AS promedio_asistencia
FROM materia m
INNER JOIN comision co
ON m.id_materia = co.id_materia
INNER JOIN cursada cu
ON co.id_comision = cu.id_comision
GROUP BY m.nombre_materia
ORDER BY promedio_asistencia DESC;


-- =====================================
-- 8. CONSULTAS ACADÉMICAS IMPORTANTES
-- =====================================

-- Mostrar alumnos que regularizaron materias
SELECT
    a.nombre,
    a.apellido,
    m.nombre_materia,
    cu.asistencia,
    cu.estado
FROM alumno a
INNER JOIN cursada cu
ON a.legajo = cu.legajo
INNER JOIN comision co
ON cu.id_comision = co.id_comision
INNER JOIN materia m
ON co.id_materia = m.id_materia
WHERE cu.estado = 'Regular';

-- Mostrar alumnos que aprobaron materias
SELECT
    a.nombre,
    a.apellido,
    m.nombre_materia,
    cu.nota_final
FROM alumno a
INNER JOIN cursada cu
ON a.legajo = cu.legajo
INNER JOIN comision co
ON cu.id_comision = co.id_comision
INNER JOIN materia m
ON co.id_materia = m.id_materia
WHERE cu.estado = 'Aprobada';

-- Mostrar alumnos que están cursando actualmente
SELECT
    a.nombre,
    a.apellido,
    m.nombre_materia,
    cu.asistencia
FROM alumno a
INNER JOIN cursada cu
ON a.legajo = cu.legajo
INNER JOIN comision co
ON cu.id_comision = co.id_comision
INNER JOIN materia m
ON co.id_materia = m.id_materia
WHERE cu.estado = 'Cursando';

-- Mostrar alumnos que deben recursar
SELECT
    a.nombre,
    a.apellido,
    m.nombre_materia,
    cu.asistencia,
    cu.nota_final
FROM alumno a
INNER JOIN cursada cu
ON a.legajo = cu.legajo
INNER JOIN comision co
ON cu.id_comision = co.id_comision
INNER JOIN materia m
ON co.id_materia = m.id_materia
WHERE cu.estado = 'Recursa';


-- =====================================
-- 9. CONSULTA CON CONDICIÓN COMPUESTA
-- =====================================

-- Alumnos con asistencia suficiente y nota mayor o igual a 7
SELECT
    a.nombre,
    a.apellido,
    m.nombre_materia,
    cu.asistencia,
    cu.nota_final
FROM alumno a
INNER JOIN cursada cu
ON a.legajo = cu.legajo
INNER JOIN comision co
ON cu.id_comision = co.id_comision
INNER JOIN materia m
ON co.id_materia = m.id_materia
WHERE cu.asistencia >= 75
AND cu.nota_final >= 7;


-- =====================================
-- 10. CONSULTA TIPO REPORTE
-- =====================================

-- Reporte académico completo del alumno Oriana Ferrari
SELECT
    a.legajo,
    a.nombre,
    a.apellido,
    c.nombre_carrera,
    m.nombre_materia,
    pr.nombre AS profesor,
    pr.apellido AS apellido_profesor,
    co.turno,
    co.aula,
    cu.asistencia,
    cu.estado,
    cu.nota_final
FROM alumno a
INNER JOIN cursada cu
ON a.legajo = cu.legajo
INNER JOIN comision co
ON cu.id_comision = co.id_comision
INNER JOIN materia m
ON co.id_materia = m.id_materia
INNER JOIN plan_estudio pe
ON m.id_plan = pe.id_plan
INNER JOIN carrera c
ON pe.id_carrera = c.id_carrera
INNER JOIN profesor pr
ON co.id_profesor = pr.id_profesor
WHERE a.nombre = 'Oriana'
AND a.apellido = 'Ferrari';