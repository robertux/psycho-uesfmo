@echo off
REM Creado por Rodrigo Amaya Centeno, 01 Abril 2006
REM modificado 16/40/2008
title Script de Compilacion NSIS
echo 				ADVERTENCIA!				
echo 			  NO CIERRE ESTA VENTANA!			
echo 			  NO CIERRE ESTA VENTANA!			
echo 			  NO CIERRE ESTA VENTANA!
echo 			  NO CIERRE ESTA VENTANA!
echo 			  NO CIERRE ESTA VENTANA!
start /normal /wait makensis instalador.nsi

REM start /high /wait ..\\src\compilar.bat
REM copy PROG-1.0-Instalacion.exe ..\
REM del PROG-1.0-Instalacion.exe