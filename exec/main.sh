#!/bin/bash

hora=$(printf '%(%H:%M:%S)T');fecha=$(printf '%(%D)T');soporte="@drowkid01"
declare -A color=( [0]="\e[1;30m" [1]="\e[1;31m" [2]="\e[1;32m" [3]="\e[1;33m" [4]="\e[1;34m" [5]="\e[1;35m" [6]="\e[1;36m" [7]="\e[1;37m" )

function menu(){
  local options=${#@} array
  for((num=1; num<=$options; num++)); do echo -ne " ${color[0]}[${color[6]}$num${color[0]}] \e[1;97m" && array=(${!num})
    case ${array[0]} in	*)echo -e "\033[1;37m${array[@]}";; esac
  done
 }

function selectw(){
  local selection="null" range
  if [[ -z $2 ]]; then opcion=$1 && col="${color[3]}" ; else opcion=$2 && col=$1 ; fi
  for((i=0; i<=$opcion; i++)); do range[$i]="$i "; done
  while [[ ! $(echo ${range[*]}|grep -w "$selection") ]]; do  echo -ne "\e[1;30m ╰► Seleccione una opción: " >&2 &&  read selection && tput cuu1 >&2 && tput dl1 >&2 ;  done ; echo $selection
}

function text_cent(){
  if [[ -z $2 ]]; then text="$1" ; else col="$1" && text="$2" ; fi
  while read line; do
    unset space && x=$(( ( 54 - ${#line}) / 2)); for (( i = 0; i < $x; i++ )); do space+=' ' ; done ; space+="$line"
    if [[ -z $2 ]]; then echo -e "${color[6]}$space" ; else echo -e "${color[$col]}" "$space" ; fi
  done <<< $(echo -e "$text")
}

function instalador(){
local comando=$1; _=$( $comando >/dev/null 2>&1 ; ) & >/dev/null
pid=$!
    while [[ -d /proc/$pid ]]; do echo -ne "  \033[1;33m["
        for ((i = 0; i < 20; i++)); do echo -ne "\033[1;31m>" && sleep 0.08; done
        echo -ne "\033[1;33m]";sleep 0.5s;echo;tput cuu1 && tput dl1
    done
    echo -ne "  \033[1;33m[\033[1;31m>>>>>>>>>>>>>>>>>>>>\033[1;33m] ${color[2]}	INSTALADO \033[0m\n" && sleep 0.5s
}

function checkdir(){
	local dir=$1
		[[ ! -d "${dir}" ]] && mkdir -p "${dir}"
}
