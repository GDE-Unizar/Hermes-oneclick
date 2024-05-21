# Hermes en un click

Instrucciones para conectarse a Hermes en 1 click.
Si se configura correctamente, basta ejecutar el fichero/comando, esperar, y se abrirá hermes. Todo automático.

## Windows

### Instalación
Apartado A: inicio de sesión en el frontal de hermes sin contraseña. Esto es necesario para que el script no te pregunte cada vez, es un procedimiento estándar (puedes buscar en google 'ssh public key', o si ya lo tienes configurado saltarte este apartado).
1) Abre la carpeta oculta C:\Users\<tu_user>\.ssh. Lo más probable es que no tengas ahí los ficheros "id_rsa" y "id_rsa.pub". En caso de que los tuvieras, sáltate el siguiente paso.
2) [Sólo si no tienes los ficheros mencionado antes] Ejecuta en consola (cmd o powershell) el comando "ssh-keygen". Te hará algunas preguntas para configurar una clave nueva, puedes dejar las opciones por defecto (pulsa enter en las preguntas). Esto te creará los fichero mencionados.
3) Copia el fichero id_rsa.pub a hermes (con el programa de transferencia de ficheros que tengas). Mételo en la carpeta oculta /home/gde/<tu_user>/.ssh y renómbralo a "authorized_keys".
> Ahora ya deberías poder conectarte al frontal de hermes sin contraseña (lo cual es cómodo ya de por si). Recuerda que no necesitas ningún programa especial, windows trae ssh de fábrica, "ssh hermes.cps.unizar.es" en la consola cmd es suficiente.


Apartado B: descargar tigervnc, es un programa que hace lo mismo que el vncviewer pero es de código libre y permite automatizar el proceso.
1) Descárgate el programa tigervnc viewer: https://tigervnc.org/ El enlace directo de la versión actual (por si no lo quieres buscar) es https://sourceforge.net/projects/tigervnc/files/stable/1.12.0/vncviewer64-1.12.0.exe/download
2) Mueve el ejecutable a alguna carpeta, recomiendo crear una nueva ya que ahí meteremos 3 ficheros en total.


Apartado C: script. Me costó horrores hasta que conseguí hacerlo funcionar, puedes intentar entenderlo pero es complejo.
1) Descarga el script del repo [hermes.bat](hermes.bat?raw=1) en la misma carpeta que el ejecutable del tiger


Apartado D: vcn automático. Ya que hemos automatizado el inicio en hermes, hagamos lo mismo con vnc, no?
1) Copia de hermes el fichero "/home/gde/<tu_usuario>/.vnc/passwd" en la carpeta de tu ordenador donde está el ejecutable y el script.


### Comprobación:
Deberías tener creada una nueva carpeta con 3 ficheros: vncviewer64-1.12.0.exe (o la versión que sea, apartado B), hermes.bat (apartado C) y passwd (copiado de hermes, apartado D)


### Ejecución:
Ejecuta el script. Si todo va bien y ya tienes un frontal de hermes activo debería abrirse casi inmediatamente. En caso de que no lo tengas se abrirá una consola que pondrá al final 'Creating....'. No hace falta que hagas nada, puedes dejarlo (lo que ha hecho es ejecutar los comandos necesarios y esperar a que el nodo remoto esté listo). Tras unos 10-20 segundos, a veces puede que un poco más, se abrirá la pantalla automáticamente.

Recuerdo que en tiger la tecla para 'salir' de la pantalla completa es F8 (se puede cambiar si lo necesitas).

## Linux

Para linux hay que seguir los mismos pasos, solo cambian las rutas y el fichero a descargar [hermes.sh](hermes.sh?raw=1)]
