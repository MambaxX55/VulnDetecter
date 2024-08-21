#!/bin/bash

# Variables
whoami="$(whoami)"
ip=""

# Functions 
check_ip() { # Machine detection
  local ip=$1  

  if [ -z "$ip" ]; then
    echo -e "\n[-] No IP for the VulnHub machine has been detected.\n" > ipVulnHub.tmp
  else
    echo -e "\n[+] The IP for the Vulnhub machine is: $ip" > ipVulnHub.tmp
    echo $ip | tr -d '\n' | xclip -sel clip
    echo -e "\n[*] IP copied to clipboard." >> ipVulnHub.tmp
  fi
}

# Root comprobation
if [ "$whoami" == "root" ]; then
  ip="$(arp-scan -I eth0 --localnet --ignoredups 2>/dev/null | sed '1d' | grep '08:00:27' | tail -n 1 | awk '{print $1}')"
else 
  ip="$(sudo arp-scan -I eth0 --localnet --ignoredups 2>/dev/null | sed '1d' | grep '08:00:27' | tail -n 1 | awk '{print $1}')"
fi

check_ip "$ip"

cat ipVulnHub.tmp
rm ipVulnHub.tmp