<?php

require_once 'app/models/user.model.php';
require_once 'app/views/json.view.php';
require_once 'libs/jwt.php';

class UserApiController
{
  private $model;
  private $view;

  public function __construct()
  {
    $this->model = new UserModel();
    $this->view = new JSONView();
  }

  public function getToken()
  {
    $auth_header = $_SERVER['HTTP_AUTHORIZATION'];
    $auth_header = explode(' ', $auth_header);
    if (count($auth_header) != 2) {
      return $this->view->response("Incorrect Credentials", 400);
    }
    if ($auth_header[0] != 'Basic') {
      return $this->view->response("Incorrect Credentials", 400);
    }
    $user_pass = base64_decode($auth_header[1]);
    $user_pass = explode(':', $user_pass);
    $user = $this->model->getUserByEmail($user_pass[0]);
    if ($user == null || !password_verify($user_pass[1], $user->password)) {
      return $this->view->response("Incorrect Credentials", 400);
    }
    $token = createJWT(array(
      'sub' => $user->id_user,
      'email' => $user->email,
      'role' => 'admin',
      'iat' => time(),
      'exp' => time() + 300,
      'Saludo' => 'Hola',
    ));
    return $this->view->response($token);
  }
}
