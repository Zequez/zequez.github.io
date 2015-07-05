---
title: Como entrar a la página de administración del router de Fibertel y cambiar opciones
date: 2012-08-13
tags: how-to
lang: es
---

Bueno, si sos usuario de Fibertel te habrás dado cuenta que al intentar ingresar a la página de administración del router de Fibertel, no carga.

![center](/uploads/2012/08/Snap-2012-08-13-at-16.35.34.png)

Copiamos 192.168.0.1 y lo ponemos en nuestro navegador y no pasa nada, se queda cargando...

Sin embargo, si le hacemos un ping, responde...

{% img center 2012/08/Snap-2012-08-13-at-16.36.03.png %}

¿Qué nos dice esto? No mucho, es para confundir a la gente que lee, y una excusa para poner otra imagen.

Yo lo segundo que intenté fue entrar por Telnet...

![center](/uploads/2012/08/Snap-2012-08-13-at-16.39.48.png)

Y tampoco funcionó.

Entonces se me ocurrió reiniciar al router a la configuración de fábrica. Pero antes que nada, tenés que **desconectar el router del cable de televisión**, y esto es <big>**MUY IMPORTANTE.**</big> ¿Se entiende?

Luego tenés que mantener apretado el botón de reset durante 10 segundos, pero yo lo mantengo apretado durante 30 por si acaso, porque en realidad no tengo idea el tiempo exacto.

![center](/uploads/2012/08/IMG_3303.jpg)

Si no encuentran ningún botón de reset es porque en realidad es un agujero. Y si siguen sin encontrarlo miren la foto que le saqué la punta del escarbadientes. Y si siguen sin encontrarlo fíjense si tienen <a href="http://www.motorola.com/Video-Solutions/US-EN/Products-and-Services/Voice-and-Data-Consumer-Premise-Equipment/DOCSIS-Modems-Gateways-and-eMTAs/Wireless-Cable-Modem-Gateways/SBG901_US-EN">el mismo router the yo</a>. Si no es el mismo router sigan buscando, el botón está ahí. Y si siguen sin encontrarlo, chequeen que el artefacto en cuestión sea, de hecho, un router.

Muy bien, ahora entramos de nuevo a 192.168.0.1, y epa, ¿qué pasó? Carga.

![center](/uploads/2012/08/Snap-2012-08-13-at-16.47.03.png)

Nota: No necesitás conectarlo por cable, se puede entrar desde la red wifi "Motorola", sin contraseña.

¡Yay! Problema solucionado, a comer perdices! NO, seguí leyendo.

Primero lo primero, pueden entrar con el usuario `admin` o el usuario `root`, y la contraseña `motorola` en ambos casos. Hagan lo que hagan es lo mismo, así que ni siquiera sé para qué se los digo, solo quería que quedara en claro que hay 2 usuarios, porque en la <a href="http://help.cableone.net/HSD/Modem/PDF/SBG901_User_Guide.pdf">documentación del router</a> no lo dice.

Bueno, ya están adentro, ahora hagan todo lo que tienen que hacer, cambien el nombre y password del WiFi, abran puertos, hagan lo que se les cante.

![center](/uploads/2012/08/Snap-2012-08-13-at-16.47.11.png)

Listo, terminaste? Seguro no? Bueno, ahora conectá el cable de televisión de nuevo. Esperá 30 segundos. Intentá cargar 192.168.0.1. Nope, nada, **otra vez bloqueado**.

¿Qué pasó?

Los muy buenos de Fibertel **te actualizan el firmware del router remotamente**, y ya sabes como dicen, con mucho poder viene mucha facilidad para cagar a la gente. Esto sería una feature muy buena, mantener el firmware actualizado para solucionar problemas de seguridad, pero el problema es que ellos te instalan su propia versión, la cual **tiene bloqueado el acceso**.

**¿Solución definitiva?** Llamás a Fibertel y les decís que querés que te pongan el modem/router en modo "bridge", entonces se queda solo como modem y te conectás con un router propio. Pero eso, tenés que **comprar un router**. Mi única recomendación es que no compren TP-Link porque todo lo que sea de TP-Link *es una garcha.

Bueno, eso es todo, espero que les haya gustado, chauuuuu (?)

_* Opinión basada en experiencias personales._

