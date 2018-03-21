## Resumen

Solución para realizar backups en la nube de google de manera automática.

En este caso realizamos backups 2 veces por día (Ejecutadas por tareas programadas, ver tarea_programada.bat) comprimimos ese/esos archivo/s utilizando 7z y luego con rclone los subimos a GDrive.

NOTA: En este caso se busca en determinada carpeta el archivo con fecha de modificación más reciente y ese es el que se utiliza para realizar el backup.

## Instalacion

1. Descargar:
* [rclone](https://rclone.org/downloads/)
* [7-Zip](https://www.7-zip.org/download.html)

2. Instalar **rclone** en *C:/rclone/* y dentro de esta carpeta crear una llamada *"BackupSQLtoDrive"* quedando la ruta completa: *C:/rclone/BackupSQLtoDrive/*

3. Instalar **7-Zip** en *C:/%programfiles%/7-Zip/*

4. **Configurar rclone**:

(Doc: https://rclone.org/drive/)

Open cmd

	> cd C:/rclone/
	> rclone config
	> name>BackupSQL

	> n (New remote)
	> 10 (Google Drive)
	> client_id> (Enter, VACIO)
	> client_secret> (Enter, VACIO)
	> root_folder> (Enter, VACIO)

En este paso se nos abrirá una ventana en el navegador para iniciar sesión en GDrive y autorizar a rclone.

	> Configure this as a team drive?> NO
	> y (This is OK)

5. Descomprimir todos los archivos de **"BackupSQLtoDrive.7z"** adentro de **C:/rclone/BackupSQLtoDrive/**

6. Editar **"BackupSQLtoDrive.bat"** y definir en la variable *"sucursal"* el nombre/nro de la sucursal en cuestion. (Ej: "sucursal=9012")

7. Crear el directorio de la sucursal en **GDrive** (Ej: para la  sucursal "9012".. crear carpeta cuyo nombre es "9012") en el cual van a ir a parar los archivos subidos

---------------------------

## Setup

Correr **tarea_programada.bat** > Script que crea  las tareas programadas para realizar los backups.

## Test

Para testear que todo funcione y se suban los archivos vamos a ejecutar lo siguiente:

1. **test_upload_file.bat** > Script que crea un archivo de texto, intenta subirlo al GDrive que configuramos y luego lo borra localmente.
2.  **BackupSQLtoDrive.bat** > Script principal, una vez termine la ejecución de este el backup debería ser realizado de la forma correcta.

## Notas

**.gitignore** > Archivo para ignorar determinados archivos y/o extensiones.

**BackupSQLtoDrive.bat** > Script principal.

**README.md** > Readme del repo.

**correr_invisible.bat** > Script que ejecuta *invisible.vbs* y le pasa por parametro *BackupSQLtoDrive.bat*.

**invisible.vbs** > Se encarga de ocultar (hacer invisible / correr en background) la ejecución del script pasado por parámetro.

**tarea_programada.bat** > Script que agrega las tareas programadas al programador de tareas.

**test_upload_file.bat** > Script que crea un archivo de texto, intenta subirlo al GDrive que configuramos y luego lo borra localmente.

## Author

**Nahuel Krowicki**

* nahuelkrowicki@gmail.com

* [github/nkrowicki](https://github.com/nkrowicki)
