# SteamBlock
Script que realiza una bloqueacion de Steam en el firewall ay procede a abrir el Baldurs gate 3, cuando este se cierra se vuelve a desbloquear el firewall.

> [!NOTE]
>Para poder añadirlo a steam como juego hay que añadir el cmd.exe como juego y luego cambiar los parametros de lanzamiento.

## Instalación
Descargar la ultima version en esta [enlace](https://github.com/WekarXD/SteamBlock/releases/latest).
Guardar el archivo descargado en la raiz del juego, luego se puede crear un acceso directo o [añadirlo a Steam](#instalación) como juego.

## Añadir a Steam como juego
En Steam añadir un juego que no es de Steam y buscar el cmd.exe encontrado en la ruta **"C:\Windows\System32\cmd.exe"**
En las propiedades del juego que se acaba de crear en steam y modificar las siguientes opciones.
 - Cambiar el Nombre y el icono por los deseados.
 - En destino sustituir por la siguiente linea.
```
 "C:\Windows\System32\cmd.exe" /k D:\SteamLibrary\steamapps\common\Baldurs Gate 3\SteamBlock.bat
```
- En iniciar en sustituir la siguiente linea.
```
D:\SteamLibrary\steamapps\common\Baldurs Gate 3
```