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
fdir="$HOME/.local/share/fonts"
user=$(whoami)

trap ctrl_c INT

function ctrl_c(){
      echo -e "\n\n${redColour}[!] Exiting...\n${endColour}"
      exit 1
}

function banner(){
      echo -e "\n${blueColour}"
      sleep 0.05
      echo -e "Entorno por @ch1od0"
      sleep 0.05
      echo -e "${endColour}"
}

if [ "$user" == "root" ]; then
      banner
      echo -e "\n\n${redColour}[!] ¡No puedes ejecutar el script como usuario root!\n${endColour}"
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
      sleep 2
      git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

      if [ $? != 0 ] && [ $? != 130 ]; then
              echo -e "\n${redColour}[-] ¡Error al instalar los paquetes!\n${endColour}"
              exit 1
      else
              echo -e "\n${greenColour}[+] OK\n${endColour}"
              sleep 1.5
      fi
fi
