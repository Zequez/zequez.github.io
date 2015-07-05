---
title: Abrir todas las notificaciones de Facebook al mismo tiempo
date: 2011-04-04
tags: scripts, extensions, facebook, javascript
lang: es
---

{% img right /2011/04/Untitled-1.png title="Facebook open all" alt="LALALALA" %}

¿Cansado de tener que hacer clicks interminables en Facebook para abrir todas las notificaciones?

—¡¡Si!!

¿¡Sos una persona muy solicitada que le llegan toneladas de notificaciones minuto a minuto!?

—¡¡¡SI!!!

Entonces esta extensión para navegadores web que hice, es para vos ^^

¿Qué hace?

- Agrega un par de botones a la derecha de la ventana de notificaciones en Facebook.
- Haciendo click en "Open all" abre todas las notificaciones no leídas en nuevas pestañas.
- Si marcas la casilla "Don't open likes" entonces cuando abre las notificaciones se saltea las que sean "Me gusta".
- Además al ser un userscript, en vez de una extensión para un navegador web en especial, ¡funciona en todos los navegadores web! ^^
- Tiene el texto en inglés para hacerlo más estándar =P, pero si quieren lo editan y lo cambian (?)

¿Qué NO hace?

-  Un café con leche
- Medialunas
- Destruir el mundo
- Encontrar a Wally
- Comprarte una computadora nueva
- Salir a caminar por la calle en búsqueda del tesoro perdido del capitán Ricky Lamentos

 

Para instalarla en Firefox primero tienen que instalar <a href="https://addons.mozilla.org/es-ES/firefox/addon/greasemonkey/">GreaseMonkey</a>.
En Chrome detecta automáticamente.
En Opera creo que también.
En Internet Explorer no tengo las más puta idea, pero sé que se puede. De todos modos, usá un navegador web decente.

<big>
<a title="Descargarla, en serio, es este link" href="http://dl.dropbox.com/u/3682061/Internet/ZequezBlog/FBOpenAll.user.js">¡DESCARGAR LA EXTENSIÓN!</a>
</big>
Actualizado 30/7/2011

Versión 1.1.1

Ooop! Me olvidé de sacar una cosa de cuando estaba haciendo la extensión y se abrían todas las notificaciones, incluso las leídas ._. Ya está ahora, ya lo arreglé, sorry -.-

Versión 1.1.0

Solucioné el tema de que se abrían **ventanas duplicadas**, Facebook había comenzado a incluir parámetros GET en las notificaciones y las comparaciones de las URL no daban bien.

Agregué un checkbox que te permite seleccionar **si querés o no querés abrir los likes**, si está seleccionada, abre todas las notificaciones que no sean likes/me_gusta. A petición de un amigo (?)

Además, ahora convertí la extensión en Userscript, por lo que: **¡¡¡Puede ser usada en todos los navegadores web!!!** ^^

**ATENCIÓN:** Si ya habías instalado esta extensión antes, desinstalala en <a href="chrome://extensions">chrome://extensions</a> antes de instalar esta versión, porque al convertirla a Userscript pasa como una extensión complétamente nueva y no actualiza.

Actualizado 3/6/2011

Versión 1.0.1

Facebook cambió algunos IDs en la página y la extensión se rompió, pero ya lo arreglé y la descargan de nuevo y listo ^^

Bueno, cansado de tener que hacer click en cada una de las notificaciones para abrirlas en pestañas separadas finalmente hice una extensión de Google Chrome que lo hace por mí.

{% img center /2011/04/screenshot.png alt="Facebook open all" title="Hermoso, simplemente hermoso (?)" %}

Simplemente <a href="http://dl.dropbox.com/u/3682061/Internet/ZequezBlog/FBOpenAll.user.js">descargan la extensión</a>, la instalan, recargan la pestañas de Facebook y listo, ya tienen el botón.

Lo que hace:


- Abre las notificaciones no leidas (las que están en azul) en pestañas separadas.
- Si hay 2 notificaciones que llevan al mismo lugar, solo abre la URL una vez.

Lo que no hace:


- Abrir las notificaciones una vez que se marcaron como leidas (unos pocos segundos después de que hiciste click en el ícono de las notificaciones).
- Un café.

Y eso es todo, espero que a alguien le resulte de utilidad ^^

PD: No está en la lista de extensiones oficial porque tengo que pagar US$5 y no tengo tarjeta de crédito u.u (aunque de todos modos a menos que fuese una extensión grosa no lo pagaría xD)

<big><a title="Descargarla, en serio, es este link" href="http://dl.dropbox.com/u/3682061/Internet/ZequezBlog/FBOpenAll.user.js">¡DESCARGAR LA EXTENSIÓN!</a></big>

