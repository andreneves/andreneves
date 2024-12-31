<?php
/**
 * Formação Full Stack PHP Developer UpInside
 * @author Robson V. Leite <https://www.upinside.com.br>
 *
 * Document content and charset
 */
header("Content-Type: text/html; charset=utf-8");


/**
 * [ PHP Basic Config ] Configurações basicas do sistema
 * Configura o timezone da aplicação
 * Define a função para output de erros.
 */
date_default_timezone_set("America/Sao_Paulo");
set_error_handler("fullStackPHPErrorHandler");

/**
 * [ php config ] Altera modo de erro e exibição do var_dump.
 * display_errors: Erros devem ser exibidos.
 * error_reporting: Todos os tipos de erros
 * overload_var_dump: Omitir a linha de caminho do var_dump.
 */
ini_set("display_errors", 1);
ini_set("error_reporting", E_ALL);
ini_set('xdebug.overload_var_dump', 1);

/**
 * [ interface ] Style, icon and logo
 */
echo "<link rel='stylesheet' href='../../fullstackphp/fsphp.css'/>",
"<link rel='icon' href='https://www.upinside.com.br/uploads/fsphpicon.png'/>",
"<img class='logofsphp' src='https://www.upinside.com.br/uploads/fsphp.png'/>";


/**
 * [ Title Function ] Cria o título do arquivo para o browser
 */
function fullStackPHPClassName($className)
{
    echo "<title>{$className} | Full Stack PHP Developer</title>";
}


/**
 * [ Debug session ] Cria uma linha de sessão para exemplos
 * @var $color = red | green | yellow | blue
 * @var line = __LINE__
 */
function fullStackPHPClassSession($session, $line, $color = null)
{
    $line = (!empty($line) ? " <span class='line-session'>| Linha {$line}</span>" : "");
    $session = (!empty($session) ? "[ {$session}{$line} ]" : "");
    $color = (!empty($color) ? "var(--{$color})" : "");
    echo "<div class='code line' style='background-color: {$color}'>{$session}</div>";
}


/**
 * [ Default errors ] Função para exibir erros do PHP
 */
function fullStackPHPErrorHandler($error, $message, $file, $line)
{
    $color = ($error == E_USER_ERROR ? "red" : "yellow");
    echo "<div class='trigger' style='border-color: var(--{$color}); color:var(--{$color});'>[ Linha {$line} ] {$message}<small>{$file}</small></div>";
}
