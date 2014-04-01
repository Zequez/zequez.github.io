---
layout: post
title:  "Chau Wordpress!"
date:   2014-03-22 23:56:05
categories: vida
---

Por fin me deshice de Wordpress! Finalmente, después de años, DÉCADAS (?), de quejarme de que no tenía un blog como la gente, me armé uno.

El diseño es *hand-made* en Photoshop. Es un work in progress, pero lo quiero mantener simple.

El sistema que estoy utilizado es [Jekyll][jekyll]. Suena a algún tipo de asesino. Pero en realidad no es más que un sistema de blogging estático. Todas estas páginas que ves son estáticas, son generadas por Jekyll cada vez que escribo un post. Eso explica la falta de comentarios no? Igual en Wordpress ya había desactivado los comentarios porque eran 90% spam. Capaz que le pongo comentarios de Facebook después.

Dónde lo hosteo? En Github! Github ofrece un servicio de hosting gratuito para usuarios. [Pueden ver el código fuente del blog acá][sitio-github].

Dónde está la página de "about"? No ta. Se fue. No sé, me da paja actualizarla. Así que para saber quién soy vas a tener que investigarlo por tu cuenta. Aunque tenés [una breve descripción de mi persona][breve-descripcion] arriba a la derecha, le tenés que pasar el mouse por encima a mi nombre o foto.

Qué queda por hacer?

1. Tengo que mover las cosas de `/sandbox` acá. Especialmente por [Target Shooter](/2011/01/20/minijuego-target-shooter-1-0/)
2. Armar algo para poder escribir los posts en otro lenguaje. Porque hay algunos artículos que deberian estar en inglés o ser multilingües.

Quedan otras cosas por hacer, pero las voy a hacer antes de publicar este post, así que en realidad si estás leyendo esto ya las hice. A menos que seas yo, y estés releyendo lo que acabás de escribir. Dejá de perder el tiempo!

Por otro lado, una de las cosas que voy a extrañar de Wordpress es que acá no tengo spellcheck, porque estoy escribiendo desde el IDE. O sea, las faltas ortográficas son inperdonables!

Pero mirá esto: 

{% highlight ruby %}
def ruby_yay(honour_guest)
  puts "Yay! #{honour_guest}!"
end

ruby_yay 'Jekyll'

#=> Yay! Jekyll!
{% endhighlight %}

Tengo *colorificación* de código por lenguaje, no está requetesupercopado? A mí me gusta.

Y bueno, nada, si te gustó el post dejame comentarios y puntos. Chau.

[jekyll-gh]: https://github.com/mojombo/jekyll
[jekyll]:    http://jekyllrb.com
[sitio-github]: https://github.com/Zequez/zequez.github.io
[breve-descripcion]: http://www.youtube.com/watch?v=kvrdK22YLlk
