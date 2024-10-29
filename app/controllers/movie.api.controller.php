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

    $movies = $this->model->getMovies($orderBy);

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
