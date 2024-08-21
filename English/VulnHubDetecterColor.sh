#!/bin/bash

#Colors
RED='\033[1;31m'       
YELLOW='\033[1;38;5;227m'    
CYAN='\033[1;36m'      
GREEN='\033[1;32m'    
WHITE='\033[0;37m'     
NC='\033[0m'           # No color (default)

# Variables
whoami="$(whoami)"
ip=""

# Functions 
check_ip() { # Machine detection
  local ip=$1  

  if [ -z "$ip" ]; then
    echo -e "\n${RED}[-] ${WHITE}No IP for the VulnHub machine has been detected.${NC}\n" > ipVulnHub.tmp
  else
    echo -e "\n${GREEN}[+] ${WHITE}The IP for the Vulnhub machine is: ${CYAN}$ip${NC}" > ipVulnHub.tmp
    echo $ip | tr -d '\n' | xclip -sel clip
    echo -e "\n${YELLOW}[*] ${WHITE}IP copied to clipboard.${NC}" >> ipVulnHub.tmp
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