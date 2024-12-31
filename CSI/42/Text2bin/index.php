<?php

class Text2bin
{

    public function str2bin($str){
        //dividir em array array
        $str_arr = str_split($str, 4);
        $bin = '';

        for($i = 0; $i<count($str_arr); $i++)
            //converter, corrigir e concatenar
            $bin = $bin.str_pad(decbin(hexdec(bin2hex($str_arr[$i]))), strlen($str_arr[$i])*8, "0", STR_PAD_LEFT);
        
        //retornar o resultado
        return $bin;
    }

}

$var = "";

if(isset($_GET['texto'])) {
	$texto = $_GET["texto"];

	$text2bin = new Text2bin();
	$var = $text2bin->str2bin($texto);

	$array = str_split($var, 40);
}

//echo($var);

?>

<!DOCTYPE HTML>
<!--
	Story by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Conversor Text2Bin</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper" class="divided">

				<!-- One -->
					<section class="banner style1 orient-left content-align-left image-position-right fullscreen onload-image-fade-in onload-content-fade-right">
						<div class="content">
							<h1>Conversor Text2Bin</h1>
							<p class="major">Digite seu texto no campo abaixo e ao clicar no botao "Enviar" ele será convertido para binário.</p>
							
							<ul class="actions stacked">
								
								<?php
								//echo($var);

								if(isset($_GET['texto'])) {
								
								echo("<li>Seu texto convertido é:</li>");

									foreach ($array as $line_num => $line) {
										echo "$line<br/>\n";
									}

								}

								?>
								
							</ul>

							<form action="" method="get">
								<input type="text" name="texto">
								<input type="submit" value="Enviar">
							</form>

						</div>
						<div class="image">
							<img src="images/banner.jpg" alt="" />
						</div>
					</section>


			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>

