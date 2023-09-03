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
 
## Script para crear otro script con un encabezado dentro del directorio de /bin/
Mi estrategia para ese script fué pedirle al usuario el nombre que quisiera para su script para después crearlo con ese nombre, en la parte del encabezado escribir texto dirigido hacia el script del usuario, finalmente mover el script al directorio de **/bin/**.

Ahora vayamos al código.
Esta parte del código solamente indicamos en interprete de nuestro sistema y un encabezado de presentación.

	#!/bin/bash
	##################################
	#Rodrigo Domínguez Jiménez
	#Fecha:31 de agosto del 2023
	##################################
De mi parte fué el crear una variable llamada fecha  la cuál arrojará a fecha de creación del script en el encabezado. Le pido al usuario el nombre de su script y lo capturo en teclado con el comando **read**. Después creo una variable llamada **script_name** la cuál va a crear el script con el nombre que el usuario ingresó desde teclado y agregandole la extensión de Bash **.sh**. 
En la línea de echo ocurren varias cosas, aquí es la parte donde creó el encabezado en el nuevo script. Primero el comando **-e** va a permitir ejecutar otros caracteres, en mi caso es el salto de linea **\n**. Después el operando **>** en vez de mandar a escribir lo que está dentro del echo a pantalla lo va a direccionar al interior del archivo creado anteriormente (el script del usuario). 
En la siguiente línea se le dan los permisos correspondientes de ejecución al script creado y las demás lineas son solo mensajes en pantalla sin mucha importancia pero necesarios para la interacción con el usuario.

	fecha=$(date +"%Y-%m-%d")
	echo Nombre del nuevo script:
	read script_name
	script_name="$script_name.sh"
	echo -e "#!/bin/bash \nScript generado por Rodrigo Dominguez Jimenez el $fecha" > "$script_name"
	chmod +x "$script_name"
	echo Creando archivo
	echo ...
	sleep 2
Vamos a la parte final del código, dejando los mensajes de echo a un lado aqui se mueve el script creado al directorio ya de **/bin** usando el primer comando **sudo** ya que **/bin/** se encuentra fuera de **/home/**.Y ya habrá quedado hecho este script.

	echo Archivo creado, archivo moviendose a /bin/
	sudo mv $script_name  /bin
	echo Script creado en BIN exitosamente
Este script fué el que más disfruté elaborar. A continuación muestro el código ya completo.

	#!/bin/bash
	##################################
	#Rodrigo Domínguez Jiménez
	#Fecha:31 de agosto del 2023
	##################################
	fecha=$(date +"%Y-%m-%d")
	echo Nombre del nuevo script:
	read script_name
	script_name="$script_name.sh"
	echo -e "#!/bin/bash \nScript generado por Rodrigo Dominguez Jimenez el $fecha" > "$script_name"
	chmod +x "$script_name"
	echo Creando archivo
	echo ...
	sleep 2
	echo Archivo creado, archivo moviendose a /bin/
	sudo mv $script_name  /bin
	echo Script creado en BIN exitosamente


 
