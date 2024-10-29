<?php

class Request
{
  public $body = null; // { nombre: 'Daniel', descripcion: 'Texto descriptivo'}
  public $params = null; // /api/tareas/:id
  public $query = null; // ?soloFinalizadas=true

  public function __construct()
  {
    try {
      // file_get_contents('php://input') lee el body de la request
      $this->body = json_decode(file_get_contents('php://input'));
    } catch (Exception $e) {
      $this->body = null;
    }
    $this->query = (object) $_GET;
  }
}

# $_GET['resource'] = 'api/tareas';
# $_GET['finalizadas'] = false;
# $_GET['orderBy'] = 'prioridad';

// $this->query->orderBy = 'prioridad';
// $this->query->finalizadas = 'false';