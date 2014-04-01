---
layout: post
title: PHP Friend Spammer v0.1
date: '2011-01-04 08:00:42 -0800'
categories:
- Scripts
tags: [PHP]
---
Bueno, hace un tiempo una amiga mía se le ocurrió molestarme, y para ello comenzó a poner "Me gusta" en cada una de mis fotos, lo cual generó un maremoto de notificaciones en Facebook impidiéndome ver otras notificaciones importantes y molestándome mucho...

El otro día debido a una discusión, amenacé a una amiga con hacerle lo mismo... pero de manera un poco más geek. Así que decidí crear un script que hiciera esto por mí. Pero en vez de dar "Me gusta" a las fotos, lo hace en cada uno de los posts, logrando que solo sea notificada la víctima y no las otras personas en las fotos...

Cómo me daba pereza hacerlo en C++, e iba a tardar mucho más, decidí hacerlo en PHP, ya que tiene todo lo necesario...

Tiene soporte para:


- Darle "Me gusta" a todos los posts
- Quitar los "Me gusta" de todos los posts
- Seguir desde el último post que le diste "Me gusta"
- Establecer un intervalo entre cada "Me gusta"

Podrán notar que los textos que salen en la consola están escritos algunos en español y algunos en inglés. Eso es porque soy inconsistente y distraído y no me di cuenta de cambiarlos todos al mismo lenguaje una vez terminado el script xD.

He aquí el dichoso script...

{% highlight php %}
<?php
set_time_limit(0);

function clrscr() {
	if (preg_match("/Windows/i", $_SERVER['OS'])) {
		system("cls");
	}
	else {
		system("clear");
	}
}

function last_page($url = false) {
	if ($url) {
		file_put_contents("last_url.txt", $url);
	}
	else {
		if (file_exists("last_url.txt")) {
			return file_get_contents("last_url.txt");
		}
		else {
			return "";
		}
	}
}

function request_data(&$email, &$pass, &$url, &$interval, &$remove) {
	$handle = fopen ("php://stdin","r");

	echo "Ingresa tu email registrado en Facebook:\n";
	$email = trim(fgets($handle));
	clrscr();
	echo "Ingresa tu contraseña de Facebook:\n";
	$pass = trim(fgets($handle));
	echo "¿Intervalo mínimo entre cada notificación?\n";
	echo "Recomendado 10 segundos, ya que Facebook te bloquea por una hora si es muy seguido\n";
	$interval = (int) trim(fgets($handle));
	clrscr();
	echo '¿Deseas invertir la polaridad y quitar los "Me gusta" de cada uno de sus post? (si/no)' . "\n";
	if (trim(fgets($handle)) == "si") {
		$remove = "ul&amp;";
	}
	$last_page = last_page();
	if ($last_page) {
		echo "¿Deseas seguir spameando desde donde quedaste en la última sesión? (si/no)\n";
		if (trim(fgets($handle)) == "si") {
			$url = last_page();
			return;
		}
	}
	echo "¿Cuál es el perfil de la víctima?\n";
	echo "Formato: facebook.com/ejemplo\n";
	$profile = trim(fgets($handle));
	$url = "http://m.$profile";
}

function bake_cookies($contents) {
	$matches = Array();
	$cookies = "";
	foreach ($contents["Set-Cookie"] as $cookie) {
		preg_match("/^(\w*=.*?; )/", $cookie, $matches);
		$cookies .= $matches[1];
	}
	return $cookies;
}

$useragent = "Mozilla/5.0 (Windows; U; Windows NT 6.1; es-ES; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10";

$email = $pass = $victim_url = $interval = $remove = "";
request_data($email, $pass, $victim_url, $interval, $remove);
$post_data = "email=".htmlentities($email)."&pass=".htmlentities($pass);

// Get the login page
echo "Loading login page...\n";

$contents = false;
while (!$contents) {
	$contents = file_get_contents("http://m.facebook.com/login.php?http");
}
$matches = Array();
preg_match("/action=\"(\/login?.*?)\"/", $contents, $matches);
$url = "http://m.facebook.com" . html_entity_decode($matches[1]);

echo "Login page loaded!\n";
/////////////////////////////

// Login to get the cookies
echo "Sending login request!\n";

$opts = array(
  'http'=>array(
    'method'=> "POST",
    'host'=> "m.facebook.com",
		'user_agent' => $useragent,
		'header' => Array(
									"Referer: http://m.facebook.com/login.php?http",
									"Content-Type: application/x-www-form-urlencoded"
								),
		'content' => $post_data
  )
);
stream_context_get_default($opts);

$contents = get_headers($url, 1);
$cookies = bake_cookies($contents);
echo "Logged in! Cookies got!\n";
echo $cookies . "\n";
/////////////////////////////////

// Get the profile page
$opts = array(
  'http'=>array(
    'method'=>	"GET",
		'host'=> "m.facebook.com",
		'user_agent' => $useragent,
    'header'=> Array(	"Content-Type: text/html",
											"Cookie: $cookies"
							)
  )
);
stream_context_get_default($opts);

$exit = false;
$likes = 0;
while (!$exit) {
	$contents = false;
	while (!$contents) {
		echo "Requesting page...\n";
		$contents = file_get_contents($victim_url);
	}
	echo "Loaded!\n";

	preg_match_all("/href=\"(\/a\/like\.php\?{$remove}time.*?)\">/", $contents, $matches);

	if (is_array($matches[1])) {
		foreach ($matches[1] as $link) {
			$link = "http://m.facebook.com" . html_entity_decode($link);
			file_get_contents($link);
			$likes++;
			if (empty($remove)) {
				echo "$likes Likes!\n";
			}
			else {
				echo "$likes Unlikes!\n";
			}

			sleep($interval);
		}
	}

	preg_match("/__m_more_item__\"><a href=\"(\/wall\.php\?id.*?)\">/", $contents, $matches);
	if (!isset($matches[1])) {
		$exit = true;
	}
	else {
		$victim_url = "http://m.facebook.com" . html_entity_decode($matches[1]);
	}

	last_page($victim_url);
}

?>
{% endhighlight %}

Simplemente pegan el código en un archivo, luego lo ejecutan desde la consola con PHP y siguen los pasos...

Eso si, tengan cuidado, pongan un intervalo razonable, por ejemplo 10 segundos, ya que si le das "Me gusta" a muchos posts Facebook te va a terminar bloqueando y no va a funcionar más por una hora y pico...

Cosas para hacer en un futuro:

- Pasarlo a C++
- Darle una interface gráfica
- Hacer un videotutorial

Aprovecho para probar el sistema para postear asincrónicamente los post de Wordpress ya que mañana me voy a un pequeño viaje de 2 días. Y no voy a poder postear porque no creo que haya wi-fi donde voy =|

¡Saludos! ¡No hagan muchas maldades con el script! jaja

