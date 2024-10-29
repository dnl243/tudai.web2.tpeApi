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
    if (isset($req->query->page) && isset($req->query->limit)
     && is_numeric($req->query->page) && is_numeric($req->query->limit)) {
      $page = $req->query->page;
      $limit = $req->query->limit;
      $offset = ($page-1) * $limit;
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
}
