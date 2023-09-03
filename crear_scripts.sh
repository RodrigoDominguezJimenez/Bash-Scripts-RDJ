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
