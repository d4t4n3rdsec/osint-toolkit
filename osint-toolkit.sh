#!/bin/bash

# Clear the screen and create a "Tools" directory
clear
mkdir -p Tools
clear

# Define Colors
RED='\033[31m'
GREEN='\033[32m'
BLUE='\033[34m'
YELLOW='\033[33m'
RESET='\033[0m'

# Display the banner
echo -e "${RED}
  ██████╗ ███████╗███╗   ██╗██╗████████╗
 ██╔═══██╗██╔════╝████╗  ██║██║╚══██╔══╝
 ██║   ██║█████╗  ██╔██╗ ██║██║   ██║   
 ██║   ██║██╔══╝  ██║╚██╗██║██║   ██║   
 ╚██████╔╝███████╗██║ ╚████║██║   ██║   
  ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═╝   ╚═╝   
${GREEN}       OSINT Automation Toolkit v2.0
${BLUE}      github: https://github.com/d4t4n3rdsec
${RESET}"

echo -e "
${YELLOW}[1]${RESET} Install Updates and Requirements
${YELLOW}[2]${RESET} Username Lookup Tools - ${BLUE}(Sherlock, Maigret)${RESET}
${YELLOW}[3]${RESET} Email OSINT Tools - ${BLUE}(GHunt, Holehe)${RESET}
${YELLOW}[4]${RESET} Phone Number Lookup Tools - ${BLUE}(Ignorant, Telegram Phone Checker)${RESET}
${YELLOW}[5]${RESET} Domain/IP Lookup - ${BLUE}(who.is)${RESET}
${YELLOW}[6]${RESET} Uninstall Downloaded Tools
"

# Ask the user for an option
read -p "Enter the number of your choice: " option

case $option in
  1|01)
    clear
    echo -e "${GREEN}Installing updates and requirements...${RESET}"
    sleep 2
    apt update && apt upgrade -y
    apt install git python3 python3-pip curl -y
    echo -e "${GREEN}Updates and requirements installed successfully.${RESET}"
    ;;
  
  2|02)
    clear
    echo -e "${BLUE}Username Lookup Tools:${RESET}
${GREEN}- Sherlock: Find usernames across social networks.${RESET}
${GREEN}- Maigret: In-depth analysis of username presence.${RESET}"
    read -p "Do you want to install these tools? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      cd Tools
      git clone https://github.com/sherlock-project/sherlock
      git clone https://github.com/soxoj/maigret
      echo -e "${GREEN}Tools installed successfully. Navigate to the Tools directory to use them.${RESET}"
    else
      echo -e "${YELLOW}Skipped installation.${RESET}"
    fi
    ;;
  
  3|03)
    clear
    echo -e "${BLUE}Email OSINT Tools:${RESET}
${GREEN}- GHunt: Investigate Google accounts using email addresses.${RESET}
${GREEN}- Holehe: Check if an email exists on various platforms.${RESET}"
    read -p "Do you want to install these tools? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      cd Tools
      git clone https://github.com/mxrch/GHunt
      git clone https://github.com/megadose/holehe
      echo -e "${GREEN}Tools installed successfully. Navigate to the Tools directory to use them.${RESET}"
    else
      echo -e "${YELLOW}Skipped installation.${RESET}"
    fi
    ;;
  
  4|04)
    clear
    echo -e "${BLUE}Phone Number Lookup Tools:${RESET}
${GREEN}- Ignorant: Basic phone number recon.${RESET}
${GREEN}- Telegram Phone Checker: Check Telegram accounts linked to phone numbers.${RESET}"
    read -p "Do you want to install these tools? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      cd Tools
      git clone https://github.com/megadose/ignorant
      git clone https://github.com/bellingcat/telegram-phone-number-checker
      echo -e "${GREEN}Tools installed successfully. Navigate to the Tools directory to use them.${RESET}"
    else
      echo -e "${YELLOW}Skipped installation.${RESET}"
    fi
    ;;
  
  5|05)
    clear
    echo -e "${BLUE}Domain/IP Lookup Tool:${RESET}
Use the online service: ${YELLOW}https://who.is${RESET}"
    ;;
  
  6|06)
    clear
    echo -e "${RED}Removing all downloaded tools...${RESET}"
    sleep 2
    rm -rf Tools
    echo -e "${GREEN}All tools removed successfully.${RESET}"
    ;;
  
  *)
    echo -e "${RED}Invalid Option! Please try again.${RESET}"
    sleep 1
    bash $0
    ;;
esac
