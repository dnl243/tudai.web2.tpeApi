<?php

require_once 'libs/router.php';
require_once 'app/controllers/movie.api.controller.php';

$router = new Router();

$router->addRoute('movies', 'GET', 'MovieApiController', 'getMovies');
$router->addRoute('movies/:id', 'GET', 'MovieApiController', 'getMovieById');

$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);

// TABLA DE RUTEO
// url                              resource    verb    controller            method
// ---                              --------    ----    ----------            ------

// --- lista de películas ---
// https://localhost/tudai.web2.tpeApi/api/movies

// api/movies                       movies      get     MovieApiController    getMovies

// --- lista de películas según orden elegido ---

// parámetro GET = incorrecto => películas sin orden,
// parámetro GET = correcto => valor = incorrecto => orden ascendente por defecto,
// parámetro GET = correcto => valor = correcto => orden seleccionado

// api/movies?orderById=asc         movies      get     MovieApiController    getMovies
// api/movies?orderById=desc        movies      get     MovieApiController    getMovies
// api/movies?orderByTitle=asc      movies      get     MovieApiController    getMovies
// api/movies?orderByTitle=desc     movies      get     MovieApiController    getMovies
// api/movies?orderByRelease=asc    movies      get     MovieApiController    getMovies
// api/movies?orderByRelease=desc   movies      get     MovieApiController    getMovies
// api/movies?orderByCompany=asc    movies      get     MovieApiController    getMovies
// api/movies?orderByCompany=desc   movies      get     MovieApiController    getMovies
// api/movies?orderByGenre=asc      movies      get     MovieApiController    getMovies
// api/movies?orderByGenre=desc     movies      get     MovieApiController    getMovies