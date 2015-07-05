---
title: Facebook Chat Updater
date: 2011-02-01
tags: javascript, scripts, extensions, facebook
lang: es
---
{% img right /2011/02/facebook-chat-new.jpg title="Facebook chat" %}

¿Cansados de querer hablarle a una persona por el chat de Facebook y que en el mismísimo momento en que le están por escribir se desconecta? Bueno, yo sí.

Esto sucede porque Facebook actualiza la lista personas conectadas en el chat de manera poco frecuente, y siempre que vas a comenzar a hablarle a una persona.

Tras una tarde de ingeniería inversa en el debugger de Chrome logré descifrar de manera precaria como es que funciona el cliente de Facebook y di con la forma de actualizar la lista de amigos manualmente:

{% highlight javascript %}
  Arbiter._instance._events["buddylist/initialized"][0]._forceUpdate();
{% endhighlight %}

Si pegan el código en la barra de navegación con un "javascript:" detrás de este podrán ver como se actualiza la lista, y si tienen la consola abierta también verá como es que hace un llamado a la dirección "http://www.facebook.com/ajax/chat/buddy_list.php?__a=1" mediante AJAX.

Claro, podrían pegar el código con un setInterval cada vez que entran a Facebook... pero sería muy engorroso. Por esta razón decidí escribir una extensión para Google Chrome -la primera extensión que he hecho- que actualiza la lista de amigos conectados cada 3 segundos una vez que carga la página...

<a title="Descargar extensión Facebook Chat Updater para Google Chrome" href="http://dl.dropbox.com/u/3682061/blog/zequez/facebookChatUpdater.crx">Descargar extensión Facebook Chat Updater para Google Chrome</a>

Siéntanse libres de hacer una extensión para su navegador web favorito usando `Arbiter._instance._events["buddylist/initialized"][0]._forceUpdate();`

