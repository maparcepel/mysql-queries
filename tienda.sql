SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio AS EUR, cast(precio * 1.21 AS DECIMAL(7,2)) AS USD FROM producto;
SELECT nombre, precio AS euros, cast(precio * 1.21 AS DECIMAL(7,2)) AS dolars FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;
SELECT nombre, ROUND(precio, 0) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT codigo FROM fabricante WHERE codigo IN(SELECT codigo_fabricante FROM producto);
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, MIN(p.precio), f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, MAX(p.precio), f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE("Lenovo");
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE("Crucial") AND p.precio > 200;
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE("Asus") OR f.nombre LIKE("Hewlett-Packard") OR f.nombre LIKE("Seagate");
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN("Asus","Hewlett-Packard","Seagate");
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE("%e");
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE("%w%");
SELECT p.nombre, precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY precio DESC, p.nombre ASC;
SELECT * FROM fabricante f WHERE EXISTS(SELECT * FROM producto p WHERE f.codigo = p.codigo_fabricante);
SELECT f.nombre, p.nombre FROM producto p RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT * FROM fabricante f WHERE NOT EXISTS(SELECT * FROM producto p WHERE f.codigo = p.codigo_fabricante);
SELECT * FROM producto p WHERE EXISTS(SELECT * FROM fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre LIKE("Lenovo"));
SELECT * FROM producto WHERE precio = (SELECT MAX(p.precio) FROM producto p,  fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre LIKE("Lenovo"));
SELECT p.nombre FROM producto p,  fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre LIKE("Lenovo") ORDER BY precio DESC LIMIT 1;
SELECT p.nombre FROM producto p,  fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre LIKE("Hewlett-Packard") ORDER BY precio ASC LIMIT 1;
SELECT * FROM producto WHERE precio >= (SELECT MAX(p.precio) FROM producto p,  fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre LIKE("Lenovo"));
SELECT * FROM producto WHERE precio > (SELECT AVG(p.precio) FROM producto p,  fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre LIKE("Asus"));



-- Llista el nom de tots els productos que hi ha en la taula producto.
-- Llista els noms i els preus de tots els productos de la taula producto.
-- Llista totes les columnes de la taula producto.
-- Llista el nom dels productos, el preu en euros i el preu en d??lars estatunidencs (USD).
-- Llista el nom dels productos, el preu en euros i el preu en d??lars estatunidencs (USD). Utilitza els seg??ents ??lies per a les columnes: nom de producto, euros, dolars.
-- Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a maj??scula.
-- Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a min??scula.
-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en maj??scules els dos primers car??cters del nom del fabricant.
-- Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
-- Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
-- Llista el codi dels fabricants que tenen productos en la taula producto.
-- Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
-- Llista els noms dels fabricants ordenats de manera ascendent.
-- Llista els noms dels fabricants ordenats de manera descendent.
-- Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
-- Retorna una llista amb les 5 primeres files de la taula fabricante.
-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila tamb?? s'ha d'incloure en la resposta.
-- Llista el nom i el preu del producto m??s barat. (Utilitzi solament les cl??usules ORDER BY i LIMIT). NOTA: Aqu?? no podria usar MIN(preu), necessitaria GROUP BY
-- Llista el nom i el preu del producto m??s car. (Utilitzi solament les cl??usules ORDER BY i LIMIT). NOTA: Aqu?? no podria usar MAX(preu), necessitaria GROUP BY.
-- Llista el nom de tots els productos del fabricant el codi de fabricant del qual ??s igual a 2.
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfab??tic.
-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte m??s barat.
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte m??s car.
-- Retorna una llista de tots els productes del fabricador Lenovo.
-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200???.
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el car??cter w en el seu nom.
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180???. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que t?? cadascun d'ells. El llistat haur?? de mostrar tamb?? aquells fabricants que no tenen productes associats.
-- Retorna un llistat on nom??s apareguin aquells fabricants que no tenen cap producte associat.
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte m??s car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Llista el nom del producte m??s car del fabricador Lenovo.
-- Llista el nom del producte m??s barat del fabricant Hewlett-Packard.
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte m??s car del fabricador Lenovo.
-- Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitj?? de tots els seus productes.