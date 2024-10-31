-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2024 a las 01:09:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `g1_db_movies`
--
CREATE DATABASE IF NOT EXISTS `g1_db_movies` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `g1_db_movies`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL,
  `main_genre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`id_genre`, `main_genre`) VALUES
(12, 'aventura'),
(14, 'fantasia'),
(16, 'animación'),
(18, 'drama'),
(27, 'terror'),
(28, 'acción'),
(35, 'comedia'),
(53, 'suspenso'),
(80, 'crimen'),
(878, 'ciencia ficción'),
(10749, 'romance'),
(10751, 'familia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie`
--

CREATE TABLE `movie` (
  `id_movie` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `poster_path` varchar(60) NOT NULL,
  `release_date` date NOT NULL,
  `overview` text NOT NULL,
  `company` varchar(45) NOT NULL,
  `id_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movie`
--

INSERT INTO `movie` (`id_movie`, `title`, `poster_path`, `release_date`, `overview`, `company`, `id_genre`) VALUES
(7451, 'xXx', 'images/movies/67118e573214a7.10911447.jpg', '2002-08-09', 'Xander Cage es tu adicto a la adrenalina estándar sin miedo y con una actitud pésima. Cuando el gobierno de los Estados Unidos lo \\\"recluta\\\" para ir a una misión, no está precisamente emocionado. Su misión: recopilar información sobre una organización que puede estar planeando la destrucción del mundo, dirigida por el nihilista Yorgi.', 'Columbia Pictures', 12),
(365177, 'Borderlands', 'images/movies/jtEZi4eZxDjxcDIeMbkQ8HmvRs1.jpg', '2024-08-07', 'Borderlands se desarrolla en el planeta Pandora. Atraídas por las aparentemente vastos yacimientos minerales, muchas naves colonizadores de la Dahl Corporation (una de las muchas diversas megacorporaciones que aparentemente controlan y gobiernan planetas enteros) viajan al planeta para construir asentamientos. Las operaciones de minería son llevadas a cabo por una cantidad enorme de convictos llevados al planeta por la propia corporación.\r\n', 'Lionsgate', 28),
(519182, 'Mi villano favorito 4', 'images/movies/kqph8UWNOoYgTjYnkAx8dRlLLCq.jpg', '2024-06-20', 'Gru, Lucy y las niñas -Margo, Edith y Agnes- dan la bienvenida a un nuevo miembro en la familia: Gru Junior, que parece llegar con el propósito de ser un suplicio para su padre. Gru tendrá que enfrentarse en esta ocasión a su nueva némesis Maxime Le Mal y su sofisticada y malévola novia Valentina, lo que obligará a la familia a tener que darse a la fuga.\r\n', 'Universal Pictures', 16),
(533535, 'Deadpool y Wolverine', 'images/movies/9TFSqghEHrlBMRR63yTx80Orxva.jpg', '2024-07-24', 'Un Wade Wilson apático se esfuerza en la vida civil. Sus días como el mercenario moralmente flexible Deadpool quedaron atrás. Cuando su mundo natal se enfrenta a una amenaza existencial, Wade debe, a regañadientes, volver a la acción junto a un reacio Wolverine.\r\n', 'Marvel Studios', 28),
(573435, 'Bad Boys: Hasta la muerte', 'images/movies/zp0Y7Nsl4UnWiwX4LxXQXgDfXSz.jpg', '2024-06-05', 'Tras escuchar falsas acusaciones sobre su excapitán y mentor Mike y Marcus deciden investigar el asunto incluso volverse los más buscados de ser necesarios.', 'Sony Pictures Releasing', 28),
(646097, 'Rebel Ridge', 'images/movies/ymTgBQ8rCouE27oHpAUfgKEgRAj.jpg', '2024-08-27', 'Un exmarine debe enfrentarse a la corrupción en un pequeño pueblo cuando la policía le confisca injustamente la bolsa con el dinero para pagar la fianza de su primo.\r\n', 'Netflix', 80),
(726139, 'Project Silence', 'images/movies/7eYasyaCvfJRHdnYl24jqPhf9y0.jpg', '2024-07-11', 'Debido al repentino deterioro de las condiciones meteorológicas, la visibilidad en el puente del aeropuerto se ve gravemente afectada, lo que deja a las personas atrapadas y en riesgo de que el puente se derrumbe debido a una serie de colisiones en cadena y explosiones. En medio del caos, los sujetos caninos \"Echo\" del experimento militar \"Proyecto Silencio\", que estaban siendo transportados en secreto, se liberan y todos los supervivientes humanos se convierten en blanco de ataques implacables.', 'Blaad Studios', 878),
(823219, 'Flow', 'images/movies/enRimDhtFfb7hNTQlOjrgK8O8UO.jpg', '2024-08-30', 'El mundo parece estar llegando a su fin, repleto de vestigios de presencia humana. Gato es un animal solitario, pero como su hogar es arrasado por una gran inundación, encuentra refugio en un barco poblado por varias especies, y tendrá que hacer equipo con ellas a pesar de sus diferencias. En el solitario barco que navega por místicos paisajes desbordados, navegan por los desafíos y peligros de adaptarse a este nuevo mundo..', 'Dream Well Studio', 12),
(877817, 'Wolfs', 'images/movies/uNNVMzJg7NVqxRu8mDLEwIiQgDJ.jpg', '2024-09-20', 'Dos “solucionadores” rivales cruzan sus caminos cuando los llaman a ambos para ayudar a ocultar el desliz de una importante funcionaria de Nueva York. Durante una noche muy intensa, deberán dejar de lado sus pequeñas rencillas -y sus egos- para terminar el trabajo.', 'Smoke House Pictures', 53),
(889737, 'Joker: Folie à Deux', 'images/movies/tMMYwxrPwVPrxz3DqXs8DnVIOx0.jpg', '2024-10-01', 'Secuela de Joker (2019), de nuevo con Phoenix como Arthur Fleck, y que muestra su relación con el personaje de Harley Quinn, interpretado por Lady Gaga.', 'Warner Bros Pictures', 80),
(917496, 'Beetlejuice Beetlejuice', 'images/movies/kWJw7dCWHcfMLr0irTHAPIKrJ4I.jpg', '2024-09-04', 'Después de una tragedia familiar, tres generaciones de la familia Deetz regresan a su hogar en Winter River. La vida de Lydia, que aún sigue atormentada por Beetlejuice, da un vuelco cuando su hija adolescente, Astrid, abre accidentalmente el portal al más allá.\r\n', 'Warner Bros. Pictures', 35),
(933260, 'La sustancia', 'images/movies/uZXQExGj9YfVNH2XCS5yVjx0auh.jpg', '2024-09-09', '\"Tú, pero mejor en todos los sentidos\". Esa es la promesa de La Sustancia, un producto revolucionario basado en la división celular, que crea un alter ego más joven, más bello, más perfecto.', 'Working Title Films', 878),
(957452, 'El Cuervo', 'images/movies/X9iFHeIYgfqoZImvdidx8b9v4R.jpg', '2024-08-21', 'Un año después de que él y su prometida fueran asesinados, un cuervo místico devuelve a Eric a la vida para que pueda clamar su venganza.', 'Davis Films', 14),
(1022789, 'IntensaMente 2', 'images/movies/aQnbNiadeGzGSjWLaXyeNxpAUIx.jpg', '2024-06-11', 'Riley, ahora adolescente, enfrenta una reforma en la Central de sus emociones. Alegría, Tristeza, Ira, Miedo y Asco deben adaptarse a la llegada de nuevas emociones: Ansiedad, Vergüenza, Envidia y Ennui.', 'Pixar Animation Studios', 16),
(1034541, 'Terrifier 3', 'images/movies/5eECVdOWwbsUARVxLA7ENyBYx3H.jpg', '2024-10-09', 'Secuela de \"Terrifier 2\", ambientada en el periodo navideño.', 'Cineverse', 27),
(1079091, 'Romper el círculo', 'images/movies/2EH42blLQzgqwDWxn39RXkTgb91.jpg', '2024-08-07', 'Una mujer atraviesa las tumultuosas etapas de una relación abusiva. Tras mudarse a la ciudad de Boston después de la universidad, decide iniciar su propio negocio como florista y se enamora de un joven neurocirujano.', 'Wayfarer Studios', 10749),
(1114513, 'No hables con extraños', 'images/movies/rdGpSGWNnpHuouEJjXOkzbTyRJk.jpg', '2024-09-11', 'Cuando una familia estadounidense va invitada a pasar un fin de semana en la idílica finca campestre de una encantadora familia británica que conocieron en unas vacaciones, lo que comienza como una escapada de ensueño pronto se convierte en una retorcida pesadilla psicológica.', 'Blumhouse Productions', 27),
(1125510, 'El hoyo 2', 'images/movies/8cnfdskwEmS1HZhenEVYt9P0IYa.jpg', '2024-09-27', 'Un misterioso líder ha impuesto su ley en un brutal sistema de celdas verticales, pero la llegada de una residente desafía su dudoso método de distribución de comida.', 'Basque Films', 18),
(1184918, 'Robot salvaje', 'images/movies/sDoXpaKZmrzCSJH63zZvQQ9A7VK.jpg', '2024-09-12', 'Una robot (la unidad ROZZUM 7134 o «Roz») ha naufragado en una isla deshabitada y deberá aprender a adaptarse al duro entorno, forjando poco a poco relaciones con la fauna local y convirtiéndose en madre adoptiva de una cría de ganso huérfana.', 'DreamWorks Animation', 16),
(1215162, 'Mátalos a todos 2', 'images/movies/rWS8Wo9aN90GcokuvpMNjJYRijA.jpg', '2024-10-24', 'Philip y Suzanne, ahora agentes asociados por la CIA, se dirigen a Europa en una nueva misión.', 'Iervolino & Lady Bacardi Entertainment', 53),
(1329336, 'Los tipos malos: ¿Truco o atraco?', 'images/movies/4njXv4s77hq9VGMOquvRQDiu53W.jpg', '2024-10-02', 'La pícara banda de los tipos malos planea un arriesgadísimo atraco en Halloween de un valioso amuleto en una tenebrosa mansión. ¿Qué podría salir mal?', 'DreamWorks Animation Television', 35),
(1337309, 'Corrupción en Bangkok: Entre el cielo y el infierno', 'images/movies/45Yxq9aEfMgPEq6bGZG0BgbDQge.jpg', '2024-09-26', 'Un rescatista debe luchar por sobrevivir tras verse atrapado en un conflicto entre bandas rivales de los bajos fondos de Bangkok.', 'Kongkiat Production', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`) VALUES
(1, 'web@admin.com', '$2y$10$th8zeOQxEIOTkYz4J0ePmuueSxKJWoCdn2P1MPWymyqZLPQSIf3h2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Indices de la tabla `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id_movie`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10752;

--
-- AUTO_INCREMENT de la tabla `movie`
--
ALTER TABLE `movie`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1337310;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
