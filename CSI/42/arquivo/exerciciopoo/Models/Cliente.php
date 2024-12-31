<?php

namespace Models;

use Models\Usuario as U;
require_once 'Usuario.php';

class Cliente extends Usuario {
      public $telefone;
      public $endereco;

}

