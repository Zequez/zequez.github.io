---
layout: post
title: PictoDraw Alpha 0.0.1 (?)
date: '2011-01-09 08:30:31 -0800'
categories:
- Aplicaciones
- Videojuegos
tags: [JavaScript]
---
Bueno, comento que estoy haciendo un juego en HTML5 canvas. No puedo dar muchos detalles porque es super clasificado (?), pero hoy cerré Facebook y no me distraje ni un segundo en toda la noche, fue genial, lo voy a hacer más seguido xD.

Notese que va a ser un juego online así que una vez que termine el cliente (yo creo que en menos de una semana ya tengo terminado, aunque no con un diseño agradable xD), voy a empezar con el servidor, el cual lo voy a intentar hacer en C++ en vez de PHP como lo tenía planeado al principio, por dos razones:


- Necesito multithreading
- El servidor va a correr en una computadora mía en un principio, y C++ es más eficiente

Acá dejo una screenshot del juego en cuestión, esta noche completé el sistema de dibujado e hice un dibujo hermoso (?).

{% img center 2011/01/Untitled.png %}

Lo que ven abajo son los dibujos convertidos en texto haciendo como que se envían al servidor. Todavía no sé si enviar cada vez que el mouse se mueve o cuando terminan una línea. El problema de la primera es que consume muchos más recursos, ya que tiene que enviar muuuuuuchos paquetes juntos, y el problema de la segunda es que las imágenes en los otros clientes van a aparecer "de repente" si la persona que dibuja mantiene apretado durante mucho tiempo. Ya voy a pensar en algo, quizás haga un intermedio con un intervalo de envío, o algo así xD.

A la derecha se puede ver el canvas con el hermoso dibujo. Arriba a la derecha está la barra de herramientas, a la cual le tengo que agregar después un selector exacto de colores y tamaño de pinceles, y quizás un bote de pintura, QUIZáS.

Arriba a la izquierda está el chat, y abajo a la izquierda la tabla de posiciones :P.

Notese que el nombre no es definitivo, quizás sea el del título, quizás no xD.

Y ahora me voy a dormir que son casi las 9 de la mañana y "mañana" me tengo que levantar a las 13 masomenos porque voy a ir a patinar con amigos ^^

