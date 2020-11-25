# Como programar en Ada en Visual Studio Code
<!-- Creado por Markel Ferro -->

VSCode por defecto no tiene un soporte para Ada, y las pocas extensiones que tiene no son de gran ayuda (quitando para darle color al código). A pesar de ello, con unos retoques se puede crear un entorno de trabajo para Ada bastante avanzado.

**Índice**

[Prerequisitos](#prerequisitos)

[Instalación](#instalación)

[Comandos básicos](#Comandos-básicos)

[Features 🚀](#features-🚀)

[Problemas 🔧](#problemas-🔧)


## Prerequisitos

> La guía está pensada para Windows 10 y una distribución Linux basada en Debian. Otros sistemas operativos deberían ser compatibles, pero es posible que requieran pasos extra. 

- Tener instalado GNAT, puedes descargarlo desde la [web oficial de Adacore](https://www.adacore.com/download).

- Añadir la carpeta *bin* de la instalación de GNAT a PATH. Instrucciones para: [Windows](https://medium.com/@01luisrene/como-agregar-variables-de-entorno-s-o-windows-10-e7f38851f11f), [MacOS](https://professor-falken.com/mac/como-anadir-una-nueva-ruta-a-la-variable-path-en-tu-mac/) y [Linux](https://linuxize.com/post/how-to-add-directory-to-path-in-linux/) (en inglés).

> En Windows la dirección suele ser *C:\GNAT\2020\bin*

- Instalar [Visual Studio Code desde su web oficial](https://code.visualstudio.com/Download). Se recomienda marcar la opción *Add "Open with Code" action to Windows Explorer directory context menu*.

![Opciones recomendadas](https://i.imgur.com/RqjUFAc.png)

- En el caso de linux instalar *gdb* es necesario para depurar, puedes hacerlo fácilmente desde la terminal. Posiblemente quieras la versión *x86_64-linux-gnu-gcc-10*

## Instalación

1. Crear una carpeta para tu proyecto.

> Se recomienda la primera vez dos carpetas, una en la cual guardes este y tus futuros proyectos de Ada y otra dentro donde guardas este proyecto.

2. Descomprimir los contenidos [de este zip](https://github.com/Markel/personal-other-projects/raw/master/Ada/config/Ada_VSCode.zip) dentro de la carpeta (tendrás que copiar los archivos cada vez que crees un nuevo projecto).

3. - (1) Abrir Visual Studio Code y dale a File>Open Folder... y navega hasta tu carpeta recien creada.

   - (2) Alternativamente puedes hacer click derecho en la carpeta y dar a *Open with Code*

4. Abajo a la derecha te aparecerá el siguiente mensaje: *Do you want to install de recommended extensions for this repository?*, dale a *install* y **ESPERA hasta que el reloj del quinto icono de la izquierda desaparezca.**

![Mensaje de instalación](https://i.imgur.com/Hx8gADT.png)

5. En el icono inferior derecho (la campana) aparecerá la notificación *Thank you for installing vscode-icons* dale a *activate*.

> Es posible que este mensaje no aparezca, si no lo hace, una vez acabado todo, ve a la sección [VSCode Icons de la sección de problemas](#VSCode-Icons).

6. Si deseas configurar VScode en español, en el mensaje *"Would you like to change VS Code's UI language to Spanish and restart?"* dale a *"yes"*. VScode se reiniciará.

![Mensaje de reinicio](https://i.imgur.com/XSgQGYr.png)

7. En Windows, presiona <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> y escribe *Terminal: Seleccionar el shell predeterminado* y selecciona *Command Prompt*.

![Opción del menú](https://i.imgur.com/UVCNbB2.png)

![Shell correcta](https://i.imgur.com/JrNUOHu.png)

8. Listo! Recomiendo crear un archivo hello.adb (en el root de tu carpeta, no dentro de .vscode) como el siguiente para probar que todo va bien.

```ada
with Text_IO; use Text_IO;
procedure Hello is
  a: Natural := 0;
begin
  Put_Line("Hello, World!");
end Hello;
```

> Acuérdate de copiar la carpeta .vscode a cada carpeta en la que trabajes :)

## Comandos básicos

- Si presionas <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> y buscas *Run Task* y le haces click verás los 5 grandes comandos del repositorio, el más utilizado es *Compilar y Ejecutar* que compila y ejecuta el archivo que tengas abierto en ese momento. Pruébalo con hello.adb y verás como aparecé *Hello, World!* en la consola.

> Al ser tan utilizado *Compilar y Ejecutar*, tiene un atajo de teclado asignado: <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>B</kbd>. Puedes modificarlo en opciones, es el comando: ejecutar tarea de compilación.

![Comandos](https://i.imgur.com/myetJvb.png)

- Para depurar presiona <kbd>F5</kbd>. Para establecer un breakpoint presiona <kbd>F9</kbd> o haz click a la izquierda de la línea. Se te abrirá el panel de depuración (icono de play con un bicho) donde podrás ver todas las variables.

> Puedes volver a la Terminal haciendo click en Terminal (a la izquierda de Consola de Depuración).

Ejemplo de como sería el debugging the hello.adb:

![VSCode debugeando](https://i.imgur.com/2biGXkd.png)

Theme: [GitHub Dark](https://marketplace.visualstudio.com/items?itemName=GitHub.github-vscode-theme)
(He comentado que existen cientos de temas? 👀)

## Features 🚀

### Detectar automáticamente ficheros de entrada

> Solo disponible en Windows

Si deseas tener un fichero que sustituya tus entradas de teclado solo tienes que llamarlo *entrada.txt* y ponerlo en la misma carpeta que tu .adb. A la hora de ejecutar, se aplicará automáticamente.

### Depuración

> Solo testeado en Windows y Linux

GDB está integrado en este workspace de VSCode. Tan solo tienes que presionar F5 o ir al panel de depuración, el archivo abierto de compilará adecuadamente y posteriormente debugeado.

### Limpieza automática

Nada más compilar, siempre se ejecuta un *gnatclean -c* el cual limpia los archivos no necesarios, muy útil para mantener una carpeta limpia. Ten en cuenta que al depurar, algunos archivos siguen siendo necesarios, se borrarán al compilar de normal.

### Soporte total de UTF-8

> Disponible en la mayoría de distribuciones de Linux (es posible que en Mac también funcione)

UTF-8 significa que podrás poner tildes en tus programas sin problemas. Se mostrarán en consola sin problemas.

### Soporte parcial de UTF-8

El soporte parcial significa que podrás poner poner tildes en tus variables. Si intentas poner tildes en tus Put, no se mostrarán correctamente.

## Problemas 🔧

Es posible que después de la instalación encuentres algunos problemas. Estos son los más comunes:

[Quiero cambiar de idioma](#Quiero-cambiar-de-idioma)

[No tengo las extensiones instaladas (si inseguro sigue los pasos)](No-tengo-las-extensiones-instaladas)

[Token '&&' is not valid](#Token-'&&'-is-not-valid)

['gnatmake' is not recognized](#'gnatmake'-is-not-recognized)

[MIDebuggerPath](#MIDebuggerPath)

[VSCode Icons](#VSCode-Icons)


### Quiero cambiar de idioma

Presiona <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> y busca *change language mode* al dar enter te aparecerán dos opciones, *en* y *es*, selecciona la que desees.

![Menú de búsqueda](https://i.imgur.com/B1A3jDB.png)

> Si no aparece la opción de *es* continua a la sección "No tenga las extensiones instaladas".

### No tengo las extensiones instaladas

En el panel izquierdo haz click sobre el 5º icono (el de los cuadrados) y en el cuadro de búsqueda busca *@recommended* te aparecerán todas las extensiones, si te falta alguna por instalar aparecerá una nube que instalará todas (o puedes instalarlas una a una manualmente).

![Resultados de la búsqueda](https://i.imgur.com/L5lftSJ.png)

> Si no aparecen las recomendaciones de la imagen, es posible que no tengas abierta la carpeta correcta o no hayas descomprimido el .zip

### Token '&&' is not valid

Esto se debe a que no estás ejecutando los comandos desde la shell correcta. Vuelve a hacer el paso 7 de la [instalación](#instalación).

### 'gnatmake' is not recognized

Esto se debe porque GNAT está incorrectamente añadido a *PATH*, vuelve a hacer el [prerequisíto](#prerequisitos) de añadir a PATH (ten en cuenta que igual el directorio recomendado no es el adecuado en tu caso).

### MIDebuggerPath

El error será algo así:

![Error de MIDebuggerPath](https://i.imgur.com/vz2YS3K.png)

En Linux, asegúrate que has instalado gcc. En Windows, asegúrate que has añadido GNAT a PATH.

Si esto no funciona (casos muy raros, asegúrate otra vez que lo has añadido a PATH y no funciona), debes acceder al archivo *launch.json* y modificar *"miDebuggerPath"* para añadir el ejecutable de de gdb.

### VSCode Icons

Si tienes VSCode Icons instalado basta con con hacer <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> y escribir *VSCode Icons*, haz enter y verás cómo se aplican en el explorador.

![Menu](https://i.imgur.com/RMpCqhI.png)

Debería quedar así:

![Ejemplo correcto](https://i.imgur.com/zdRECet.png)

