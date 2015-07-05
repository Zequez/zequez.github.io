---
title: Minijuego Target Shooter 1.0
date: 2011-01-20
tags: videogames, apps, javascript
lang: es
---
Si, es el nombre más original del mundo.

Tengo que confesar que en un principio se llamaba BlindMice, por eso la URL está bajo la dirección de /blindmice en mi sandbox web. Le había puesto así debido a que en un principio la idea era ver cuánto aguantabas pegándole a los objetivos sin ver el mouse, pero cómo siempre me desvié de la idea inicial -costumbre que debo dejar de lado- y lo extendí más de lo necesario.

La buena noticia es que el juego ahora es más completo y bonito, consta de cuatro fases:

1. Normal: Tienes un tiempo límite para dispararles a los objetivos, te da poco tiempo, tu muñeca debe estar entrenada.
2. Ciego: No ves el mouse (no funciona en Opera porque no me deja cambiar el cursor) y tienes que apuntarle a los objetivos. El tiempo límite de cada objetivo es un poco mayor que el dado en el modo normal. El mouse debe ser una extensión de tu mano.
3. Movimiento: Los objetivos atraviesan la pantalla y cada vez son más rápidos. Tus ojos deben ser capaces de percibir un cambio en los pixeles de la pantalla antes de que eso siquiera suceda (?).
4. Aumento: La cantidad de objetivos aumenta cada vez que los matas a todos, también disminuyen su tamaño, y aumenta una ronda cada vez que se juega la fase. Un click en falso y estás acabado.

Bueno, después de tremenda descripción debo agregar que las fases salen al azar -excepto las 4 primeras-, y puedes ver las próximas fases que saldrán en la barra de fases a la izquierda. Cada vez que juegas las fases hay un contador que aumenta la dificultad de dicha fase.

Pueden <a title="Jugar Target Shooter sin Facebook" href="http://zequez.com.ar/sandbox/blindmice/?noface=true"> jugar Target Shooter en la URL original</a>, o pueden hacerlo <a title="Jugar Target Shooter en Facebook" href="http://apps.facebook.com/target_shooter/">en Facebook</a>, notese que si no juegan en Facebook no van a poder presumir sobre sus habilidades con el mouse frente a sus amigos, quedan advertidos.

<a href="http://zequez.com.ar/sandbox/blindmice/?noface=true">
  ![wide](/uploads/2011/01/screenshot.png "Target shooter")
</a>

Poniéndonos un poco más técnicos, quiero comentar que para el desarrollo del minijuego utilicé Canvas de HTML5 y JavaScript, obviamente. Debido a esto, el comportamiento en los distintos navegadores web es distinto:


- En Google Chrome and 10 puntos.
- En Firefox anda 10 puntos pero con pocos FPS.
- En Opera anda 9 puntos, no permite que esconda el mouse para la fase Ciega por lo que pierde la gracia.<
- En Internet Explorer 8/9 no probé porque lo descargué y me dijo que tenía que reiniciar la computadora, y la verdad que la re paja, todavía no lo hice, pero CREO que va a funcionar bien, han hecho bastantes mejoras en las últimas versiones. Eso si, no sé a que velocidad andará el motor JavaScript de IE jaja.

Poniéndonos incluso más técnicos les cuento que este juego lo hice con la versión 0.5 del Game Engine que estoy haciendo (decir Motor de Videojuego queda raro), y me ha ayudado a darme cuenta de las cosas que uno necesita en la práctica durante el desarrollo de los juegos, por lo que ya tengo la lista de cosas que tengo que agregar para la próxima versión jaja.

El código fuente lo pueden ver en <a title="Descargar todo, lol" href="http://zequez.com.ar/sandbox/blindmice/Everything.js">el archivo comprimido JavaScript</a>, lo embellecen con <a title="Ir a JSBeautifier" href="http://jsbeautifier.org/">JSBeautifier</a> y listo, queda casi igual que como lo tengo yo porque como boludo que soy no puse un solo comentario jaja. Ya cuando tenga una versión más estable del motor lo voy a publicar por si a alguien más le sirve. Está todo licenciado bajo la licencia GPLv3, porque me pareció la que más se adaptaba a un proyecto así. A decir verdad nunca había puesto licencia a nada, pero estuve una semana en esto jaja.

Me despido diciendo que no pienso actualizar el juego. En realidad faltaría pulirlo un poco para que quede como versión 1.0, pero vamos a ser buenos y decir que es la versión 1.0 porque se puede jugar bien xD. En realidad puedo agregar fases facilmente debido al modo que lo programé pero de todos modos me da paja. Mañana tengo pensado arrancar con otro proyecto, también en HTML5, o quizás me consiga algo de lectura profunda sobre las API de Facebook y me ponga a hacer alguna app copada.

Ya veremos mañana. Ahora me tomo un descanso: veo si hay algo nuevo en Cuevana, reviso mi amado e indispensable Google Reader, reviso las suscripciones de YouTube, reviso Facebook, cierro pestañas demás, cierro programas demás, voy al baño, vuelvo, tomo agua, y posiblemente después de eso me vaya a dormir. O quizás debería tomar agua. Bueno, no importa, chau! ^^