@echo off
REM Creado por Rodrigo Amaya Centeno, 19 Febrero 2006
title Instalacion Software de Adicional...
echo 				ADVERTENCIA!				
echo 			  NO CIERRE ESTA VENTANA!			
echo 			  NO CIERRE ESTA VENTANA!			
echo 			  NO CIERRE ESTA VENTANA!
echo 			  NO CIERRE ESTA VENTANA!
echo 			  NO CIERRE ESTA VENTANA!
echo.
echo Esta ventana se cerrara sola, cuando termine de realizar sus operaciones.		
start /high /wait mysql-essential-5.0.51a-win32.msi /passive

REM Recuerdos de un viejo pasado:
REM start /high /wait mysql-connector-odbc-3.51.12-win32.msi /passive
REM start /high /wait mysql-5.0.18-win32.msi /passive
REM start /high /wait mysql-connector-odbc-3.51.12-win32.msi /quiet
REM start /high /wait mysql-5.0.18-win32.msi /quiet