-- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo LIKE("alumno") ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo LIKE("alumno");
SELECT * FROM persona WHERE tipo LIKE ("alumno") AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE telefono IS NULL AND tipo LIKE("profesor") AND nif LIKE ("%K");
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, pe.nombre, d.nombre FROM persona pe, profesor pr, departamento d WHERE pe.id = pr.id_profesor AND pr.id_departamento = d.id AND tipo LIKE("profesor") ORDER BY apellido1, pe.nombre;
SELECT a.nombre, anyo_inicio, anyo_fin FROM asignatura a, curso_escolar c, persona p, alumno_se_matricula_asignatura aa WHERE aa.id_alumno = p.id AND aa.id_asignatura = a.id AND aa.id_curso_escolar = c.id AND p.nif LIKE("26902806M");
SELECT DISTINCT(d.nombre) FROM departamento d, profesor p, asignatura a, grado g WHERE d.id = p.id_departamento AND p. id_profesor = a.id_profesor AND a.id_grado = g.id AND g.nombre LIKE("Grado en Ingeniería Informática (Plan 2015)");
SELECT p.apellido1, p.apellido2, p.nombre FROM asignatura a, curso_escolar c, persona p, alumno_se_matricula_asignatura aa WHERE aa.id_alumno = p.id AND aa.id_asignatura = a.id AND aa.id_curso_escolar = c.id AND anyo_inicio = 2018 AND anyo_fin = 2019 GROUP BY nif;

-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
SELECT d.nombre, apellido1, apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_profesor = d.id WHERE tipo LIKE("profesor") ORDER BY d.nombre, apellido1, apellido2, p.nombre;
SELECT d.nombre, apellido1, apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_profesor = d.id WHERE tipo LIKE("profesor") AND d.nombre IS NULL;
SELECT nombre FROM  profesor  RIGHT JOIN departamento  ON id_profesor = id WHERE  id_profesor IS NULL;
SELECT apellido1, apellido2, p.nombre FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id WHERE a.nombre IS NULL;
SELECT a.nombre FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor RIGHT JOIN asignatura a ON pr.id_profesor = a.id WHERE pr.id_profesor IS NULL;
SELECT d.nombre FROM departamento d LEFT JOIN profesor p ON d.id = p.id_profesor LEFT JOIN asignatura a ON p.id_profesor = a.id WHERE curso IS NULL;

-- Consultes resum:
SELECT COUNT(*) FROM persona WHERE tipo LIKE ("alumno");
SELECT COUNT(*) FROM persona WHERE tipo LIKE ("alumno") AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre, COUNT(*) AS num_profesores FROM departamento d RIGHT JOIN profesor p ON d.id = p.id_departamento GROUP BY nombre ORDER BY num_profesores DESC;
SELECT nombre,  case when id_profesor IS NULL then 0 ELSE COUNT(nombre) END AS num_profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY nombre ORDER BY num_profesores;
SELECT g.nombre,  COUNT(a.nombre) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado  GROUP BY g.nombre ORDER BY num_asignaturas DESC;
SELECT g.nombre, COUNT(a.nombre) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado  GROUP BY g.nombre HAVING num_asignaturas > 40 ORDER BY num_asignaturas ;
SELECT g.nombre, tipo, SUM(creditos) FROM grado g RIGHT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, tipo;
SELECT anyo_inicio, count(anyo_inicio) FROM  alumno_se_matricula_asignatura a, curso_escolar c WHERE a.id_curso_escolar = c.id GROUP BY anyo_inicio;
SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.nombre) AS num_asignaturas FROM asignatura a RIGHT JOIN profesor p ON a.id_profesor = p.id_profesor INNER JOIN persona pe ON p.id_profesor = pe.id GROUP BY pe.id ORDER BY num_asignaturas DESC;
SELECT * FROM persona WHERE tipo LIKE ("alumno") AND fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo LIKE ("alumno"));
SELECT pe.nombre, pe.apellido1, pe.apellido2 FROM asignatura a RIGHT JOIN profesor p ON a.id_profesor = p.id_profesor INNER JOIN persona pe ON p.id_profesor = pe.id INNER JOIN departamento d ON p.id_departamento = d.id WHERE a.nombre IS NULL;

