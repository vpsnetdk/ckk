#!/bin/bash
#CREADOR Henry Chumo | 06/06/2022
#Alias : @ChumoGH
# -*- ENCODING: UTF-8 -*-
dropbear_pids () {
  port_dropbear=`ps aux|grep 'dropbear'|awk NR==1|awk '{print $17;}'`
  log=/var/log/auth.log
  loginsukses='Password auth succeeded'
  pids=`ps ax|grep 'dropbear'|grep " $port_dropbear"|awk -F " " '{print $1}'`
  for pid in $pids; do
    pidlogs=`grep $pid $log |grep "$loginsukses" |awk -F" " '{print $3}'`
    i=0
    for pidend in $pidlogs; do
      let i=i+1
    done
    if [ $pidend ];then
       login=`grep $pid $log |grep "$pidend" |grep "$loginsukses"`
       PID=$pid
       user=`echo $login |awk -F" " '{print $10}' | sed -r "s/'/ /g"`
       waktu=`echo $login |awk -F" " '{print $2"-"$1,$3}'`
       while [ ${#waktu} -lt 13 ]; do
           waktu=$waktu" "
       done
       while [ ${#user} -lt 16 ]; do
           user=$user" "
       done
       while [ ${#PID} -lt 8 ]; do
           PID=$PID" "
       done
       echo "$user $PID $waktu"
    fi
done
}

mostrar_usuarios () {
for u in `cat "/etc/passwd"|grep 'home'|grep 'false'|grep -v 'syslog' | cut -d: -f1`; do
echo "$u"
done
}

function_onlines () {
local users=$(cat /etc/passwd|grep 'home'|grep 'false'|grep -v 'syslog'|awk -F ':' '{print $1}')
	#	dpids=$(dropbear_pids)	users=$(cat /etc/passwd|grep 'home'|grep 'false'|grep -v 'syslog'|awk -F ':' '{print $1}')
	dpids=$(dropbear_pids)
	time=$(date +%s)
	[[ -e /etc/openvpn/openvpn-status.log ]] && ovpn_log=$(cat /etc/openvpn/openvpn-status.log)
	n='0'
	i='0'
	u='1'
	conect='0'
	_onlin='0'
	for _user in $users; do
		[[ -z "$(ps -u $_user|grep sshd)" ]] && sqd=0 || sqd=$(ps -u $_user|grep sshd | wc -l)
		[[ -z "$(echo $ovpn_log|grep -E ,"$_user",)" ]] && ovp=0 || ovp=$(echo $ovpn_log|grep -E ,"$_user", | wc -l)
        [[ -z "$(echo $dpids|grep -w "$_user")" ]] && drop=0 || drop=$(echo $dpids|grep -w "$_user" | wc -l)
        _onlin=$(($sqd + $ovp + $drop))
        #[[ $_onlin -ne 0 ]] && 
		conect=$(($conect + $_onlin))
		if [[ $(chage -l $_user |grep 'Account expires' |awk -F ': ' '{print $2}') != never ]]; then
			[[ $time -gt $(date '+%s' -d "$(chage -l $_user |grep "Account expires" |awk -F ': ' '{print $2}')") ]] && let n++
		fi
		[[ $(passwd --status $_user|cut -d ' ' -f2) = "L" ]] && let i++
	done
_onlin="\033[1;31m${conect}"
_userexp="\033[1;31m${n}"
_userlock="${i}"
_tuser="\033[1;31m$(echo -e "${users}" | wc -l)"
}

[[ -e /etc/adm-lite/modulos ]] && function_onlines &> /dev/null 

if ! [ $(id -u) = 0 ]; then
clear
		echo ""
		msg -bar
		echo " 	       	⛑⛑⛑     Error Fatal!! x000e1  ⛑⛑⛑"
		msg -bar
		echo "                ✠ Este script debe ejecutarse como root! ✠"
		echo "                           Como Solucionarlo "
		echo "                         Ejecute el script así:"
		echo "                               ⇘     ⇙ "
		echo "                               sudo -i "
		echo "                               sudo su"
		echo "                            Retornando . . ."
		echo $(date)
		msg -bar
		exit
fi
##
# Funcoes Globais
[[ -e /bin/ejecutar/msg ]] && source /bin/ejecutar/msg || source <(curl -sSL https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Otros/msg)

#PRUEBA DE MODULOS BETA A ELIMINAR EN UPDATE V5.2

install_ini () {
_error=0
msg -bar
echo -e "\033[97m"
echo -e "\033[41m     -- INSTALAREMOS LO NECESARIO PARA EL ADM --"
echo -e "   \033[41m--  Arch : $(lscpu | grep "Vendor ID" | awk '{print $3}') SISTEMA  $(lsb_release -si) $(lsb_release -sr) --"
echo -e "\033[100m   ATENCION A INSTALACION POR SI DEVUELVE UN ERROR "
echo -e "\033[97m"
msg -bar
locale-gen en_US.UTF-8 > /dev/null 2>&1
update-locale LANG=en_US.UTF-8 > /dev/null 2>&1 && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # Instalando Paqueteria UTF............ $ESTATUS "
#at
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install at -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install at................... $ESTATUS "
#screen
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install screen............... $ESTATUS "
#python
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install python............... $ESTATUS "
#python3
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install python3.............. $ESTATUS "
#python3-pip
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || apt-get install python3-pip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install python3-pip.......... $ESTATUS "
#npm
[[ $(dpkg --get-selections|grep -w "npm"|head -1) ]] || apt-get install npm -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "npm"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "npm"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install npm.................. $ESTATUS "
#nodejs
[[ $(dpkg --get-selections|grep -w "nodejs"|head -1) ]] || apt-get install nodejs -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nodejs"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "nodejs"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install nodejs............... $ESTATUS "
#lsof
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install lsof................. $ESTATUS "
#snapd
#ESTATUS=`echo -e "\e[3;32mDELETED .\e[0m"` &>/dev/null
#[[ $(dpkg --get-selections|grep -w "snapd"|head -1) ]] && apt purge snapd -y &>/dev/null
#echo -e "\033[97m  # apt-get purge snapd ................. $ESTATUS "
#apache2
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 apt-get install apache2 -y &>/dev/null
 sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
 service apache2 restart > /dev/null 2>&1 &
 }
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install apache2.............. $ESTATUS "
#nmap
[[ $(dpkg --get-selections|grep -w "nmap"|head -1) ]] || apt-get install nmap -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nmap"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "nmap"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install nmap................. $ESTATUS "
#socat
[[ $(dpkg --get-selections|grep -w "socat"|head -1) ]] || apt-get install socat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "socat"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "socat"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install socat................ $ESTATUS "
#bc
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install bc................... $ESTATUS "
#lynx
[[ $(dpkg --get-selections|grep -w "lynx"|head -1) ]] || apt-get install lynx -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lynx"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "lynx"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install lynx................. $ESTATUS "
#netcat
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] || apt-get install netcat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install netcat............... $ESTATUS "
#net-tools
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || apt-get net-tools -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install net-tools............ $ESTATUS "
#cowsay
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install cowsay............... $ESTATUS "
#nmap
[[ $(dpkg --get-selections|grep -w "nmap"|head -1) ]] || apt-get install nmap -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nmap"|head -1) ]] || {
ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
let _error++ 
}
[[ $(dpkg --get-selections|grep -w "nmap"|head -1) ]] && ESTATUS=`echo -e "\e[3;32mINSTALADO\e[0m"` &>/dev/null
echo -e "\033[97m  # apt-get install nmap................. $ESTATUS "
msg -bar
echo -e "\033[92m La instalacion de paquetes necesarios a finalizado"
[[ ${_error} > 0 ]] && {
echo -e ""
echo -e "     SE ENCONTRARON ${_error} ERRORES "
echo -e "  PRUEBA COPIAR LOS NOMBRES DE LOS PAQUETES "
echo -e "      E INSTALARLOS DE FORMA MANUAL "
echo -e "      apt install nombre-paquete -y"
echo -e ""
read -p " PRESIONA ENTER PARA CONTINUAR"
}
msg -bar
}

install_fim () {
fecha=`date +"%d-%m-%y"`;
unset name
[[ -d /bin/ejecutar ]] && rm -rf /bin/ejecutar
[[ -e /etc/adm-lite/gerar.sh ]] && rm -f /etc/adm-lite/gerar.sh
mkdir /bin/ejecutar
[[ -e /bin/ejecutar/menu_credito ]] && echo "" || echo "$(cat /etc/adm-lite/menu_credito|head -1)" > /bin/ejecutar/menu_credito && chmod +x /bin/ejecutar/menu_credito
wget -q -O /bin/toolmaster https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Otros/toolmaster 
chmod +x /bin/toolmaster
echo 'source <(curl -sSL https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Otros/free-men.sh)' > /bin/ejecutar/echo-ram.sh
echo 'wget -q -O /bin/ejecutar/v-new.log https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuGH-5.7u/Otros/ejecutar/v-new.log' >> /bin/ejecutar/echo-ram.sh && bash /bin/ejecutar/echo-ram.sh
echo '#!/bin/bash
' > /bin/autoboot
chmod +x /bin/autoboot
crontab -l > /root/cron &> /dev/null 
echo "@reboot /bin/autoboot" >> /root/cron
crontab /root/cron &>/dev/null
rm -f /root/cron
echo "* * * * * root bash  /bin/autoboot" >> /etc/crontab
service cron restart >/dev/null 2>&1
if cat /root/.bashrc | grep ChumoGH; then
#echo "clear" >> /root/.bashrc
sed '/ChumoGH/ d' /root/.bashrc > /root/.bashrc.cp1
sed '/clear/ d' /root/.bashrc.cp1 > /root/.bashrc.cp
sed '/echo/ d' /root/.bashrc.cp > /root/.bashrc
rm -f /root/.bashrc.cp /root/.bashrc.cp1
echo 'killall menu > /dev/null 2>&1' >> /root/.bashrc
sed '/ChumoGH/ d' /root/.bashrc > /root/.bashrc.cp
sed '/echo/ d' /root/.bashrc.cp > /root/.bashrc
sed '/ejecutar/ d' /root/.bashrc > /root/.bashrc.cp
sed '/date/ d' /root/.bashrc.cp > /root/.bashrc
rm -f /root/.bashrc.cp
echo 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/' >> /root/.bashrc
echo '[[ -z $(locale | grep "LANG=" | cut -d "=" -f2) ]] && export LANG=en_US.UTF-8' >> /root/.bashrc
echo 'DATE=$(date +"%d-%m-%y")' >> /root/.bashrc
echo 'TIME=$(date +"%T")' >> /root/.bashrc
echo 'figlet -f slant "ChumoGH" | lolcat' >> /root/.bashrc
echo 'echo -e ""' >> /root/.bashrc
echo 'bash /bin/ejecutar/echo-ram.sh' >> /root/.bashrc              
echo 'echo -e " Fecha de Instalacion : " $(cat < /bin/ejecutar/fecha)' >> /root/.bashrc
echo 'echo -e " Nombre del Servidor : $HOSTNAME"' >> /root/.bashrc
echo 'echo -e " Tiempo en Linea : $(uptime -p)"' >> /root/.bashrc
echo 'echo -e " Memoria Libre : $(cat < /bin/ejecutar/raml)"' >> /root/.bashrc
echo 'echo -e " Fecha del Servidor : $DATE"' >> /root/.bashrc
echo 'echo -e " Hora del Servidor : $TIME"' >> /root/.bashrc
echo 'echo -e ""' >> /root/.bashrc
echo 'echo -e " Bienvenido!"' >> .bashrc
echo 'echo -e "\033[1;43m Teclee cgh , menu o adm para ver el MENU\033[0m."' >> /root/.bashrc
echo 'echo -e ""' >> /root/.bashrc
echo "STARTUP AGREGADO EXITOSAMENTE"
else
#echo ""
#echo -e "\t\033[92mRESELLER : "
#echo -e "\t\e[1;33mVERSION: \e[1;31m$(cat /etc/)"
#echo -e "\t\033[1;100mPARA MOSTAR PANEL BASH ESCRIBA:\e[0m\e[1;41m sudo menu \e[0m"
echo 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/' >> /root/.bashrc
echo '[[ -z $(locale | grep "LANG=" | cut -d "=" -f2) ]] && export LANG=en_US.UTF-8' >> /root/.bashrc
echo 'killall menu > /dev/null 2>&1' >> /root/.bashrc
echo 'DATE=$(date +"%d-%m-%y")' >> /root/.bashrc
echo 'TIME=$(date +"%T")' >> /root/.bashrc
echo 'figlet -k ChumoGH | lolcat' >> /root/.bashrc
echo 'echo -e ""' >> /root/.bashrc
echo 'bash /bin/ejecutar/echo-ram.sh' >> /root/.bashrc              
echo 'echo -e " Fecha de Instalacion : " $(cat < /bin/ejecutar/fecha)' >> /root/.bashrc
echo 'echo -e " Nombre del Servidor : $HOSTNAME"' >> /root/.bashrc
echo 'echo -e " Tiempo en Linea : $(uptime -p)"' >> /root/.bashrc
echo 'echo -e " Memoria Libre : $(cat < /bin/ejecutar/raml)"' >> /root/.bashrc
echo 'echo -e " Fecha del Servidor : $DATE"' >> /root/.bashrc
echo 'echo -e " Hora del Servidor : $TIME"' >> /root/.bashrc
echo 'echo -e ""' >> /root/.bashrc
echo 'echo -e " Bienvenido!"' >> .bashrc
echo 'echo -e "\033[1;43m Teclee cgh , menu o adm para ver el MENU\033[0m."' >> /root/.bashrc
echo 'echo -e ""' >> /root/.bashrc
echo " STARTUP AGREGADO EXITOSAMENTE"
fi
[[ -e $HOME/lista ]] && rm $HOME/lista
echo -e "0" > /bin/ejecutar/uskill
[[ -e /bin/ejecutar/menu_credito ]] && echo "" || echo "$(cat /etc/adm-lite/menu_credito)" > /bin/ejecutar/menu_credito && chmod +x /bin/ejecutar/menu_credito
echo "Verified【 $(cat /bin/ejecutar/menu_credito)" > /bin/ejecutar/exito
echo -e "${cor[5]}NOMBRE AGREGADO EXITOSAMENTE"
echo -e " \033[0m"
echo "$fecha" > /bin/ejecutar/fecha
clear
msg -bar
echo -e "\033[0;33m
       Nombre de tu servidor.... OPCIONAL
       RECOMENDABLE 10 Caracteres Maximo!
       "
msg -bar
echo -ne "\033[1;97m NOMBRE DEL SERVIDOR : \033[0m" && read name
[[ -z "${name}" ]] || {
echo $name > /etc/adm-lite/name
chmod +x /etc/adm-lite/name
echo $name > /root/name 
figlet $name
}
clear
msg -bar
echo -e "\033[1;32mCAMBIAR ZONA HORARIA EN ( * \033[1;33mMenu 7 \033[1;32m*\033[1;33m opcion 14 \033[1;32m)"
msg -bar
echo -e "${cor[3]} ChumoGH-ADM Configurado Exitosamente!"
msg -bar
echo -e "${cor[3]} |∆| ${cor[2]} Ahora puedes acceder al PANNEL"
msg -bar
echo -e " \033[1;41m Use los Comandos: cgh, menu, adm"
msg -bar
echo -e "${cor[2]} Para acceder al MENU, DISFRUTA LA ESTANCIA!"
echo -e "${cor[2]} Reinicie para completar Instalacion - OPCIONAL - "
echo -e " RECOMENDABLE ACCEDER COMO ROOT y/o ADMINISTRADOR\033[0m"
echo -e " Fecha de Instalacion : " $(cat < /bin/ejecutar/fecha)
msg -bar
echo -e "\033[0;33m       YA TIENES ACCESO ROOT A TU VPS?
 ESTO ES ESPECIAL PARA (AWS,GOOGLE,AZURE,ORACLE,ETC)
 SI ENTRASTE CON UN USUARIO DIFERENTE AL ROOT
 PRESIONA S, CASO CONTRARIO, IGNORA EL MENSAJE"
msg -bar
echo -e "\033[1;42m Deseas Aplicar el FIX de PASSWD para Acceso ROOT\033[0;33m  :v\033[0;32m"
read -t 30 -p " Responde [ s | n ] : " -e -i "n" x
[[ $x = @(s|S|y|Y) ]] && source <(curl -sSL  https://www.dropbox.com/s/hl9vyo8mf94z0h5/root-pass.sh) || echo -e "\033[1;32mAplica FIX en ( * \033[1;33m Menu 7\033[1;32m *\033[1;33m opcion 9 \033[1;32m*\033[1;32m)"
[[ -e /root/name ]] && figlet "$(less /root/name)" | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChumoGH${TTcent}VPS  ${TTfin}      "
exit
} 

instalar_fun () {
#install_ini
cor[2]="\033[1;37m"
wget -q -O /var/www/html/index.html https://www.dropbox.com/s/vowqcezrtiduh8n/index.html
install_fim
exit 0
}

[[ "$1" = "--instalar" ]] && instalar_fun
#FIN DE MODULOS A ELIMINAR EN UPDATE CON REFORMA EN BASE	
remover_adm () {
msg -bar
echo -e "${cor[5]} ¿ ESTAS SEGURO ?"
read -p " [ s / n ]: " certe_za
[[ "$certe_za" = @(s|S|y|Y) ]] && {
[[ -e /etc/openvpn/server.conf ]] && remover_ovpn & > /dev/null 2>&1
echo -e "${cor[5]} Unistaling python${cor[0]}"
fun_bar 'apt-get purge python -y' 'apt-get purge python3-pip -y'
echo -e "${cor[5]} Unistaling Nmap${cor[0]}"
fun_bar 'apt-get purge screen -y' 'apt-get purge nmap -y'
echo -e "${cor[5]} Unistaling curl${cor[0]}"
fun_bar 'apt-get purge figlet -y' 'apt-get purge unzip -y' 'apt-get purge squid -y'
echo -e "${cor[5]} Unistaling Dropbear/Squid${cor[0]}"
fun_bar 'apt-get purge bc -y' 'apt-get purge lynx -y'
echo -e "${cor[5]} Unistaling Apache2${cor[0]}"
fun_bar 'apt-get purge curl -y' 'apt-get purge squid -y' 
echo -e "${cor[5]} Unistaling Libs${cor[0]}"
fun_bar 'apt-get purge squid3 -y' 'apt-get purge dropbear -y' 'apt-get purge stunnel4 -y'
echo -e "${cor[5]} Unistaling Scripts${cor[0]}"
fun_bar 'apt-get purge apache2 -y' 'apt-get purge php5 libapache2-mod-php5 php5-mcrypt'
apt-get autoremove -y > /dev/null 2>&1
[[ -e /bin/ejecutar ]] && rm -rf /bin/ejecutar > /dev/null 2>&1
[[ -e /etc/usuariosteste ]] && rm -rf /etc/usuariosteste > /dev/null 2>&1
[[ -e $HOME/log.txt ]] && rm -f $HOME/log.txt
[[ -e /bin/troj.sh ]] && rm -f /bin/troj.sh
[[ -e /bin/v2r.sh ]] && rm -f /bin/v2r.sh
[[ -e /bin/clash.sh ]] && rm -f /bin/clash.sh
[[ -e /bin/menu ]] && rm /bin/menu
[[ -e /bin/cgh ]] && rm /bin/cgh
sed '/ChumoGH/ d' /root/.bashrc > /root/.bashrc.cp1
sed '/clear/ d' /root/.bashrc.cp1 > /root/.bashrc.cp
sed '/echo/ d' /root/.bashrc.cp > /root/.bashrc
rm -f /root/.bashrc.cp /root/.bashrc.cp1
[[ -e $HOME/exito ]] && rm -f /root/exito $HOME/name > /dev/null 2>&1
echo -e "${cor[5]} SUCESS! :D${cor[0]}"
[[ -e /etc/adm-lite ]] && rm -rf /etc/adm-lite
echo -e "\033[0m"
 msg -bar
 exit
  } || {
 echo -e "${cor[1]} DESINSTALACION CANCELADA POR EL USUARIO!! ${cor[0]}"
 msg -bar
 return
 }
}

clear
#DECLARA VARIABLES DE ENTORNO
dir_user="./userDIR"
dir="/etc/adm-lite"

_on="\033[0;31m [\033[0;32mON\033[0;31m]"
_off="\033[0;31m [OFF]"
#SISTEMADEMODULOS
unset OPENVPN
unset limiter_on
[[ -e /etc/openvpn/server.conf ]] && {
[[ -e /etc/openvpn/openvpn-status.log ]] && OPENVPN="on" || echo -e "OPENVPN ERROR"
}
[[ -e /etc/adm-lite/modulos ]] && VERIFICAR_PID="$_on" || VERIFICAR_PID="$_off"

[[ -e /etc/systemd/system/killadm.service ]] &&  limiter_on="\033[1;32mON"
[[ -z $_os ]] && _os="\033[1;31m$(cat /etc/issue | cut -d " " -f 1,2 | head -1| tr a-z A-Z)"

#PIDSVARIAVEIS
[[ ! -z $(ps x | grep "badvpn" | grep -v "grep") ]] && _badvpn="$_on" || _badvpn="$_off"
[[ `grep -c "^#ADM" /etc/sysctl.conf` -eq 0 ]] && _tcpspeed="$_off" || _tcpspeed="$_on"
[[ -z $(dpkg -l | grep fail2ban | grep ii) ]] && fail_b="$_off" || fail_b="$_on"
[[ -e /bin/ejecutar/uskill ]] && ukk="\033[1;31m$(cat /bin/ejecutar/uskill)" || ukk="\033[1;31m0"
v1=$(cat /bin/ejecutar/v-new.log)
v2=$(cat /etc/adm-lite/v-local.log)
if [ -e /etc/squid/squid.conf ]; then
squid_var="/etc/squid/squid.conf"
elif [ -e /etc/squid3/squid.conf ]; then
squid_var="/etc/squid3/squid.conf"
fi
[[ -e $squid_var ]] && {
teste_cache="#CACHE DO SQUID"
[[ `grep -c "^$teste_cache" $squid_var` -eq 0 ]] && _cachesquid="$_off" || _cachesquid="$_on"
}

vary_rex () {
echo -e $(echo "$1"| sed 's/../\\x&/g;s/$/ /') && return 0 || return 1
}

funcao_verificacao () {
  [[ -e /etc/adm-lite/modulos ]] && {
  for _pids_ in `atq | awk '{print $1}'`; do
   atrm $_pids_
  done
  [[ -e ./vencidos ]] && rm ./vencidos
  [[ -e ./onlines ]] && rm ./onlines
  [[ -e ./total ]] && rm ./total
  rm -f /etc/adm-lite/modulos
  rm -f /bin/ejecutar/usCONEXT
  rm -f /bin/ejecutar/usCONEXC
  echo " CONTADOR ONLINE DESACTIVADO !!"
  msg -bar
  read -p " PRESIONA ENTER PARA RETORNAR"
  return
    } || {
	clear&&clear
  echo "VERIFICAR" > /etc/adm-lite/modulos 
unset sshsn
unset sin_nao
msg -bar3
print_center -verm2 'ADVERTENCIA!!!\n ESTA FUNCION PODRIA CONSUMIR RECURSOS \n O CPU ELEVADO DEVIDO AL BUBLE DE VERIFICACION DE CONSUMO \n SI NOTA LENTITUD EN SU SERVIDOR \n DETENGALO INMEDIATAMENTE!!'
msg -bar3
echo -e "${cor[3]} DESEAS ACTIVAR EL CONTROLADOR DE "
echo -e "${cor[3]} TIEMPO - CUENTA EL TIEMPO DE CONEXION "
echo -ne "${cor[3]} Esta SEGURO -> "
read -p " [S/N]: " -e -i s sshsn
[[ "$sshsn" = @(s|S|y|Y) ]] && {
echo "TIEMPO" > /bin/ejecutar/usCONEXT
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
unset sshsn
unset sin_nao
} || {
rm -f /bin/ejecutar/usCONEXT
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
unset sshsn
unset sin_nao
}
echo -e "${cor[3]} CONSUMO - CUENTA EL CONSUMO DE CONEXION "
echo -ne "${cor[3]} Esta SEGURO -> "
read -p " [S/N]: " -e -i n sshsn
[[ "$sshsn" = @(s|S|y|Y) ]] && {
echo "CONSUMO" > /bin/ejecutar/usCONEXC
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
unset sshsn
unset sin_nao
} || {
rm -f /bin/ejecutar/usCONEXC
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
unset sshsn
unset sin_nao
}
  chmod 777 /etc/adm-lite/*
  echo -e " CONTADOR ONLINE ACTIVADO !!"
  echo -e " RECUERDA QUE PARA EL CONTROLADOR DE \n CONSUMO DE USUARIOS"
  echo -e " ES NECESARIO QUE TENGAS EL KILL MULTILOGIN ACTIVADO"
  msg -bar
  read -p " PRESIONA ENTER PARA RETORNAR"
  return
  }
}


#LLENA USUARIO EN ARRAY $select_name DEL USUARIO
select_users () {
unset users
local _cont="1"
for u in `cat "/etc/passwd"|grep 'home'|grep 'false'|grep -v 'syslog' | cut -d: -f1`; do
users[$_cont]="$u"
local lmt="$(cat /etc/adm-lite/userDIR/$u | grep "limite" | awk '{print $2}')"
[[ -e /etc/adm-lite/userDIR/$u ]] && {
[[ $(passwd --status $u|cut -d ' ' -f2) = "L" ]] && echo -e "\033[0;35m [\033[0;36m$_cont\033[0;35m]\033[0;31m ➮${cor[5]} $u \033[1;34m<--\033[1;31m LOCK" || {
#"$limite" =~ ^[0-9]+$
[[ $(echo -e ${lmt} |sed -e 's/[^0-9]//ig') ]] && { 
	echo -e "\033[0;35m [\033[0;36m$_cont\033[0;35m]\033[0;31m ➮${cor[5]} $u" 
	} || {
		[[ "$(echo -e ${lmt})" = "HWID" ]] && echo -e "\033[0;35m [\033[0;36m$_cont\033[0;35m]\033[0;31m ➮${cor[5]} ${lmt} -> $u"
		[[ "$(echo -e ${lmt})" = "TOKEN" ]] && echo -e "\033[0;35m [\033[0;36m$_cont\033[0;35m]\033[0;31m ➮${cor[5]} ${lmt} -> $u"
	}
}
[[ -z ${u} ]] && break
}
_cont=$(($_cont + 1))
done
unset name
msg -bar
echo -e "${cor[5]} NUMERO DE USUARIO, O ESCRIBRE EL NOMBRE"
echo -ne "${cor[6]}"
read -p " > OPCION : " select_user
tput cuu1 && tput dl1
[[ -z $select_user ]] && echo -e "${cor[5]} NO SELECCIONO USUARIO . . ." && return
[[ "$select_user" -le "$_cont" ]] && {
select_name=${users[$select_user]}
echo -e "${cor[5]} $name"
} || {
[[ ! -z $(cat /etc/passwd |grep "$select_user:") ]] && {
select_name="$select_user"
} || {
echo -e "${cor[5]}   USUARIO ESCOJIDO, NO EXISTE"
echo -e "${cor[5]} SELECCION DE USUARIO INCORRECTA"
return
  }
}
unset select_user
}

#RELLENA LA VARIABLE $IP CON LA IP PUBLICA
meu_ip () {
  if [[ -e /bin/ejecutar/IPcgh ]]; then
    IP="$(cat /bin/ejecutar/IPcgh)"
  else
    MEU_IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
    MEU_IP2=$(wget -qO- ipv4.icanhazip.com)
    [[ "$MEU_IP" != "$MEU_IP2" ]] && IP="$MEU_IP2" && echo "$MEU_IP2" || IP="$MEU_IP" && echo "$MEU_IP"
    echo "$MEU_IP2" > /bin/ejecutar/IPcgh
	IP="$MEU_IP2"
  fi
}

ofus () {
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="x";;
"x")txt[$i]=".";;
"5")txt[$i]="s";;
"s")txt[$i]="5";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"4")txt[$i]="0";;
"0")txt[$i]="4";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
 

fun_atualizar () {
cd /etc/adm-lite
chmod 777 ./*
echo -e "${cor[3]} ¿DESEAS CONTINUAR CON UPDATE DEL SCRIPT ? "
read -p " [S/N]: " -e -i s sshsn
[[ "$sshsn" = @(s|S|y|Y) ]] && {
[[ -e /etc/adm-lite/idioma ]] && rm /etc/adm-lite/idioma
source <(curl -sSL https://www.dropbox.com/s/57xibc03arhjo7w/updateadm) "alx"
}
}

#GERA NOVO CLIENTE
newclient () {

	# Generates the custom client.ovpn
	rm -rf /etc/openvpn/easy-rsa/pki/reqs/$1.req
	rm -rf /etc/openvpn/easy-rsa/pki/issued/$1.crt
	rm -rf /etc/openvpn/easy-rsa/pki/private/$1.key
	cd /etc/openvpn/easy-rsa/
	./easyrsa build-client-full $1 nopass > /dev/null 2>&1
	cd
	cp /etc/openvpn/client-common.txt ~/$1.ovpn
	echo "<ca>" >> ~/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/ca.crt >> ~/$1.ovpn
	echo "</ca>" >> ~/$1.ovpn
	echo "<cert>" >> ~/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/issued/$1.crt >> ~/$1.ovpn
	echo "</cert>" >> ~/$1.ovpn
	echo "<key>" >> ~/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/private/$1.key >> ~/$1.ovpn
	echo "</key>" >> ~/$1.ovpn
	echo "<tls-auth>" >> ~/$1.ovpn
	cat /etc/openvpn/ta.key >> ~/$1.ovpn
	echo "</tls-auth>" >> ~/$1.ovpn
}

open_1 () {
CLIENT="$1"
senha="$2"
daysrnf="$3"
limit="$4"
#cd /etc/openvpn/easy-rsa/
#./easyrsa build-client-full $CLIENT nopass
newclient "$CLIENT"
#echo ""
#echo "$CLIENT KEY" ~/"$CLIENT.ovpn"
valid=$(date '+%C%y-%m-%d' -d " +$daysrnf days")
datexp=$(date "+%d/%m/%Y" -d "+ $daysrnf days")
useradd -M -s /bin/false -d /home/ovpn/ $CLIENT -e $valid
usermod -p $(openssl passwd -1 $senha) $CLIENT
#Arquivo
  while [[ ${newfile} != @(s|S|y|Y|n|N) ]]; do
	msg -bar
   read -p "Crear Archivo OpenVPN? [S/N]: " -e -i S newfile
   tput cuu1 && tput dl1
  done
  [[ ${newfile} = @(s|S|y|Y) ]] && {
    while [[ ${ovpnauth} != @(s|S|y|Y|n|N) ]]; do
    read -p " Colocar autenticacion de usuario en el archivo? [S/N]: " -e -i S ovpnauth
    tput cuu1 && tput dl1
  done
  [[ ${ovpnauth} = @(s|S|y|Y) ]] && sed -i "s;auth-user-pass;<auth-user-pass>\n$CLIENT\n$senha\n</auth-user-pass>;g" $HOME/$CLIENT.ovpn
  cd $HOME
  zip ./$CLIENT.zip ./$CLIENT.ovpn > /dev/null 2>&1
  echo -e "\033[1;31m Archivo generado en: ($HOME/$CLIENT.zip)"
  echo -e "\033[1;32m ALOJAR ONLINE ( * menu * opcion 2 * opcion 8 )"
  }
rm -f ./$CLIENT.ovpn
cd /etc/adm-lite
echo "senha: $senha" > $dir_user/$CLIENT
echo "limite: $limit" >> $dir_user/$CLIENT
echo "data: $valid" >> $dir_user/$CLIENT
}

open_2 () {
CLIENT="$1"
userdel --force $CLIENT
cd /etc/adm-lite
[[ -e $dir_user/$CLIENT ]] && rm $dir_user/$CLIENT
}

#VERIFICA SI ES NUMERO
number_var () {
unset var_number
if (echo "$1" | egrep '[^0-9]' &> /dev/null); then
echo -e "${cor[5]} SOLO NUMEROS!"
else
var_number="$1"
fi
}

ports_ () {
unset puertos texto texto_ svcs porta
local texto
local texto_
local puertos
local svcs
local PT=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN")
local _ps="$(ps x)"
x=1
for porta in `echo -e "$PT" | cut -d: -f2 | cut -d' ' -f1 | uniq`; do
	[[ -z $porta ]] && continue
	porta[$x]="$porta"
	#echo "$porta - $(echo -e "$PT" | grep -w "$porta" | awk '{print $1}' | uniq | tail -1)"
	svcs[$x]="$(echo -e "$PT" | grep -w "$porta" | awk '{print $1}' | uniq | tail -1)"
	let x++;
done

for((i=1; i<$x; i++)); do
[[ ! -z ${svcs[$i]} ]] && texto="\033[1;34m ${pPIniT} \033[1;37m${svcs[$i]}: \033[1;31m${porta[$i]}" || texto=''
[[ ${svcs[$i]} = "apache2" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mAPACHE: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "node" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mWebSocket: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "clash" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mClash: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "psiphond" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mPSIPHON: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "xray-v2-u" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mXRAY/UI: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "v2-ui" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mV2-UI/WEB: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "xray-linu" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mXRAY/UI: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "x-ui" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mXUI/WEB: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "openvpn" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mOPENVPN-TCP: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "squid" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSQUID: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "squid3" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSQUID: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "dropbear" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mDROPBEAR: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "python3" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSOCKS/PYTHON3: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "python" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSOCKS/PYTHON: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "obfs-serv" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSSR (OBFS): \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "ss-server" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSSR (LIV): \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "sshd" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSSH: ${porta[$i]}"
[[ ${svcs[$i]} = "ssh" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSSH: ${porta[$i]}"
[[ ${svcs[$i]} = "systemd-r" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSystem-DNS: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "stunnel4" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSSL: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "stunnel" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSSL: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "v2ray" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mV2RAY: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "xray" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mXRAY: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "badvpn-ud" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mBadVPN: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "trojan" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mTrojan-GO: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "sslh" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSSLH: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "nc.tradit" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mKeyGen: \033[1;31mON"
[[ ${svcs[$i]} = "filebrows" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mFileBrowser: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "rpcbind" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mRPCBind: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "snell-ser" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSNell: \033[1;31m${porta[$i]}"
    i=$(($i+1))
[[ ! -z ${svcs[$i]} ]] && texto_="\033[1;34m ${pPIniT} \033[1;37m${svcs[$i]}: \033[1;31m${porta[$i]}" || texto_=''
[[ ${svcs[$i]} = "apache2" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mAPACHE: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "node" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mWebSocket: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "clash" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mClash: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "psiphond" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mPSIPHON: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "xray-v2-u" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mXRAY/UI: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "v2-ui" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mV2-UI/WEB: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "xray-linu" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mXRAY/UI: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "x-ui" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mXUI/WEB: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "openvpn" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mOPENVPN-TCP: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "squid" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSQUID: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "squid3" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSQUID: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "dropbear" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mDROPBEAR: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "python3" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSOCKS/PYTHON3: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "python" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSOCKS/PYTHON: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "obfs-serv" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSSR (OBFS): \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "ss-server" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSSR (LIV): \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "sshd" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSSH: ${porta[$i]}"
[[ ${svcs[$i]} = "ssh" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSSH: ${porta[$i]}"
[[ ${svcs[$i]} = "systemd-r" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSystem-DNS: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "stunnel4" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSSL: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "stunnel" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSSL: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "v2ray" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mV2RAY: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "xray" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mXRAY: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "badvpn-ud" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mBadVPN: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "trojan" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mTrojan-GO: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "sslh" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSSLH: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "nc.tradit" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mKeyGen: \033[1;31mON"
[[ ${svcs[$i]} = "filebrows" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mFileBrowser: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "rpcbind" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mRPCBind: \033[1;31m${porta[$i]}"
[[ ${svcs[$i]} = "snell-ser" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSNell: \033[1;31m${porta[$i]}"
#[[ -z $texto_ ]] && {
#[[ -z $(echo -e "${_ps}"| grep slowdns | grep -v grep) ]] || texto_="\033[1;34m ∘ \033[1;37mSlowDNS: \033[1;33m5300"
#					}
#[[ -z $(echo -e "${_ps}"| grep slowdns | grep -v grep) ]] || texto="\033[1;34m ∘ \033[1;37mSlowDNS: \033[1;33m5300"
puertos+="${texto}|${texto_}\n"
done 
local _PT=$(lsof -V -i UDP -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND"|grep -E 'openvpn|dns-serve|udpServer')
x=1
for porta in `echo -e "$_PT" | cut -d: -f2 | cut -d' ' -f1 | uniq`; do
	[[ -z $porta ]] && continue
	_porta[$x]="$porta"
	_svcs[$x]="$(echo -e "$_PT" | grep -w "$porta" | awk '{print $1}' | uniq | tail -1)"
	let x++;
done
for((i=1; i<$x; i++)); do
[[ ! -z ${_svcs[$i]} ]] && texto="\033[1;34m ${pPIniT} \033[1;37m${_svcs[$i]}: \033[1;31m${_porta[$i]}" || texto=''
[[ ${_svcs[$i]} = "dns-serve" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mSlowDNS: \033[1;31m${_porta[$i]}"
[[ ${_svcs[$i]} = "openvpn" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mOPENVPN-UDP: \033[1;31m${_porta[$i]}"
[[ ${_svcs[$i]} = "udpServer" ]] && texto="\033[1;34m ${pPIniT} \033[1;37mUDPServer: \033[1;31m${_porta[$i]}"
    i=$(($i+1))
[[ ! -z ${_svcs[$i]} ]] && texto_="\033[1;34m ${pPIniT} \033[1;37m${_svcs[$i]}: \033[1;31m${_porta[$i]}" || texto_=''
[[ ${_svcs[$i]} = "dns-serve" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mSlowDNS: \033[1;31m${_porta[$i]}"
[[ ${_svcs[$i]} = "openvpn" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mOPENVPN-UDP: \033[1;31m${_porta[$i]}"
[[ ${_svcs[$i]} = "udpServer" ]] && texto_="\033[1;34m ${pPIniT} \033[1;37mUDPServer: \033[1;31m${_porta[$i]}"
puertos+="${texto}|${texto_}\n"
done

[[ $(echo -e "$puertos" | grep 'SSH: 22') ]] && {
export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games
[[ -z $(locale | grep "LANG=" | cut -d "=" -f2) ]] && export LANG=en_US.UTF-8
echo -e "$puertos"|column -s "|"  -t 
} || echo -e "     ⚠️ PUERTOS SSH TRUNCADO POR DROPBEAR ⚠️   \n		Coloca : sudo -i \n	    Ve al menu 7, opcion 7 " 
local PIDGEN=$(echo -e "${_ps}"| grep "BotGen.sh" | grep -v grep |awk '{print $1}')
[[ ! -z $PIDGEN ]] && {
local botG="\033[1;34m ${pPIniT} \033[1;37m BotGen Telegram 🤖 : \033[1;31m ⚡ ACTIVO ⚡"
msg -bar
echo -e "$botG"
unset svcs porta puertos i x
}
}

#declare -A tnUP=' ⚠️ ChumoGH ADM ⚠️ NECESITA ACTUALIZARSE!'
declare -A exitokey="\033[3;49;32m$(cat < /bin/ejecutar/exito)©"
declare -A cpu_core=$(cat /proc/cpuinfo | grep processor | wc -l)
declare -A cpu_model=$(uname -m)
[[ $cpu_model = "aarch64" ]] && cpu_model=" ARM64 Pro" 
[[ $v1 = $v2 ]] && vesaoSCT="\033[1;37m Key: $exitokey 】\033[0m\033[0;33m($v2)" || vesaoSCT="\033[1;37m Key: $exitokey 】\033[0m\033[0;33m($v2) ► \033[1;32m($v1)\033[1;31m"
meu_ip
[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} ChumoGH${TTcent}VPS  ${TTfin}      "
msg -bar
[[ -e /etc/adm-lite/modulos ]] && echo -e "${cor[2]} ${pPIniT} \033[1;37mONLINES: ${_onlin}${cor[2]} ${pPIniT} \033[1;37mEXP: ${_userexp} ${cor[2]}${pPIniT}\033[1;37m KILL: $ukk ${cor[2]}${pPIniT}\033[1;37m TOTAL: ${_tuser}"
echo -e "${cor[2]} ${pPIniT} \033[1;37mS.O: ${_os} ${cor[2]}${pPIniT} \033[1;37mBase:\033[1;31m${cpu_model} ${cor[2]}${pPIniT} \033[1;37mCores:\033[1;31m ${cpu_core} "
echo -e "${cor[2]} ${pPIniT} \033[1;37mIP:\033[1;31m ${IP} ${cor[2]}${pPIniT} \033[1;37mFECHA: \033[1;31m$(date +"%d/%m/%Y")-$(date +"%H:%M")" 
msg -bar
echo -e "${vesaoSCT} "
msg -bar
[[ $1 = "ports_" ]] && ports_
export -f ports_
export -f ofus
export -f fun_atualizar
export -f select_users
export -f remover_adm
export -f instalar_fun
export -f meu_ip
