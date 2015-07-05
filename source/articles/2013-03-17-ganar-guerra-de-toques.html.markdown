---
title: Cómo ganar una guerra de toques de Facebook de forma definitiva
date: 2013-03-17
tags: scripts, facebook, bookmarklet
lang: es
---

{% img right-small /2013/03/poke-war.jpg %}

**Cansado** de que te toquen en Facebook? Sos incapaz de ignorar los toques, tienes que responderlos, pero ya estás desperdiciando demasiado tiempo y te rompe mucho las bolas? Fear not!

Simplemente van a la página de toques en Facebook y ejecutan el siguiente script en un navegador web moderno:

{% highlight javascript %}
setInterval(function(){
  var pokes = document.querySelectorAll('.pokesDashboard .prs .uiIconText');
  for(var i = 0; i < pokes.length; ++i){
    pokes[i].click();
  }
}, 1000);
{% endhighlight %}

También pueden agregarlo a marcadores arrastrando el siguiente link a la barra de marcadores: 
<a href="javascript:setInterval(function(){    var pokes = document.querySelectorAll('.pokesDashboard .prs .uiIconText');   for(var i = 0; i < pokes.length; ++i){      pokes[i].click();    }  }, 1000);">
	Autotocar
</a>

Recuerden que tienen que dejar la pestaña abierta para que siga funcionando, así que la pinnean y la dejan ahí a un costadito y listo.

La única desventaja es que te va a pokear a TODOS tus amigos, no solo a uno en especial. Pero me daría mucha paja mejorarlo. Capaz que algún día hago una extensión de Chrome. *Algún día*

Y ahora, me voy a seguir procrastinando.