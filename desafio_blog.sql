-- 1. Crear base de datos llamada blog.
CREATE DATABASE blog;

\ c blog;

-- 2. Crear las tablas indicadas de acuerdo al modelo de datos.
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    email VARCHAR(50)
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuario(id),
    titulo VARCHAR(50),
    fecha DATE
);

CREATE TABLE comentario (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES post(id),
    usuario_id INT REFERENCES usuario(id),
    texto VARCHAR(255),
    fecha DATE
);

-- 3. Insertar los siguientes registros. (usuario, post, comentario)
INSERT INTO
    usuario (email)
VALUES
    ('usuario01@hotmail.com');

INSERT INTO
    usuario (email)
VALUES
    ('usuario02@gmail.com');

INSERT INTO
    usuario (email)
VALUES
    ('usuario03@gmail.com');

INSERT INTO
    usuario (email)
VALUES
    ('usuario04@hotmail.com');

INSERT INTO
    usuario (email)
VALUES
    ('usuario05@yahoo.com');

INSERT INTO
    usuario (email)
VALUES
    ('usuario06@hotmail.com');

INSERT INTO
    usuario (email)
VALUES
    ('usuario07@yahoo.com');

INSERT INTO
    usuario (email)
VALUES
    ('usuario08@yahoo.com');

INSERT INTO
    usuario (email)
VALUES
    ('usuario09@yahoo.com');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (1, 'Post 1: Esto es malo', '2020-06-29');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (5, 'Post 2: Esto es malo', '2020-06-20');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (1, 'Post 3: Esto es excelente', '2020-05-30');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (9, 'Post 4: Esto es bueno', '2020-05-09');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (7, 'Post 5: Esto es bueno', '2020-07-10');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (5, 'Post 6: Esto es excelente', '2020-07-18');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (8, 'Post 7: Esto es excelente', '2020-07-07');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (5, 'Post 8: Esto es excelente', '2020-05-14');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (2, 'Post 9: Esto es bueno', '2020-05-08');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (6, 'Post 10: Esto es bueno', '2020-06-02');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (4, 'Post 11: Esto es bueno', '2020-05-05');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (9, 'Post 12: Esto es malo', '2020-07-23');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (5, 'Post 13: Esto es excelente', '2020-05-30');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (8, 'Post 14: Esto es excelente', '2020-05-01');

INSERT INTO
    post (usuario_id, titulo, fecha)
VALUES
    (7, 'Post 15: Esto es malo', '2020-06-17');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (6, 3, 'Este es el comentario 1', '2020-07-08');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (2, 4, 'Este es el comentario 2', '2020-06-07');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (4, 6, 'Este es el comentario 3', '2020-06-16');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (13, 2, 'Este es el comentario 4', '2020-06-15');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (6, 6, 'Este es el comentario 5', '2020-05-14');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (3, 3, 'Este es el comentario 6', '2020-07-08');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (1, 6, 'Este es el comentario 7', '2020-05-22');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (7, 6, 'Este es el comentario 8', '2020-07-09');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (13, 8, 'Este es el comentario 9', '2020-06-30');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (6, 8, 'Este es el comentario 10', '2020-06-19');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (1, 5, 'Este es el comentario 11', '2020-05-09');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (15, 8, 'Este es el comentario 12', '2020-06-17');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (9, 1, 'Este es el comentario 13', '2020-05-01');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (5, 2, 'Este es el comentario 14', '2020-05-31');

INSERT INTO
    comentario (post_id, usuario_id, texto, fecha)
VALUES
    (3, 4, 'Este es el comentario 15', '2020-06-28');

-- 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
SELECT
    usuario.email,
    post.id,
    post.titulo
FROM
    usuario
    INNER JOIN post ON usuario.id = post.usuario_id
WHERE
    usuario.id = 5;

-- 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizado por el usuario con email usuario06@hotmail.com.
SELECT
    usuario.email,
    comentario.id,
    comentario.texto
FROM
    usuario
    INNER JOIN comentario ON usuario.id = comentario.usuario_id
WHERE
    usuario.email <> 'usuario06@hotmail.com';

-- 6. Listar los usuarios que no han publicado ningún post.
SELECT
    usuario
FROM
    usuario
    LEFT JOIN post ON usuario.id = post.usuario_id
WHERE
    post.id IS NULL;

-- 7. Listar todos los post con sus comentarios (incluyendo aquellos que no posee comentarios).
SELECT
    post.id,
    post.titulo,
    comentario.texto
FROM
    post
    LEFT JOIN comentario ON post.id = comentario.post_id;

-- 8. Listar todos los usuarios que hayan publicado un post en Junio.
SELECT usuario.email, post.titulo, post.fecha FROM usuario INNER JOIN post ON usuario.id = post.usuario_id WHERE post.fecha BETWEEN '2020-06-01' AND '2020-06-30' ORDER BY post.fecha;