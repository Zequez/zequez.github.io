---
layout: post
title: Desautorizar todas las aplicaciones de Facebook automáticamente
date: '2011-02-16 18:46:22 -0800'
categories:
- Vida
- Scripts
- Guías
tags:
- facebook
- apps
- overflow
- javascript
- script
- automatic
- automático
- automatizado
- muchas apps
---
Hoy vi que el muro de mi hermano estaba siendo spammeado por aplicaciones spammers de Facebook, entonces le dije que las desautorizara para que se detuvieran...

Cuando fuimos a sus opciones de privacidad nos dimos cuenta que tenía 120 aplicaciones, y Facebook no permitía eliminarlas a todas de una sola vez! Una por una, esperando a que aparezca el cartelito de confirmación!

Por ello es que escribí un script que te permite desautorizar muchas apps de Facebook de manera automarizada, lo dejás corriendo en la página para eliminar aplicaciones y te vas a hacer otra cosa en otra pestaña...

{% highlight javascript %}
javascript: function eventFire(el,etype){if(el.fireEvent){el.fireEvent('on'+etype);}else{var evObj=document.createEvent('Events');evObj.initEvent(etype,true,false);el.dispatchEvent(evObj);}}
var remove=[];var i=0;removeNext();function removeNext(){if(typeof(remove[i])=="object"){eval(remove[i].href);++i;setTimeout(function(){confirmRemove();},300);}
else{remove=document.getElementsByClassName('fbSettingsListItemDelete');i=0;setTimeout(removeNext,100);}}
function confirmRemove(){var remove=document.getElementsByName('remove');if(typeof(remove[0])=="object"){eventFire(remove[0],"click");acceptRemove();}
else{setTimeout(confirmRemove,100);}}
function acceptRemove(){var ok=document.getElementsByName('ok');if(typeof(ok[0])=="object"){eventFire(ok[0],"click");removeNext();}
else{setTimeout(acceptRemove,100);}}
{% endhighlight %}

Simplemente entran a <a href="http://www.facebook.com/settings/?tab=applications">http://www.facebook.com/settings/?tab=applications</a> y pegan el script en la barra de direcciones de navegador. Van a empezar a aparecer cartelitos y a aceptarse automáticamente, debido a que Facebook no te permite eliminar otra aplicación hasta que no terminaste de eliminar la otra, tarda aproximadamente ~800ms por app, así que hacé los cálculos para la cantidad de apps que tengas xD.

**AVISO:** Solo lo probé en Chrome, si lo usan en otro navegador y funciona dejen un comentario indicando que así lo hace ^^. Ya no tengo más apps para probar en otro navegador jaja.

