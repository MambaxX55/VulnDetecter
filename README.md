There is a description in english and another in spanish.
Hay una descripción en inglés y otra en español.

--------

## **English**

--------

## ⚠️​ **IMPORTANT** ⚠️​

- It is necessary to have xclip installed on our Linux system.
- Change the interface in the arp-scan command to match your configuration; by default, it is set to eth0.


## 💭 **What is VulnHubDetecter?** 💭​

VulnHubDetecter is a small utility/tool that allows us to discover the IP address of a VulnHub machine, ideal for when you have just started one and need to quickly find its IP. The tool will detect which IP corresponds to the VulnHub machine and report it to the console, as well as copy the IP to the clipboard.

- There are two options to choose from: the colored version or the default version.

In my case, rather than as a bash file, I have it defined as a function within the bash (.zshrc) for faster usage.
## ⚙️**Usage Instructions** ⚙️

You need to be **root** to use the tool. If you try to use it without root privileges, the tool will detect this and prompt for the password to execute the command with the necessary privileges.

VulnHubDetecter can be implemented as a function within the `.zshrc` file in bash or can be run as a `script.sh`.

If you choose the first option, you only need to call the function you created with the script's code. Example:

```
VulnHubDetecter
```

If you want to run it as `script.sh`, you first need to give it execution permissions and then execute it. Example:

```
./VulnHubDetecter.sh
```

You can view the appearance of the program in the **Images** folder.
## 👎​ **Considerations and Potential Issues** 👎​

To discover the IP of the machine, VulnHubDetecter looks for the MAC address 08:00:27, which corresponds to VirtualBox (VB) services. This is because most VulnHub machines are designed for VB. Therefore, if you have any other VB machines running apart from the one you are using, it is quite likely that it will detect those instead of the VulnHub machine. In that case, it may not work correctly. In that case the tool **would not** work.

## 👨‍💻 **Farewell**

The tool is very simple and could be much more developed, but it was created from the idea of practicing a bit of bash programming, as I have just started learning.

Bye 👋🐍

--------
## **Spanish**

-------

## ⚠️​ **IMPORTANTE** ⚠️​

- Es necesario tener instalado en nuestro Linux **xclip**.
- Cambiad la interfaz del comando arp-scan por la que tengáis vosotros, por defecto viene la eth0.


## 💭 **¿Qué es VulnHubDetecter?** 💭​

VulnHubDetecter es una pequeña utilidad/herramienta que nos permite descubrir cual es la IP de una máquina de VulnHub, ideal para cuando acabas de correr una y necesitas saber de forma rápida cual es su IP.
La herramienta detectará que IP corresponde a la máquina VulnHub y la reportará por consola, además nos copiará la IP a la clipboard.

- Hay dos opciones a elegir, la versión a color o la versión por defecto.

En mi caso más que como un archivo bash, yo la tengo definida como una function dentro de la bash (.zshrc) para usarla con mayor velocidad.

## ⚙️**Modo de empleo** ⚙️

Es necesario ser **root** para poder usar la herramienta, si no la usamos siendo root, la herramienta lo detectará y pedirá la contraseña para ejecutar el comando pertinente con privilegios.

VulnHubDetecter puede implementarse como una función dentro de la zshrc en la bash o puede lanzarse como un script.sh. 

Si eliges la primera opción solo tendrás que lanzar la función que hayas creado con el código del script. Ejemplo:

```
VulnHubDetecter
```

Si lo queremos ejecutar como script.sh, primero deberemos darle permisos de ejecución y después ejecutarlo. Ejemplo:

```
./VulnHubDetecter.sh
```

Podéis visualizar el aspecto del programa en la carpeta **Images**.

##  👎​ **Consideraciones y posibles errores** 👎​

Para descubrir la IP de la máquina, VulnHubDetecter busca en los hosts la dirección MAC **08:00:27**, la cual corresponde a los servicios de Virtual Box (VB). Esto es así porque la mayoría de máquinas VulnHub están diseñadas para VB. Por lo tanto si estás corriendo alguna otra máquina de VB diferente a la que estás usando, es bastante probable que la detecte en lugar de detectar la de VulnHub. En ese caso **NO** funcionaría.

## 👨‍💻​ **Despedida**

La herramienta es muy simple y podría estar mucho más desarrollada, pero ha nacido de la idea de practicar un poquito la programación en bash, ya que acabo de empezar a aprender.

Un saludo 👋​🐍​
