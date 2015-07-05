---
title: Pequeño snippet para debuggear velocidad de código en PHP
date: 2011-03-03
tags: php, scripts
lang: es
---
Si sos como yo, que -todavía- no usa xDebug en PHP pero querés saber por qué tu script anda lento, y escribir microtime() cada 5 líneas te tiene harto, entonces usá esta pequeñísima función que lo único que tenés que hacer es llamarla con un nombre y listo.

```php
<?php
function lap($name = false) {
	static $last = 0;
	$now = microtime(true);
	if ($name) {
		echo "Lap $name " . ($now-$last) . " seconds!<br/>\n";
	}
	$last = $now;
}
?>
```

El uso sería así:

```php
<?php
lap();
funcionQueTardaPoco();
lap('primer función');
funcionQueTardaMucho();
lap('segunda funcion');
?>
```

Y el resultado sería algo así:

```
Lap primer función 0.0090179443359375 seconds!
Lap segunda función 1.4245828127234901 seconds!
```

Me pareció útil así que la postié xD

