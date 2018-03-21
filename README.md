## Instalacion

1. Descargar:
* [rclone](https://rclone.org/downloads/)
* [7-zip](https://www.7-zip.org/download.html)

2. Instalar rclone en C:/rclone/ y dentro de esta carpeta crear una llamada "BackupSQLtoDrive" quedando la ruta completa: C:/rclone/BackupSQLtoDrive/

3. Instalar 7z en C:/%programfiles%/7-Zip/

4. Configurar rclone:

(Doc: https://rclone.org/drive/)

	* Abrir cmd
	* cd C:/rclone/
	* rclone config
	* name>BackupSQL

	* new remote
	* 10 (Google Drive)
	* client_id> (Enter, VACIO)
	* client_secret> (Enter, VACIO)
	>* root_folder> (Enter, VACIO)

En este paso se nos abrirá una ventana en el navegador para iniciar sesión en GDrive.
	* Configure this as a team drive?> NO
	* y (This is OK)

5. Descomprimir todos los archivos de "BackupSQLtoDrive.7z" adentro de C:/rclone/BackupSQLtoDrive/

---------------------------

## Setup

Correr:
- 1. test_upload_file.bat (Testear si suben los archivos)
- 2. tarea_programada.bat (Para crear las 2 tareas programadas)
- 3. BackupSQLtoDrive.bat

5- Editar "BackupSQLtoDrive.bat" y definir en la variable sucursal el nombre de la sucursal en cuestion

6- Crear el directorio de la sucursal en el drive (Ej: para la  sucursal "9012".. crear carpeta cuyo nombre es "9012")


## Synopsis

At the top of the file there should be a short introduction and/ or overview that explains **what** the project is. This description should match descriptions added for package managers (Gemspec, package.json, etc.)

## Code Example

Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Tests

Describe and show how to run the tests with code examples.

## Author
Nahuel Krowicki
mail: nahuelkrowicki@gmail.com
