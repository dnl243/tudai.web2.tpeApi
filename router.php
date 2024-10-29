<?php

require_once 'libs/router.php';
require_once 'app/controllers/movie.api.controller.php';

$router = new Router();

$router->addRoute('movies', 'GET', 'MovieApiController', 'getMovies');
$router->addRoute('movies/:id', 'GET', 'MovieApiController', 'getMovieById');

$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);

