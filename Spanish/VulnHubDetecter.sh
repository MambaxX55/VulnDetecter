#!/bin/bash

# Variables
whoami="$(whoami)"
ip=""

# Funciones
comprobar_ip() { # Detección de la máquina
  local ip=$1  

  if [ -z "$ip" ]; then
    echo -e "\n[-] No se ha detectado ninguna IP de la máquina VulnHub.\n" > ipVulnHub.tmp
  else
    echo -e "\n[+] La IP de la máquina VulnHub es: $ip" > ipVulnHub.tmp
    echo $ip | tr -d '\n' | xclip -sel clip
    echo -e "\n[*] IP copiada a la clipboard." >> ipVulnHub.tmp
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