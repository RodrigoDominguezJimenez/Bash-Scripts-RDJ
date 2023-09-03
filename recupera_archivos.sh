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
