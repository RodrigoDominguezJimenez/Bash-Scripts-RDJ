# Bash-Scripts-RDJ
En este repositorio se presentan 3 scripts hechos en la clase de Administración de Servidores impartida por el maestro Gerardo Contreras Vega.

###  Script para borrar archivos y ser recuperados en el siguiente script
Mi estrategía para recuperar estos archivos "eliminados" es crear un directorio con **mkdir** en la raiz llamado **/Papelera** y ahi mover los archivos que el usuario seleccione para "borrar".
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
