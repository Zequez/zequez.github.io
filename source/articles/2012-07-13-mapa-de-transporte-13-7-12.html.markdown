---
title: Mapa de Transporte, Actualización 13.7.12
date: 2012-07-13
tags: apps, mapa-de-transporte
lang: es
---

Bueno, bueno, bueno. Tuve un par de semanas ocupadas (?) Hoy subí una nueva actualización a <a href="http://mapadetransporte.com.ar/mar-del-plata">Mapa de Transporte</a>, hay unas cuantas cosas que hice, y he aquí la lista, o changelog, como lo quieras llamas:

![right-medium](/uploads/2012/07/preview-mapa-de-transporte-13-7-12.png "Super interface gráfica")

- Se pueden <strong>buscar las calles por nombre</strong>.
- Se pueden <strong>compartir los links con las direcciones</strong>.
- <strong>Geolocalización</strong>! Si tu navegador web lo soporta, te va a preguntar si autorizás a la página para activarla.
- Cuando te muestra las direcciones te resalta la parte de la ruta que recorre el colectivo.
- No tenés geolocalización en tu compu? No importa, el punto de origen se guarda para la próxima vez que entres, así que si lo dejás en tu casa, cuando vuelvas, va a seguir ahí.
- Todas las secciones de la barra de la derecha son plegables, incluso la publicidad.
- Con respecto a la publicidad, ahora utiliza el sistema de Google Adsense para Google maps, así que en teoría debería ser más relevante ya que depende del lugar que estés mirando en el mapa.
- Removido el botón de instrucciones, ahora es una sección plegable.
- Ahora también se pueden intercambiar los puntos haciéndoles doble click, por si estás usando un dispositivo sin el botón de la ruedita.
- Ya está preparado el sistema de autocompletado para buscar en los puntos de referencia desde las cajas de búsqueda. Pero todavía no hice el sistema de puntos de referencia, así que no te va a autocompletar nada xD.
- Como nota adicional, ahora cuando comapartís las rutas de los colectivos, la URL queda como /[ciudad]/colectivos/555+552+etc.
- Muchos cambios internos no listados, porque ya no me acuerdo y me olvido de commitearlos porque programo solo. Mala costumbre, ya  me la voy a sacar.

Bueno, eso.

Acá hay un ejemplo de un link que te muestra las <a href="http://mapadetransporte.com.ar/mar-del-plata/origen/Independencia-1337/destino/Constituci%C3%B3n-13337">rutas de colectivos desde Independencia al 1337 hasta Constitución al 1337</a>. O también puede ser un <a href="http://mapadetransporte.com.ar/mar-del-plata/origen/-3801127-5756499/destino/-3800643-5754114">link especificando las latitudes y longitudes de los puntos</a>.

Y lo próximo que voy a implementar es:

- Puntos de referencia: cosas como el Casino, el Hospital Regional, el Faro, la Catedral, etc, para que puedas mirar el mapa y ubicarte más rápido.
- Reescritura grande del sistema de rutas. Esto va a incluir las paradas de los colectivos, y que no haya 20 rutas de colectivos al mismo tiempo en el mapa. Va a quedar todo más bonito si sale como lo tengo pensado.
- Un hermoso cartelito notificándote que estás utilizando un navegador web viejo y que la página no te va a andar. (Internet explorer 8 para abajo.)
- Optimización de la página para ser visitada con dispositivos móviles. Esto incluye probablemente reescritura de CSS para que sea más liviano, tantos efectos especiales a veces creo que son innecesarios (?)
- Otras ciudades además de Mar del Plata, probablemente siga por Tandil que es fácil y Capital, que es todo un desafío (?).
- Frecuencias y horarios de los colectivos. Esto va a requerir que me ponga en contacto con la UTE...

Si la app te sirve compartila, así le sirve a más personas, yay! (en serio, compartila, hacelo por mí (?))

Ante cualquier consulta, sugerencia o lo que se te ocurra, me pueden enviar un email a mi email personal, zequez[arroba]gmail[punto]com, o pueden usar el formulario de contacto de la página, o pueden enviar un email a zequez[arroba]mapadetransporte[punto]com[punto]ar.

Bueno, espero que les haya gustado, esto es todo por hoy. Me voy a hacer 3 <a href="http://es.wikipedia.org/wiki/T%C3%A9cnica_Pomodoro">pomodoros</a> más y a dormir, y capaz que una ducha no haría mal.

