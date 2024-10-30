<?php

require_once 'app/models/movie.model.php';
require_once 'app/views/json.view.php';

class MovieApiController
{
  private $model;
  private $view;

  public function __construct()
  {
    $this->model = new MovieModel();
    $this->view = new JSONView();
  }

  public function getMovies($req, $res)
  {
    // captura de parámetro GET para orden
    $orderBy = null;
    if (isset($req->query->orderById)) {
      $orderBy = 'id_movie ' . $this->_verifyCondition(strtolower($req->query->orderById));
    }
    if (isset($req->query->orderByTitle)) {
      $orderBy = 'title ' . $this->_verifyCondition(strtolower($req->query->orderByTitle));
    }
    if (isset($req->query->orderByRelease)) {
      $orderBy = 'release_date ' . $this->_verifyCondition(strtolower($req->query->orderByRelease));
    }
    if (isset($req->query->orderByCompany)) {
      $orderBy = 'company ' . $this->_verifyCondition(strtolower($req->query->orderByCompany));
    }
    if (isset($req->query->orderByGenre)) {
      $orderBy = 'main_genre ' . $this->_verifyCondition(strtolower($req->query->orderByGenre));
    }

    // captura de parámetro GET para filtro
    $filterBy = null;
    $filterValue = null;
    if (isset($req->query->filterByGenre)) {
      $filterBy = 'main_genre';
      $filterValue = $this->_verifyGenre(strtolower(urldecode($req->query->filterByGenre)));
    }

    // captura de parámetros GET para paginación
    $offset = null;
    $limit = null;
    if (
      isset($req->query->page) && isset($req->query->limit)
      && is_numeric($req->query->page) && is_numeric($req->query->limit)
    ) {
      $page = $req->query->page;
      $limit = $req->query->limit;
      $offset = ($page - 1) * $limit;
    }

    $movies = $this->model->getMovies($orderBy, $filterBy, $filterValue, $offset, $limit);

    if (!$movies) {
      return $this->view->response("Movies Not Found", 404);
    }

    return $this->view->response($movies);
  }

  private function _verifyCondition($condition)
  {
    if ($condition == "asc" || $condition == "desc") {
      return $condition;
    }
  }

  private function _verifyGenre($genreFilter)
  {
    $genres = $this->model->getGenres();

    foreach ($genres as $genre) {
      if ($genre->main_genre === $genreFilter) {
        return $genre->main_genre;
      }
    }
  }

  public function getMovieById($req, $res)
  {
    $id_movie = $req->params->id;

    $movie = $this->model->getMovie($id_movie, null);

    if (!$movie) {
      return $this->view->response("Movie Not Found", 404);
    }

    return $this->view->response($movie);
  }

  public function addMovie($req, $res)
  {
    if (!isset($req->body->id_movie) || empty($req->body->id_movie)) {
      return $this->view->response("Data Is Missing (id_movie)", 400);
    }
    if (!isset($req->body->title) || empty($req->body->title)) {
      return $this->view->response("Data Is Missing (title)", 400);
    }
    if (!isset($req->body->poster_path) || empty($req->body->poster_path)) {
      return $this->view->response("Data Is Missing (poster_path)", 400);
    }
    if (!isset($req->body->release_date) || empty($req->body->release_date)) {
      return $this->view->response("Data Is Missing (release_date)", 400);
    }
    if (!isset($req->body->overview) || empty($req->body->overview)) {
      return $this->view->response("Data Is Missing (overview)", 400);
    }
    if (!isset($req->body->company) || empty($req->body->company)) {
      return $this->view->response("Data Is Missing (company)", 400);
    }
    if (!isset($req->body->main_genre) || empty($req->body->main_genre)) {
      return $this->view->response("Data Is Missing (main_genre)", 400);
    }

    $id_movie = $req->body->id_movie;
    $title = $req->body->title;
    $poster_path = $req->body->poster_path;
    $release_date = $req->body->release_date;
    $overview = $req->body->overview;
    $company = $req->body->company;
    $main_genre = $req->body->main_genre;

    $movie = $this->model->getMovie($id_movie, null);
    if ($movie) {
      return $this->view->response("The id = $movie->id_movie belongs to the movie = $movie->title.", 400);
    }

    $genre = $this->model->getGenre(null, $main_genre);
    if (!$genre) {
      return $this->view->response("You must enter an existing gender.", 400);
    }

    $this->model->add($id_movie, $title, $poster_path, $release_date, $overview, $company, $genre->id_genre);
    $newMovie = $this->model->getMovie($id_movie, null);
    if (!$newMovie) {
      return $this->view->response("Error inserting a movie.", 500);
    }

    return $this->view->response($newMovie, 201);
  }

  public function updateMovie($req, $res)
  {
    if (!isset($req->params->id) || empty($req->params->id) || !is_numeric($req->params->id)) {
      return $this->view->response("Invalid Id", 404);
    }

    $id_movie = $req->params->id;

    $movie = $this->model->getMovie($id_movie, null);
    if (!$movie) {
      return $this->view->response("The id = $id_movie does not have an associated record.", 404);
    }

    if (!isset($req->body->title) || empty($req->body->title)) {
      $title = null;
    } else {
      $title = $req->body->title;
    }
    if (!isset($req->body->poster_path) || empty($req->body->poster_path)) {
      $poster_path = null;
    } else {
      $poster_path = $req->body->poster_path;
    }
    if (!isset($req->body->release_date) || empty($req->body->release_date)) {
      $release_date = null;
    } else {
      $release_date = $req->body->release_date;
    }
    if (!isset($req->body->overview) || empty($req->body->overview)) {
      $overview = null;
    } else {
      $overview = $req->body->overview;
    }
    if (!isset($req->body->company) || empty($req->body->company)) {
      $company = null;
    } else {
      $company = $req->body->company;
    }
    if (!isset($req->body->main_genre) || empty($req->body->main_genre)) {
      $id_genre = null;
    } else {
      $main_genre = $req->body->main_genre;
      $genre = $this->model->getGenre(null, $main_genre);
      if (!$genre) {
        return $this->view->response("You must enter an existing gender.", 400);
      }
      $id_genre = $genre->id_genre;
    }

    $this->model->edit($id_movie, $title, $poster_path, $release_date, $overview, $company, $id_genre);
    $updatedMovie = $this->model->getMovie($id_movie, null);
    if (!$updatedMovie) {
      return $this->view->response("Error when modifying a movie.", 500);
    }

    return $this->view->response($updatedMovie, 201);
  }
}
