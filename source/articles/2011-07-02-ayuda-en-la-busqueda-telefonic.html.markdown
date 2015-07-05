---
title: '¿Cómo eliminar la página de "Ayuda en la búsquda"
  de Telefónica?'
date: 2011-07-02
tags: how-to
lang: es
---

**Nota:** esto sirve para cualquier proveedor de Internet que haga lo mismo que Telefónica.

Si tenés internet con Telefónica/Speedy entonces habrás notado que cuando intentás entrar a una página que no existe, como por ejemplo <a rel="nofollow" href="http://tarniag.com/">http://tarniag.com/</a> porque tipean con anagramas, Telefónica "gentilmente" los va a redireccionar a una página que supuestamente los ayuda a encontrarla, obviamente con publicidad, y cambiándote complétamente la dirección en la barra de direcciones, así que si te habías equivocado en una puta letra tenés que escribir todo denuevo.

![wide](/uploads/2011/07/11.jpg)

Bueno, esto sucede porque estamos usando el servidor DNS de Telefónica, pero como el Internet es genial, podemos usar el DNS que se nos cante, yo uso los de Google, porque me cae bien, que son 8.8.8.8 y 8.8.4.4

Ahora, para hacer esto:
En Windows 7 lo siguiente:

1. Click en inicio
2. Escribimos Conexiones de Red y apretamos enter

En Windows XP lo siguiente:

1. Click en inicio
2. Panel de control -> Conexiones de Red
3. Hacemos click derecho y vamos a propiedades, en el dispositivo de red que uses para conectarte.
4. Hacemos doble click en el item de la lista que dice Protocolo Internet (TCP/IP), o (TCP/IPv4) en Windows 7
5. En la nueva ventana hacemos click en donde dice "Usar las siguientes direcciones de servidores DNS"
6. "Servidor DNS preferido" pegá 8.8.8.8, en "Servidor DNS alternativo", 8.8.4.4

Listo, ahora si vamos a <a rel="nofollow" href="http://tarniag.net/"></a> nos va a aparecer el error que nuestro navegador web tiene preparado para la situación, y no le dejamos un solo centavo más a nuestra codiciosa ISP:

![wide](/uploads/2011/07/21.jpg)

Y podemos hacer click felizmente en la sugerencia de Google Chrome o nuestro navegador web.

