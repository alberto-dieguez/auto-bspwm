#!/usr/bin/bash

# Author: Alberto Diéguez (aka @ch1od0)

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Global variables
dir=$(pwd)
user=$(whoami)

trap ctrl_c INT

function ctrl_c(){
      echo -e "\n\n${redColour}[!] Exiting...\n${endColour}"
      exit 1
}

function banner(){
      echo -e "\n${blueColour}"
      sleep 0.05
      echo -e "Installing nvim & nvchad"
      sleep 0.05
      echo -e "${endColour}"
}

if [ "$user" == "root" ]; then
      echo -e "\n\n${redColour}[!] You can not execute the script as root user.\n${endColour}"
      exit 1
else
      banner
      sleep 1
      echo -e "\n${purpleColour}[*] Installing neovim and nvchad...\n${endColour}"
      wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
      sleep 2
      sudo tar -xf $dir/nvim-linux64.tar.gz
      sleep 2
      sudo mv $dir/nvim-linux64 /opt
      sleep 2
      sudo rm $dir/nvim-linux64.tar.gz
      sudo rm -rf $dir/nvim-linux64
      sleep 2
      git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
      if [ $? != 0 ] && [ $? != 130 ]; then
              echo -e "\n${redColour}[-] Error installing the packages.\n${endColour}"
              exit 1
      else
              echo -e "\n${greenColour}[+] OK\n${endColour}"
              sleep 1.5
      fi
      sleep 4
      echo -e "\n${purpleColour}[*] Installing neovim and nvchad for root...\n${endColour}"
      sudo git clone https://github.com/NvChad/NvChad /root/.config/nvim --depth 1 && nvim
      if [ $? != 0 ] && [ $? != 130 ]; then
              echo -e "\n${redColour}[-] Error installing the packages.\n${endColour}"
              exit 1
      else
              echo -e "\n${greenColour}[+] OK\n${endColour}"
              sleep 1.5
      fi
fi
