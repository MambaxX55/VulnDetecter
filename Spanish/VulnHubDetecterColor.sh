#!/bin/bash

#Colores
ROJO='\033[1;31m'       
AMARILLO='\033[1;38;5;227m'    
CYAN='\033[1;36m'      
VERDE='\033[1;32m'    
BLANCO='\033[0;37m'     
SC='\033[0m'           # Sin color (por defecto)

# Variables
whoami="$(whoami)"
ip=""

# Funciones
comprobar_ip() { # Detección de la máquina
  local ip=$1  

  if [ -z "$ip" ]; then
    echo -e "\n${ROJO}[-] ${BLANCO}No se ha detectado ninguna IP de la máquina VulnHub.${SC}\n" > ipVulnHub.tmp
  else
    echo -e "\n${VERDE}[+] ${BLANCO}La IP de la máquina VulnHub es: ${CYAN}$ip${SC}" > ipVulnHub.tmp
    echo $ip | tr -d '\n' | xclip -sel clip
    echo -e "\n${AMARILLO}[*] ${BLANCO}IP copiada a la clipboard.${SC}" >> ipVulnHub.tmp
  fi
}

# Comprobación de root
if [ "$whoami" == "root" ]; then
  ip="$(arp-scan -I eth0 --localnet --ignoredups 2>/dev/null | sed '1d' | grep '08:00:27' | tail -n 1 | awk '{print $1}')"
else 
  ip="$(sudo arp-scan -I eth0 --localnet --ignoredups 2>/dev/null | sed '1d' | grep '08:00:27' | tail -n 1 | awk '{print $1}')"
fi

comprobar_ip "$ip"

cat ipVulnHub.tmp
rm ipVulnHub.tmp