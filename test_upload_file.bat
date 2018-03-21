@echo off

setlocal EnableDelayedExpansion

REM Indicar la sucursal (sera la carpeta en la nube, previo a esto debe estar creada)
set /p sucursal=NroSucursal

REM Nombre que le dimos cuando configuramos rclone (nombre_gdrive) el ":/" tiene que ir luego del nombre
set "nombre_gdrive=BackupSQL:/SINERGIE/"
set "destino_nube=!nombre_gdrive!"

set "archivo=C:\rclone\BackupSQLtoDrive\archivoprueba_!sucursal!.txt"
echo.
echo.
echo --------------------------------------------------------
echo Creando archivo
echo.
echo [INTENTAR] textoprueba en !archivo!
echo textoprueba >> !archivo!
echo.
echo Fin creacion archivo
echo.
echo --------------------------------------------------------
echo.
echo Testeando subida...
echo.
echo [INTENTAR] C:\rclone\rclone copy !archivo! !destino_nube!
C:\rclone\rclone copy !archivo! !destino_nube!
echo.
echo Fin intentar subida
echo.
echo --------------------------------------------------------
echo.
echo Intentar borrar archivo
echo.
echo [INTENTAR] del forzado !archivo!
del -f !archivo!
echo.
echo Fin intentar borrar !archivo!
echo.
echo.
echo ##################
echo #  FIN DEL TEST  #
echo ##################
echo.
echo.
pause
exit