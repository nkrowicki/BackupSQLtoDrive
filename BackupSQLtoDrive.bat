@echo off
 
REM Nahuel Krowicki
REM nahuelkrowicki@gmail.com
REM github.com/nkrowicki
 
 
 
setlocal EnableDelayedExpansion
 
set "file_registro_bkp=C:\rclone\BackupSQLtoDrive\registro_bkpDrive.txt"
(
echo ##############################
echo -  INICIO %DATE% %TIME%  -
echo ------------------------------
) >> !file_registro_bkp!
 
 
 
REM Indicar la sucursal (sera la carpeta en la nube, previo a esto debe estar creada)
set sucursal=9012
 
REM Nombre que le dimos cuando configuramos rclone (nombre_gdrive) el ":/" tiene que ir luego del nombre
set "nombre_gdrive=BackupSQL:/SINERGIE/"
set "destino_nube=!nombre_gdrive!!sucursal!"

REM La variable de abajo contiene la ruta que va a utilizar la BBDD luego de comprimirse (El que se debe subir y luego eliminar)
set "archivo_a_subir=C:\rclone\BackupSQLtoDrive\BBDD_!sucursal!.7z"
 
REM Cantidad de archivos que queremos obtener (nlines)
set nlines=1
set count=0
 
REM Directorio que contiene los backups
set "dir_bkp=C:\Sinergie\SiGEmMaster\"
 
REM Listamos segun fecha (+ nuevo a + viejo) el directorio bkp
for /f "delims=" %%a in ('dir /b /o-d !dir_bkp!') do (
 
REM Chequeamos que no estemos en el maximo de archivos definidos arriba
if not !count!==!nlines! (
 
REM Contador aumenta 1
set /a count=!count!+1
 
REM archivo es la variable que va a contener el nombre de archivo src a comprimir
set "archivo=!dir_bkp!%%a"

REM cd al directorio de 7z
cd !programfiles!\7-Zip\

REM Comprimimos la BBDD para subirla
7z.exe a !archivo_a_subir! !archivo!


REM Lineas de abajo de prueba para ver como toma variables y como sale (seria el comando sin el echo)
REM echo !nlines! !count!
 
REM Grabamos esto en un archivo de texto para futuro control
 
echo C:\rclone\rclone copy !archivo! !destino_nube! >> !file_registro_bkp!
 
REM Utilizamos rclone para subir el archivo en cuestion a la nube
C:\rclone\rclone copy !archivo_a_subir! !destino_nube!

REM Eliminamos el archivo que contiene la BBDD comprimida
DEL !archivo_a_subir!
 
 
))
 
 
(
echo ------------------------------
echo -  FIN %DATE% %TIME%  -
echo ##############################
) >> !file_registro_bkp!
 
exit
