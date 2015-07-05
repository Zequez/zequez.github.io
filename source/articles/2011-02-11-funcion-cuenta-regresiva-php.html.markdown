---
title: Función de tiempo faltante para una fecha en PHP
date: 2011-02-11
tags: scripts, php
lang: es
---
Mientras trabajaba en un proyecto di con el usual caso de necesitar una función que me permita mostrar el tiempo faltante para una fecha dada en años, meses, semanas, días, horas, minutos, segundos o una combinación entre estos...

Me quedó tan linda que no pude evitar hacer un post en el blog con esta por si a alguien le sirve ^^

{% highlight php %}
<?php
function dateTo($str, $t1, $t2 = false) {
	// Si nos dan un segundo parámetros calculamos el tiempo entre dos fechas
	$t = $t1-($t2?$t2:time());

	// Un array con todos los reemplazos que vamos a usar
	$p = array(
		'{s}'=>1,
		'{i}'=>60,
		'{h}'=>60*60,
		'{d}'=>60*60*24,
		'{w}'=>60*60*24*7,
		'{m}'=>60*60*24*30,
		'{y}'=>60*60*24*365
	);

	// Obtenemos todos los tiempos que fueron proveídos en la string
	preg_match_all("/\{[sihdwmy]\}/", $str, $ma);

	// Creamos un array ordenado del mayor al menor tiempo requerido
	$found = Array();
	foreach ($ma[0] as &$m) {
		$found[$m] = $p[$m];
	}
	arsort($found);

	// Reemplazamos la string con los tiempos
	foreach ($found as $i => &$fo) {
		$str = str_replace($i, (int) ($t/$fo), $str);
		$t = $t % $fo;
	}

	return $str;
}
?>
{% endhighlight %}

Para usarla lo único que tienen que hacer es:

{% highlight php %}
<?php
dateTo("Faltan {y} años, {m} meses, {w} semanas, {d} días, {h} horas, {i} minutos y {s} segundos para llegue Marty McFly", strtotime("2015-10-21"));
?>
{% endhighlight %}

Lo cual devolvería algo como:

{% highlight php %}
#=> Faltan 4 años, 8 meses, 3 semanas, 4 días, 3 horas, 18 minutos, 57 segundos para que llegue Marty McFly
{% endhighlight %}

También te permite escribir algo como:

{% highlight php %}
<?php
dateTo("Faltan {m} meses y {s} segundos para el 2012!", strtotime("2012-1-1"));
?>
{% endhighlight %}

Lo cual devolvería algo como:

{% highlight php %}
Faltan 10 meses y 1998806 segundos para el 2012!
{% endhighlight %}

Ya que detecta la el interval de tiempo más grande y saltea los demás para mostrar los intervalos del mayor al menor...

Y también podés escribir la fecha negativa para calcular el tiempo que pasó desde un momento dado:

{% highlight php %}
<?php
dateTo("Hace {d} días, {h} horas, {i} minutos y {s} segundos que fue mi cumpleaños!", strtotime("2010/12/14"));
?>
{% endhighlight %}

Lo cual devuelve:

{% highlight php %}
Hace -59 días, -20 horas, -54 minutos y -14 segundos que fue mi cumpleaños!
{% endhighlight %}

Ahh pero está negativo, no me sirve &not;&not;
Bueno, para eso está el tercer parámetro! ^^

{% highlight php %}
<?php
dateTo("Hace {d} días, {h} horas, {i} minutos y {s} segundos que fue mi cumpleaños!", time(), strtotime("2010/12/14"));
?>
{% endhighlight %}

Lo que te da este hermoso resultado

{% highlight php %}
Hace 59 días, 20 horas, 57 minutos y 17 segundos que fue mi cumpleaños!
{% endhighlight %}

Creo que con esos ejemplos ya queda bastante claro como va la función :P
En un futuro tengo ganas de implementarle condicionales, para poder escribir algo como esto:

{% highlight php %}
<?php
dateTo("[Faltan [{m} meses, ][{d} días, ][{h} horas, ][{i} minutos y ][{s} segundos para año nuevo!]]Feliz año nuevo!", strtotime("2012/1/1"));
?>
{% endhighlight %}

Y que elimine las partes entre corchetes si el tiempo dentro de estos es 0 o negativo, para así poder reciclar más fácil la misma string...

Bueno, eso es todo, espero que a alguien le sirva, yo sigo con mi "proyectito" que ya lo interrumpí demasiado con esto jaja.

**EDITO:**

Acá hice una variación de la función para obtener el tiempo faltante en un array. El array es opcional, si no lo ponés devuelve el tiempo faltante de todos los tiempos (por así decirlo jaja).

{% highlight php %}
<?php
function dateToArray($arr, $t1 = false, $t2 = false) {
	$p = array(
		's'=>1,
		'i'=>60,
		'h'=>60*60,
		'd'=>60*60*24,
		'w'=>60*60*24*7,
		'm'=>60*60*24*30,
		'y'=>60*60*24*365
	);

	if (!is_array($arr)) {
		$t2 = $t1;
		$t1 = $arr;
		$r = &$p;
	}
	else {
		foreach ($arr as $ar) {
			$r[$ar] = $p[$ar];
		}
	}

	arsort($r);

	$t = $t1-($t2?$t2:time());
	foreach ($r as $i => $q) {
		$r[$i] = (int) ($t/$q);
		$t = $t % $q;
	}

	return $r;
}
?>
{% endhighlight %}

El funcionamiento es básicamente el mismo, solo que en el primer parámetro ponés un array en vez de una string, con las keys de los nombres de los tiempos, y, m, w, d, h, i, s.

Si alguien tiene ganas puede combinar las 2 funciones en una sola :P.
Yo no tengo. Y tampoco necesito hacerlo jaja.

