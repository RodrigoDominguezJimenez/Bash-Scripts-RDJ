# Bash-Scripts-RDJ
En este repositorio se presentan 3 scripts hechos en la clase de Administración de Servidores impartida por el maestro Gerardo Contreras Vega.

##  Script para borrar archivos y ser recuperados en el siguiente script
Mi estrategía para recuperar estos archivos "eliminados" es crear un directorio con **sudo** y **mkdir** en la raiz llamado **/Papelera** y ahi mover los archivos que el usuario seleccione para "borrar".
A continuación se explica mi código.

Al ejecutar el script es importante que el usuario indique que archivo borrar en la misma linea, por ejemplo:

	bash borra_archivos.sh ejemplo.txt
Ahora vayamos al código.
Esta parte del código solamente indicamos en interprete de nuestro sistema y un encabezado de presentación.

	#!/bin/bash
	############################
	#Rodrigo Domínguez Jiménez
	#Fecha: 31 de agosto del 2023
	#############################
Un mensaje a la terminal para que el usuario vea que se está ejecutando el script y el arhivo está en proceso de "eliminación". Los sleeps simulan el tiempo que se procesa la tarea, aunque no son necesarios estos sleep.

	echo Borrando archivo
	sleep 2
	echo ...
	sleep 2
	echo .......
Está es la parte importante, ya que el comando **mv** mueve el archivo que ingresamos desde terminal anteriormente al directorio **/Papelera** que creamos desde un principio.

	sudo mv $1 /Papelera
	sleep 2
	echo Archivo borrado
Es un código muy sencillo con varias áreas de mejora, pero iré aprendiendo más con la práctica.
A continuación muestro el código ya completo.

	#!/bin/bash
	############################
	#Rodrigo Domínguez Jiménez
	#Fecha: 31 de agosto del 2023
	#############################
	echo Borrando archivo
	sleep 2
	echo ...
	sleep 2
	echo .......
	sudo mv $1 /Papelera
	sleep 2
	echo Archivo borrado
 
## Script para recuperar los archivos "eliminados" con el script anterior
En este script tuve muchos problemas al querer pedir el nombre del archivo y la ruta de destino que el usuario quisiera, tanto intenté que tuve que cambiar de estrategia. Ahora tengo que definirle al usuario la ruta donde se recuperaría el archivo y todo lo que haya estado en papelera se recuperará.

Vayamos al código a explicarlo mejor. Esta parte del código solamente indicamos en interprete de nuestro sistema y un encabezado de presentación.

	#!/bin/bash
	#############################
	#Rodrigo Dominguez Jimenez
	#Fecha: 31 de agosto del 2023
	#############################
Aqui se define una variable **dir_destino** la cual ya marca que el directorio donde se recuperarán los archivos de la Papelera sera en **Escritorio**, la línea con el **ls** no hace más que mostrar los archivos que se encuentran en la Papelera. Las demás lineas solamente son mensajes a pantalla.

	dir_destino="/home/rodrigodj/Escritorio"
	echo mostrando archivos eliminados a recuperar
	ls /Papelera
	echo "                                         " 
	echo ruta
	echo Recuperando archivos
	echo ...
	sleep 2 
Entonces con el comando **mv** se mueven todos estos archivos de la Papelera al directorio destino predefinido y se reestablecen. Como el directorio **/Papelera** se encuentra en la raiz y está fuera del usuario **/home** es necesario ejecutar con sudo el comando 

	sudo mv /Papelera/* $dir_destino
	echo Archivo recuperado con exito en Escritorio
Este script de igual forma es muy sencillo con varias áreas de mejora, pero iré aprendiendo más con la práctica. A continuación muestro el código ya completo.

	#!/bin/bash
	#############################
	#Rodrigo Dominguez Jimenez
	#Fecha: 31 de agosto del 2023
	#############################
	dir_destino="/home/rodrigodj/Escritorio"
	echo mostrando archivos eliminados a recuperar
	ls /Papelera
	echo "                                         " 
	echo ruta
	echo Recuperando archivos
	echo ...
	sleep 2 
	sudo mv /Papelera/* $dir_destino
	echo Archivo recuperado con exito en Escritorio
