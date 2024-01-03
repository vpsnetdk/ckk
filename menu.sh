#!/usr/bin/env sh

	                        unset soporte slogan
	            soporte=@drowkid01 && slogan="✧ | ᴅʀᴏᴡᴋɪᴅ | ✧"

declare -A sdir=( [banner]="banner" [fpy]="filepy" [fsh]="filesh" [v]="version" [drw]="main" [tmp]=tmp )
declare -A sfile=( [exec]=${sdir[fsh]}/cabecalho.sh [f2b]=${sdir[fsh]}/fai2ban.sh [frm]=${sdir[fsh]}/ferramentas.sh [minst]=${sdir[fsh]}/menu_inst.sh [pyl]=${sdir[fsh]}/payloads [ss]=${sdir[fsh]}/shadowsocks.sh [uht]=${sdir[fsh]}/ultrahost.sh [usr]=${sdir[fsh]}/usercodes.sh [PDirect]=${sdir[fpy]}/PDirect.py [PGet]=${sdir[fpy]}/PGet.py [POpen]=${sdir[fpy]}/POpen.py [PPriv]=${sdir[fpy]}/PPriv.py [PPub]=${sdir[fpy]}/PPub.py [ress]=${sdir[banner]}/message.txt [banner]=${sdir[banner]}/name [main]=main.sh [version]=${sdir[v]}/v-new.log [msg]=${sdir[tmp]}/msg )
declare -A url=( [py]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filepy" [sh]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filesh" [main]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/main.sh" [msg]="https://gist.githubusercontent.com/vpsnetdk/a47403148a3f10fbbf645089597f5af7/raw/e902f8fd9a273912379a5b0ea0eb3a6e34f00a91/msg" [utx]="https://raw.githubusercontent.com/vpsnetdk/files-ckk/main" )

source ${sfile[msg]}
#source <(curl -sSL https://gist.githubusercontent.com/vpsnetdk/3127b0dae7ec58484bcf7385b03ef023/raw/7f27015c0ca68facb1ef003971bed8cd8cba5696/msg)
source ${sfile[main]} --general

start_menu () {
local mem_total=$(free --mega -h | awk 'NR==2{printf $2}')
local mem_used=$(free --mega -h | awk 'NR==2{printf $3}')
local mem_free=$(free --mega -h | awk 'NR==2{printf $4}')
local mem_cache=$(free --mega -h | awk 'NR==2{printf $6}')
local mem_available=$(free --mega -h | awk 'NR==2{printf $7}') 
local mem_used_percent=$(free --mega | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

local swap=$(swapon -s)
local swap_total=$(free --mega -h | awk 'NR==3{printf $2}')
local swap_used=$(free  --mega -h | awk 'NR==3{printf $3}')
local swap_free=$(free  --mega -h | awk 'NR==3{printf $4}')
local cpu_used="$(top -b -n1 | grep 'Cpu(s)' | awk '{print $2 + $4}')"%
local _os="\033[1;31m$(cat /etc/issue | cut -d " " -f 1,2 | head -1| tr a-z A-Z)"
local tmp_distro=($(lsb_release -d |cut -f2 | tr a-z A-Z))

local distro="${tmp_distro[0]} ${tmp_distro[1]}"

cor[0]="\033[0m"
cor[1]="\033[1;34m"
cor[2]="\033[1;32m"
cor[3]="\033[1;37m"
cor[4]="\033[1;36m"
cor[5]="\033[1;33m"
cor[6]="\033[1;35m"
#SE CAMBIAN VARIABLES A ANTES DE LLENAR CACHE Y CPU ( MAQUILLAJE COMO OTROS MODS )
source ${sfile[exec]} "ports_"
##
[[ -z "$(cat /etc/crontab | grep 'ejecutar')" ]] && _opti="\033[0;31m [OFF]" || _opti="\033[0;31m [\033[0;32mON\033[0;31m]"
[[ -e /etc/bash.bashrc-bakup ]] && _autorun="\033[0;31m [\033[0;32mON\033[0;31m] " || _autorun="\033[0;31m [OFF]"
[[ -e /etc/systemd/system/killadm.service ]] && lmt="\033[0;31m [\033[0;32mON\033[0;31m] " || lmt="\033[0;31m [OFF]"
msg -bar
echo -e "\033[1;34m ${TOP}\033[1;31m TOTAL:\033[1;32m ${mem_total}\033[1;34m ${TOP} \033[1;31m Libre:\033[1;32m ${mem_free} \033[1;34m ${TOP} \033[1;31m Usada:\033[1;32m ${mem_used}"
echo -e "\033[1;34m ${TOP}\033[1;31m Uso RAM:\033[1;32m${mem_used_percent} \033[1;34m${TOP}\033[1;31m Uso CPU:\033[1;32m${cpu_used} \033[1;34m ${TOP}\033[1;31m Cache:\033[1;32m ${mem_cache}" # $CPU"%"
msg -bar
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m ${flech}${cor[3]} CONTROL USUARIOS (SSH/SSL/DROPBEAR/VMESS) "
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m ${flech}${cor[3]} HERRAMIENTAS (\033[0;34mBad/VPN$_badvpn${cor[3]}) (\033[0;34mTCP-SPEED$_tcpspeed${cor[3]})"
echo -e "\033[0;35m [\033[0;36m3\033[0;35m]\033[0;31m ${flech}\033[0;33m [!]${cor[3]} OPTIMIZAR VPS ${_opti}"
echo -e "\033[0;35m [\033[0;36m4\033[0;35m]\033[0;31m ${flech}\033[0;33m [!]\033[0;31m DESINSTALAR SCRIPT"
echo -e "\033[0;35m [\033[0;36m6\033[0;35m]\033[0;31m ${flech}${cor[3]} CONTADOR ONLINE USERS $VERIFICAR_PID"
echo -e "\033[0;35m [\033[0;36m7\033[0;35m]\033[0;31m ${flech} \e[3;32mHERRAMIENTAS BETA\e[0m \033[0;33m (#EXPERIMENTAL)"
echo -e "\033[0;35m [\033[0;36m8\033[0;35m]\033[0;31m ${flech}${cor[3]} AUTOINICIAR SCRIPT $_autorun"
echo -e "\033[0;35m [\033[0;36m9\033[0;35m]\033[0;31m ${flech}${cor[3]} INSTALADOR DE PROTOCOLOS "
msg -bar 
echo -ne "\033[0;35m [\033[0;36m10\033[0;35m]\033[0;31m ${flech}\033[0;33m [!] \033[1;32mACTUALIZAR${cor[3]}  |" && echo -e " \033[0;35m [\033[0;36m0\033[0;35m]\033[0;31m ${flech} $(msg -bra "\033[1;41m[ Salir ]\e[0m")"
msg -bar  
}

#FUNCION DE SELECCION
fun_teste(){
bash -c "$(curl -fsSL https://www.dropbox.com/s/z5x4zh43ztx4buy/funciones.sh)"
}

function removerv2ray(){
BASE_SOURCE_PATH="https://multi.netlify.app"
UTIL_PATH="/etc/v2ray_util/util.cfg"
UTIL_CFG="$BASE_SOURCE_PATH/v2ray_util/util_core/util.cfg"
BASH_COMPLETION_SHELL="$BASE_SOURCE_PATH/v2ray"
CLEAN_IPTABLES_SHELL="$BASE_SOURCE_PATH/v2ray_util/global_setting/clean_iptables.sh"
source <(curl -sL https://multi.netlify.com/v2ray.sh) --remove
source <(curl -sL https://git.io/JeSZL) --remove
bash <(curl -L -s https://multi.netlify.app/go.sh) --remove -x >/dev/null 2>&1
rm -rf /etc/v2ray >/dev/null 2>&1
rm -rf /var/log/v2ray >/dev/null 2>&1
rm -rf /etc/xray >/dev/null 2>&1
rm -rf /var/log/xray >/dev/null 2>&1
bash <(curl -L -s $CLEAN_IPTABLES_SHELL)
pip uninstall v2ray_util -y
rm -rf /usr/share/bash-completion/completions/v2ray.bash >/dev/null 2>&1
rm -rf /usr/share/bash-completion/completions/v2ray >/dev/null 2>&1
rm -rf /usr/share/bash-completion/completions/xray >/dev/null 2>&1
rm -rf /etc/bash_completion.d/v2ray.bash >/dev/null 2>&1
rm -rf /usr/local/bin/v2ray >/dev/null 2>&1
rm -rf /etc/v2ray_util >/dev/null 2>&1
crontab -l|sed '/SHELL=/d;/v2ray/d'|sed '/SHELL=/d;/xray/d' > crontab.txt
crontab crontab.txt >/dev/null 2>&1
rm -f crontab.txt >/dev/null 2>&1
systemctl restart cron >/dev/null 2>&1
exit
}
sfix () {
source <(curl -sL ${url[utx]}/sourcesfix.sh)
}
trofix(){
source <(curl -sSL ${url[utx]}/mod-v2ray.sh)
}
autoop(){
[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChumoGH${TTcent}VPS ${TTfin}      \033[0m"
echo -e "\033[1;37m  ${RRini} Reseller : $(cat < $slogan ) 2023 ${RRfin}\033[0m"
msg -bar 
echo -e "${cor[2]} \033[1;32mESTA FUNCION AGREGARA EN EL CRONTAB UN AUTOEJECUCION"
echo -e "${cor[2]} \033[1;32m. Este Metodo Optimizara y limpiara Tu SERVIDOR"
echo -e "${cor[2]} \033[1;32mDe manera automatica para evitar Lags y lentitud cada 5/"
echo -e "${cor[2]} \033[1;32mSI ESTAS DE ACUERDO, PRESIONA 1, CASO CONTRARIO 0"
msg -bar  
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m ${flech} ${cor[3]} ACTIVAR AUTOLIMPIEZA ( AUTO OPTIMIZACIONES )"
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m ${flech} ${cor[3]} DESACTIVAR MOD DE LIMPIEZAS ( APAGA OPCION 1 )"
msg -bar 
echo -e " \033[0;35m [\033[0;36m0\033[0;35m]\033[0;31m ${flech} $(msg -bra "\033[1;41m[ Salir ]\e[0m")" 
msg -bar 
selection=$(selectw 2)
case ${selection} in
0)
clear&&clear && echo -e "${cor[0]}"
return
;;
1)clear&&clear
[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChumoGH${TTcent}VPS ${TTfin}      \033[0m"
echo -e "\033[1;37m  ${RRini} Reseller : $(cat < $slogan ) 2023 ${RRfin}\033[0m"
echo " Desabilitando Servicios de AutOptimizacion" && sed -i "/ejecutar/d" /etc/crontab
echo -ne " VERIFICANDO SISTEMA......"
if wget ${url[utx]}/tumbs.sh &>/dev/null -O /usr/bin/autotumbs &>/dev/null ; then
echo -e "${cor[2]} \033[1;32m EXITO \n" && msg -bar 
chmod +x /usr/bin/autotumbs &>/dev/null
autotumbs --start
#rm -rf /usr/bin/autotumbs
else
echo -e "${cor[2]} \033[1;31m FAIL \n" && msg -bar 
sleep 2s
return
fi
msg -bar 
echo -e " INGRESA TU NOMBRE DE BACKUP / 0 PARA CANCELAR"
read -p " NOMBRE : " bkp
[[ ${bkp} = 0 ]] && return 
echo $bkp > /bin/ejecutar/autt
[[ -e /bin/ejecutar/autt ]] && name=$(cat < /bin/ejecutar/autt)
echo " Nombre $name Cargado Exitosamente"
echo -e "        Nombre $name Cargado Exitosamente "  
echo -e "Ahora accede a http://$(wget -qO- ipv4.icanhazip.com):81/$name "
echo -e "    AQUI ENCONTRARAS TU FICHERO ONLINE"
service apache2 restart
read -p "Enter para Continuar"
;;
2)
echo -e "Desabilitando Servicios de AutOptimizacion"
echo -ne " VERIFICANDO SISTEMA......"
if wget ${url[utx]}/tumbs.sh &>/dev/null -O /usr/bin/autotumbs &>/dev/null ; then
echo -e "${cor[2]} \033[1;32m EXITO \n" && msg -bar 
chmod +x /usr/bin/autotumbs &>/dev/null 
autotumbs --stop
#rm -rf /usr/bin/autotumbs
else
echo -e "${cor[2]} \033[1;31m FAIL \n" && msg -bar 
sleep 2s
return
fi
[[ -e /bin/ejecutar/autt ]] && name=$(cat < /bin/ejecutar/autt)
[[ -z $name ]] && return
[[ -e /bin/ejecutar/autt ]] && rm -f /bin/ejecutar/autt 
[[ -e /var/www/html/$name ]] && rm -f /var/www/html/$name
;;
esac
}
bbr () {
source <(curl -sSL ${url[utx]}/tcp.sh)
}
function tls13(){
apt-get install -y git autoconf libtool
git clone https://github.com/wolfssl/wolfssl.git
cd wolfssl/
./autogen.sh
./configure --enable-sha512
make
make install
ldconfig
./configure --enable-stunnel --enable-tls13
make
make install
ldconfig
service stunnel4 restart
cd /root
}
clash-man () {
source <(curl -sSL ${url[utx]}/clash-beta.sh)
}
fixssh () {
unset portserv
echo -e ""
echo -e " ESTO RECONFIGURA TU OPENSSH A CUSTOM "
echo -e ""
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
echo -e " Digita N/n PARA RETORNAR"
read -p "   [S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
sshfix="/etc/ssh/sshd_config"
msg -bar && echo -e " INGRESA TU PUERTO OpenSSH "
read -p " Defauld ( 22 ) : " -e -i '22' portserv
sed -i "/Port /d" ${sshfix}
sed -i "1i Port ${portserv}" $sshfix
msg -bar 
echo " OpenSSH ALTERADO A -> ${portserv}"
echo -ne " \033[1;31m[ ! ] DETENIENDO DROPBEAR -> 22" | pv -qL 40
service dropbear stop > /dev/null 2>&1
[[ -e /etc/init.d/dropbear ]] && /etc/init.d/dropbear stop > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
msg -bar 
echo -ne " \033[1;31m[ ! ] REINICIANDO OpenSSH" | pv -qL 40
service sshd restart > /dev/null 2>&1
service ssh restart > /dev/null 2>&1
[[ -e /etc/init.d/ssh ]] && /etc/init.d/ssh restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
msg -bar 
echo -ne " \033[1;31m[ ! ] RESTAURANDO PUERTOS DROPBEAR" | pv -qL 40
service dropbear restart > /dev/null 2>&1
[[ -e /etc/init.d/dropbear ]] && /etc/init.d/dropbear restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
msg -bar 
echo -e "REINICIANDO VPS"
sleep 0.5s
echo -e " Mejor Reiniciamos los Servicios!!! 
			Si eso dio error
   Dijita manualmente en consola \033[0;32m(  sudo reboot  ) "
exit 0
fi
}
xswap () {
source <(curl -sSL ${url[utx]}/swapfile.sh)
}
mpro () {
msg -bar  
echo -e " MOSTRANDO 25 PROCESOS ACTIVOS EN VPS"
msg -bar 
#ps aux --width 30 --sort -rss | head
ps -Ao user,uid,comm,pid,pcpu,pmem --sort=-pcpu | head -n 25
read -p "Ingresa nombre de proceso a Destruir, ( no Dropbear, no SSH ) : " df
[ -z "$df" ] && df="kswapd0"
pidkill='ps x | grep -v grep | grep $df'
killall $df > /dev/null 2>&1 
#pidkill='ps x | grep -v grep | grep $df'
ps aux | grep -v grep | grep $df
echo "Proceso Liberado Exitosamente"
killall kswapd0 > /dev/null 2>&1
killall tcpdump > /dev/null 2>&1
killall ksoftirqd > /dev/null 2>&1
killall menu_inst > /dev/null 2>&1
killall menu > /dev/null 2>&1 
}
function goinst(){
echo -e "A continuacion se instalara el paquete GO Lang"
msg -bar 
echo -e "     \033[41m-- SISTEMA ACTUAL $(lsb_release -si) $(lsb_release -sr) --"
msg -bar 
fun_bar "apt install golang -y" 
cd $HOME
echo "DESACIENDO DIRECTORIOS EXISTENTES" && rm -rf /usr/local/go 1> /dev/null 2> /dev/null
echo "Buscando pauqte mas Actual" && sudo curl -O https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz  # Descargar el archivo. Cambie el nombre del archivo si necesita otra versión de Go o otra arquitectura# https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
echo -ne "Descomprimiendo Ultimo paquete Descargado"
sudo tar -xvf go1.9.linux-amd64.tar.gz > /dev/null && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
sudo mv go /usr/local  # Desplazar los binarios hacia /usr/local
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile  # Se actualiza su perfil bash para que Go este en el PATH
sleep 0.5s
echo -e "Reiniciando Fuente de Terminal..."
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
read -p " "
rm -f go1.9.linux-amd64.tar.*
source ~/.profile
}
ssrmenu() {
source <(curl -sSL ${url[utx]}/trojan-nao.sh)
}
btorrent () {
source <(curl -sL ${url[utx]}/blockT.sh)
}
chora () {
source <(curl -sL ${url[utx]}/hora.sh)
}

crea_pay () {
echo -e "A continuacion se instalara los Paquetes Necesarios"
echo -e "Sea Paciente mientas completamos el Proceso "
echo -e "Deseas Continuar?"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
echo -e "Instalando..."
cd
fun_bar "" 
apt update -y && apt upgrade -y 1> /dev/null 2> /dev/null
pkg install git  -y 1> /dev/null 2> /dev/null
apt install git  -y 1> /dev/null 2> /dev/null
cd /bin/ejecutar/
[[ -e /bin/ejecutar/Irparpaya-a/real-host-v2.sh ]] && rm -rf /bin/ejecutar/Irparpaya-a
git clone https://github.com/HackeRStrategy/Irparpaya-a && fun_bar && echo "Clonando del SITIO OFICIAL DEVELOPER" || echo "Fallo al Clonar"
cd Irparpaya-a && echo "Procedimiento Completado Exitosamente"
sleep 1s
bash real-host-v2.sh
fi

}

function removerbadvpn(){
badvpn stop
killall $(which badvpn-udpgw)
rm -f $(which badvpn-udpgw) > /dev/null
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}

function removetrojan(){
killall trojan > /dev/null
[[ -d /usr/local/etc/trojan ]] && rm -rf /usr/local/etc/trojan > /dev/null
[[ -d ${sdir[0]}/trojancert ]] && rm -rf ${sdir[0]}/trojancert > /dev/null
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}

function removerfail2ban(){
apt-get purge fail2ban -y
apt-get remove fail2ban -y
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removerstunnel(){
service stunnel4 stop 1> /dev/null 2> /dev/null
killall stunnel4 1> /dev/null 2> /dev/null
apt-get -y purge stunnel4 1> /dev/null 2> /dev/null
apt-get -y remove stunnel4 1> /dev/null 2> /dev/null
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removerwebmin(){
apt-get purge webmin -y
apt-get remove webmin -y
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removerpython(){
ck_py=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND"|grep "python")
if [[ -z $(echo "$ck_py" | awk '{print $1}' | head -n 1) ]]; then
echo -e "NO EXITEN PUERTOS"
    else
        ck_port=$(echo "$ck_py" | awk '{print $9}' | awk -F ":" '{print $2}')
        for i in $ck_port; do
        systemctl stop python.${i} &>/dev/null
        systemctl disable python.${1} &>/dev/null
        rm /etc/systemd/system/python.${i}.service &>/dev/null
        done
msg -bar    
fi
killall python
pkill python
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removershadowsocks(){
wget --no-check-certificate -O libev.sh ${url[utx]}/shadowsocks.sh > /dev/null 2>&1
chmod +x libev.sh 
./libev.sh uninstall 
rm -rf libev.sh 
cd /root
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removerdropbear(){
service dropbear stop
apt-get purge dropbear -y
apt-get remove dropbear -y
service dropbear stop
/etc/init.d/dropbear stop
killall dropbear
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removeropenvpn(){
apt-get purge openvpn -y
apt-get remove openvpn -y
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removerlibs32(){
apt-get purge ia32-libs -y
apt-get remove ia32-libs -y
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removernginx(){
apt-get purge nginx -y
apt-get remove nginx -y
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removersquid(){
apt-get purge squid -y
apt-get remove squid -y
apt-get purge squid3 -y
apt-get remove squid3 -y
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}
function removerv2ui(){
systemctl stop v2-ui
systemctl disable v2-ui
rm /etc/systemd/system/v2-ui.service -f
systemctl daemon-reload
systemctl reset-failed
rm /etc/v2-ui/ -rf
rm /usr/local/v2-ui/ -rf
killall v2-ui  &> /dev/null 2>&1
[[ -e /usr/bin/v2-ui ]] && rm -f /usr/bin/v2-ui
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
}

function mtraff(){
[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChuKK-SCRIPT${TTcent} VPS ${TTfin}      \033[0m"
echo -e "\033[1;37m  ${RRini} Reseller : $(cat $slogan ) 2023 ${RRfin}\033[0m"
msg -bar 
echo -e "${cor[2]}  ⇜ Comsumo de INTERNET TOTAL EN VPS ⇝ ⇅"
down=($(ifconfig $(ip route | grep default | awk '{print $5}') | grep -o "(.*)" ))
download_down=$(echo ${down[1]}${down[2]} | sed -e 's/(//' |sed -e 's/)//')
download_up=$(echo ${down[3]}${down[4]} | sed -e 's/(//' |sed -e 's/)//')
#echo -e " DESCARGA : $download_down | SUBIDA : $download_up" |column -t -s '|'
msg -bar 
echo -e "\033[1;36m  ↯↯↯ TRAFICO TOTAL DE BAJADA ↯↯↯ "
echo -e "\033[1;37m DESCARGA ↡ \033[1;32m --> \033[1;34m " $download_down "\033[1;32m <--\033[1;37m Ethernet ⇧ "
msg -bar 
echo -e "\033[1;36m  ⇈ TRAFICO TOTAL DE SUBIDA ⇈ "
echo -e "\033[1;37m SUBIDA ↡ \033[1;32m --> \033[1;34m " $download_up "\033[1;32m <--\033[1;37m Ethernet ⇧ "
msg -bar 
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR \033[0m"
read -p " "
}

reiniciar_ser () {
echo 3 > /proc/sys/vm/drop_caches 1> /dev/null 2> /dev/null
sysctl -w vm.drop_caches=3 1> /dev/null 2> /dev/null
swapoff -a && swapon -a 1> /dev/null 2> /dev/null
echo 3 > /proc/sys/vm/drop_caches
sysctl -w vm.drop_caches=3 > /dev/null 2>&1
##
echo ""
echo -ne " \033[1;31m[ ! ] Services BADVPN 7100 UDP"
[[ $(ps x | grep 7100 | grep -v grep) ]] && {
kill -9 $(ps x | grep 7100 | grep -v grep | awk '{print $1'}) > /dev/null 2>&1
screen -dmS badudp71 $(which badvpn-udpgw) --listen-addr 127.0.0.1:7100 --max-clients 1000 --max-connections-for-client 75 > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
} || echo -e "\033[1;31m [ SERVICE NO INSTALL ]"
echo -ne " \033[1;31m[ ! ] Services BadVPN 7300 UDP"
[[ $(ps x | grep 7300 | grep -v grep) ]] && {
kill -9 $(ps x | grep 7300 | grep -v grep | awk '{print $1'}) > /dev/null 2>&1
[[ -e /etc/systemd/system/badvpn.service ]] &&  { 
systemctl restart badvpn.service > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
} || {
screen -dmS badudp73 $(which badvpn-udpgw) --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 75 > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
}
} || echo -e "\033[1;31m [ SERVICE NO INSTALL ]"
echo -ne " \033[1;31m[ ! ] Services AUTOREBOOT PYTHON RESTART"
[[ $(grep -wc "ws" /bin/autoboot) = '0' ]] && {
killall python 
autoboot && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
}

echo -ne " \033[1;31m[ ! ] Services BADVPN 7200 UDP" 
[[ $(ps x | grep 7200 | grep -v grep) ]] && {
kill -9 $(ps x | grep 7200 | grep -v grep | awk '{print $1'}) > /dev/null 2>&1
bash <(curl -sL ${url[utx]}/netflix.sh) > /dev/null && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
} || echo -e "\033[1;31m [ SERVICE NO INSTALL ]"
echo -ne " \033[1;31m[ ! ] Services ssh restart"
service ssh restart > /dev/null 2>&1
[[ -e /etc/init.d/ssh ]] && /etc/init.d/ssh restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services SlowDNS restart"
[[ -e /etc/slowdns/infons ]] && {
cd /etc/slowdns
nameserver=$(cat /etc/slowdns/infons)
killall /etc/slowdns/dns-server &> /dev/null
screen -dmS slowdns /etc/slowdns/dns-server -udp :5300 -privkey-file /root/server.key $nameserver 127.0.0.1:22 > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
} || echo -e "\033[1;31m [ SERVICE NO INSTALL ]"
echo -ne " \033[1;31m[ ! ] Services stunnel4 restart"
service stunnel4 restart > /dev/null 2>&1
systemctl restart stunnel > /dev/null 2>&1
[[ -e /etc/init.d/stunnel4 ]] && /etc/init.d/stunnel4 restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services stunnel5 restart"
service stunnel5 restart > /dev/null 2>&1
systemctl restart stunnel5.service > /dev/null 2>&1
[[ -e /etc/init.d/stunnel5 ]] && systemctl restart stunnel5.service > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services V2RAY restart"
service v2ray restart > /dev/null 2>&1
[[ -e /etc/v2ray/config.json ]] && v2ray restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services X-UI restart"
[[ -e /usr/local/x-ui/bin/config.json ]] && { 
systemctl restart x-ui > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" 
} || echo -e "\033[1;31m [FAIL]"
echo -e " \033[1;31m[ ! ] Services Trojan-GO restart"
killall trojan &> /dev/null 2>&1
[[ -e /usr/local/etc/trojan/config.json ]] && {
[[ $(uname -m 2> /dev/null) != x86_64 ]] && {
echo -ne "\033[1;32mÎ” RESTART FOR ARM X64 " && (screen -dmS trojanserv trojan --config /usr/local/etc/trojan/config.json &) && echo "OK " || echo -e "\033[1;32mÎ” FAIL"
} || (screen -dmS trojanserv trojan /usr/local/etc/trojan/config.json -l /root/server.log &) && echo "OK " || echo -e "\033[1;32mÎ” FAIL"
}
echo -ne " \033[1;31m[ ! ] Services squid restart"
service squid restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services squid3 restart"
service squid3 restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services apache2 restart"
service apache2 restart > /dev/null 2>&1
[[ -e /etc/init.d/apache2 ]] && /etc/init.d/apache2 restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services openvpn restart"
service openvpn restart > /dev/null 2>&1
[[ -e /etc/init.d/openvpn ]] && /etc/init.d/openvpn restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services dropbear restart"
service dropbear restart > /dev/null 2>&1
[[ -e /etc/init.d/dropbear ]] && /etc/init.d/dropbear restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services KeyGen restart"
killall http-server.sh &> /dev/null 2>&1
[[ -e /bin/http-server.sh ]] && screen -dmS generador /bin/http-server.sh -start > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services fail2ban restart"
( 
[[ -e /etc/init.d/ssh ]] && /etc/init.d/ssh restart
fail2ban-client -x stop && fail2ban-client -x start
) > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
killall kswapd0 > /dev/null 2>&1
killall tcpdump > /dev/null 2>&1
killall ksoftirqd > /dev/null 2>&1
killall menu_inst > /dev/null 2>&1
killall menu > /dev/null 2>&1
return 0
}
host_name () {
unset name
while [[ ${name} = "" ]]; do
echo -ne "\033[1;37m Nuevo nombre del host : " && read name
tput cuu1 && tput dl1
done
hostnamectl set-hostname $name 
echo $name > name
if [ $(hostnamectl status | head -1  | awk '{print $3}') = "${name}" ]; then 
echo -e "\033[1;33m Host alterado corretamente !, reiniciar VPS"
else
echo -e "\033[1;33m Host no modificado!"
fi
return
}

cambiopass () {
clear&&clear
[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChumoGH${TTcent}VPS ${TTfin}      \033[0m"
echo -e "\033[1;37m  ${RRini} Reseller : $(cat < /bin/ejecutar/menu_credito) 2022 ${RRfin}\033[0m"
msg -bar 
echo -e ""
echo -e "${cor[3]} Esta herramienta cambia la contraseña de su servidor vps"
echo -e "${cor[3]} Esta contraseña es utilizada como usuario root"
echo -ne "\033[1;32m Desea Seguir? [S/N]: "; read x
[[ $x = @(n|N) ]] && fun_bar && return
#Inicia Procedimentos
echo -e "${cor[0]} Escriba su nueva contraseña"
read  -p " Nuevo passwd: " pass
(echo $pass; echo $pass)|passwd 2>/dev/null
sleep 1s
fun_bar
echo -e "${cor[3]} Contraseña cambiada con exito!"
echo -e "${cor[2]} Su contraseña ahora es : ${cor[4]}$pass"
return
}

rootpass () {
source <(curl -sSL  ${url[utx]}/root-pass.sh)
}

apa_nginx() {

apt purge apache2 -y 
# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -q -O /etc/nginx/nginx.conf "https://www.dropbox.com/s/0maqn1hpfzxsm43/nginx.conf"
[[ ! -d /var/www/html ]] && mkdir -p /var/www/html
[[ ! -e /var/www/html/index.html ]] && echo "<pre>Setup by @drowkid01</pre>" > /var/www/html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://www.dropbox.com/s/msm14fz2pwnluvg/vps.conf"
/etc/init.d/nginx restart
}
verifi_fun () {
[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChuKK-SCRIPT ${TTcent}VPS ${TTfin}      \033[0m"
echo -e "\033[1;37m  ${RRini} Reseller : $(cat $slogan ) 2023 ${RRfin}\033[0m"
msg -bar 
echo -e ""
echo -e "${cor[3]}       Esta herramienta es Experimental en el vps"
#echo -e "${cor[3]}   comsumira aproximandamente un 5% de Recursos Extra"
echo -e "${cor[3]} Esta Accion Limita el Sobrepaso de USUARIOS del Limiter"
msg -bar 
echo -ne " Desea Seguir? [S/N]: "; read x
[[ $x = @(n|N) ]] && fun_bar && return
echo -e ""
echo " KILL MULTILOGIN PARA SSH / DROPBEAR "
echo -ne " VERIFICANDO SISTEMA......"
if wget ${url[utx]}/killSSH.sh &>/dev/null -O /bin/killssh &>/dev/null ; then
echo -e "${cor[2]} \033[1;32m EXITO \n" && msg -bar 
chmod +x /bin/killssh &>/dev/null 
msg -bar
[[ -e /etc/systemd/system/killadm.service ]] && {
killall kill_drop.sh &>/dev/null
systemctl stop killadm &>/dev/null
systemctl disable killadm &>/dev/null
systemctl daemon-reload &>/dev/null
rm /etc/systemd/system/killadm.service &>/dev/null
rm -rf /bin/killssh &>/dev/null
echo -e "     ${aLerT} ALERTA DE NOTIFICACION ${aLerT}"
echo -e " LIMITADOR KILL MULTILOGIN DESACTIVADO"
msg -bar
} || {
/bin/killssh && echo " EJECUCION EXTOSA"
msg -bar
echo -e '[Unit]
Description=KillLogin Service by @drowkid01
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/killssh &
ExecReload=/bin/killssh
Restart=always
RestartSec=31s

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/killadm.service
systemctl enable killadm &>/dev/null && echo -e "     ${rUlq} AVISO DE NOTIFICACION ${rUlq} " 
systemctl start killadm &>/dev/null && echo -e " \033[1;32m LIMITADOR KILL MULTILOGIN ACTIVADO" || echo -e "  \033[1;31m ERROR AL INICIAR LIMITADOR"
systemctl daemon-reload &>/dev/null
msg -bar
}
else
echo -e "${cor[2]} \033[1;31m FAIL \n" && msg -bar 
sleep 2s
return
fi
read -p " PRESIONA ENTER PARA CONTINUAR" && clear
}

pamcrack () {
echo -e "Liberar passwd para VURTL"
echo -ne "Desea Seguir? [S/N]: "; read x
[[ $x = @(n|N) ]] && fun_bar && return
echo -e ""
fun_bar "service ssh restart"
sed -i 's/.*pam_cracklib.so.*/password sufficient pam_unix.so sha512 shadow nullok try_first_pass #use_authtok/' /etc/pam.d/common-password
fun_bar "service ssh restart"
echo -e ""
echo -e " \033[1;31m[ ! ]\033[1;33mConfiguraciones VURTL aplicadas"  | pv -qL 25
#msg -bar 
return
}


RSLL (){
echo -e " Escriba un nombre para el Redireccionador SSL"
read -p ": " nombressl
echo -e "\033[1;33m Selecione un Puerto De Redirecionamento Interna"
echo -ne "\033[1;37m"
echo -e " Ingresa el Puerto Local de tu VPS (Port a Redireccionar) "
read -p " Local-Port: " portserv
echo -e "\033[1;33m Digite el Puerto SSL, que Va a USAR:"
echo " Ingresa Puerto SSl/TLS a USAR (Recomendado 110-442-444)  "
read -p " Listen-SSL: " portssl
apt install stunnel4 -y
if lsof -Pi :$portssl -sTCP:LISTEN -t >/dev/null ; then
echo "Ya esta en uso ese puerto"
else
echo "[$nombressl] " >> /etc/stunnel/stunnel.conf
echo "cert = /etc/stunnel/stunnel.pem " >> /etc/stunnel/stunnel.conf
echo "accept = $portssl " >> /etc/stunnel/stunnel.conf
echo "connect = 127.0.0.1:$portserv" >> /etc/stunnel/stunnel.conf
sleep 1
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL4 - SSL" | pv -qL 25
echo -e "\033[1;34m ##############################"
service stunnel4 restart 1> /dev/null 2> /dev/null
sleep 1
fi
}

fun7() {
while :
do
clear
[[ -z "$(cat /etc/crontab | grep 'ejecutar')" ]] && _opti="\033[0;31m [OFF]" || _opti="\033[0;31m [\033[0;32mON\033[0;31m]"
[[ -e /etc/systemd/system/killadm.service ]] && lmt="\033[0;31m [\033[0;32mON\033[0;31m] " || lmt="\033[0;31m [OFF]"
[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChumoGH${TTcent}VPS ${TTfin}      \033[0m"
msg -bar 
echo -e "${cor[2]}  ${yYaN}  Menu de Administracion Herramientas BETA  ${yYaN} "
msg -bar 
echo -e "${cor[2]} [0] ${flech} \033[1;31mVolver"
echo -e "${cor[2]} [1] ${flech} \033[1;36mMenu Servicios Protocolos  " #\033[0;32m(#OFICIAL)"
echo -e "${cor[2]} [2] ${flech} \033[1;36mAuto Limpiezas / Optimizacion \033[0;32m(#OFICIAL)$_opti"
echo -e "${cor[2]} [3] ${flech} \033[1;36mCambiar Contraseña ROOT."
echo -e "${cor[2]} [4] ${flech} \033[1;36m#- Soporte TLS 1.3# \033[0;33m( #EXPERIMENTAL )"
echo -e "${cor[2]} [5] ${flech} \033[1;36mMemoria SWAP Particion \033[0;33m( #BETA )"
echo -e "${cor[2]} [6] ${flech} \033[1;35mKILL MULTILOGIN \033[0;33m(#BETA)  $lmt"
echo -e "${cor[2]} [7] ${flech} \033[1;36mFIX SSH -> DROPBEAR ( PORTA :\033[1;34m $(grep 'Port' /etc/ssh/sshd_config | cut -d' ' -f2 | grep -v 'no' | xargs)\033[1;36m ) \033[0;32m(#OFICIAL)"
echo -e "${cor[2]} [8] ${flech} \033[1;34mScript TROJAN (directo) \033[0;32m(#OFICIAL)" #MENU ShadowsocksR \033[1;33m(FIX)
echo -e "${cor[2]} [9] ${flech} \033[1;36mFIX CONTRASEÑA ROOT EN AMAZON & GG CLOUD"
echo -e "${cor[2]} [10] ${flech} \033[1;36mMostrar Trafico Total de VPS \033[0;32m(#OFICIAL)"
echo -e "${cor[2]} [12] ${flech} \033[1;36mDNS Netflix"
echo -e "${cor[2]} [13] ${flech} \033[1;36mFIX SOURCES UBUNTU"
echo -e "${cor[2]} [14] ${flech} \033[1;36mActualizar Zona Horaria  \033[0;32m(#OFICIAL)"
echo -e "${cor[2]} [15] ${flech} \033[1;36mInstalar Go Lang \033[0;32m(#OFICIAL)"
echo -e "${cor[2]} [16] ${flech} \033[1;36mCreador de Payloads By \033[1;31m@RealStrategy  \033[0;33m(#BETA)"
echo -e "${cor[2]} [17] ${flech} \033[1;36mTCP Aceleración (BBR/Plus) \033[0;33m(#BETA)"
echo -e "${cor[2]} [20] ${flech} \033[1;34mFUNCIONES TESTE  \033[0;33m(#BETA) "
###############
msg -bar 
read -p " Escoje : " ppp
case $ppp in
	0)
	clear&&break
	;;
	1)
		clear
		[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChumoGH${TTcent}VPS ${TTfin}      \033[0m"
		echo -e "\033[1;37m  ${RRini} Reseller : $(cat < /bin/ejecutar/menu_credito) 2022 ${RRfin}\033[0m"
		msg -bar 
		echo -e "
		[\033[1;30m1\033[1;33m] REINICIAR SERVICIOS \033[0;32m(#OFICIAL) \033[1;33m
		[\033[1;30m2\033[1;33m] Desinstalacion de SERVICIOS \033[0;32m(#OFICIAL) \033[1;33m
		[\033[1;30m3\033[1;33m] Mostrar Config de SERVICIOS \033[0;32m(#OFICIAL) \033[1;33m
		[\033[1;30m4\033[1;33m] Mostrar SERVICIOS Con mas Consumo \033[0;32m(#OFICIAL) \033[1;33m"
		msg -bar 
		echo -e "[\033[1;30m0\033[1;33m] < REGRESAR \033[1;33m"
		msg -bar 
		read -p ": " opcao
		case $opcao in
		1)reiniciar_ser;;
		2)
		[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    =====>>►► 🐲 New ChumoGH💥VPS 🐲 ◄◄<<=====      \033[0m"
echo -e "\033[1;37m      【      Reseller : $(cat < /bin/ejecutar/menu_credito) - ADM 2022       】\033[0m" 
		echo -e "[\033[1;31m-\033[1;33m]\033[1;31m #######################################\033[1;33m"
		echo -e "\033[1;37mSeleccione una opcion a desinstalar:    Para Salir Ctrl + C\033[1;33m
		[\033[1;30m1\033[1;33m] BADVPN \033[1;33m
		[\033[1;30m2\033[1;33m] FAIL2BAN \033[1;33m
		[\033[1;30m3\033[1;33m] STUNNEL4 $stunel\033[1;33m
		[\033[1;30m4\033[1;33m] WEBMIN \033[1;33m
		[\033[1;30m5\033[1;33m] PYTHON \033[1;33m
		[\033[1;30m6\033[1;33m] SHADOWSOCKS \033[1;33m
		[\033[1;30m7\033[1;33m] DROPBEAR \033[1;33m
		[\033[1;30m8\033[1;33m] OPENVPN \033[1;33m
		[\033[1;30m9\033[1;33m] LIBRERIAS 32BITS \033[1;33m
		[\033[1;30m10\033[1;33m] NGINX \033[1;33m
		[\033[1;30m11\033[1;33m] SQUID \033[1;33m
		[\033[1;30m12\033[1;33m] V2RAY \033[1;33m
		[\033[1;30m13\033[1;33m] V2-UI WEB $v2ui\033[1;33m
		[\033[1;30m14\033[1;33m] TROJAN Go $tojanss\033[1;33m
		[\033[1;30m0\033[1;33m] < REGRESAR \033[1;33m"
		read -p ": " opcao
		case $opcao in
		1)
		removerbadvpn;;
		2)
		removerfail2ban;;
		3)
		removerstunnel;;
		4)
		removerwebmin;;
		5)
		removerpython;;
		6)
		removershadowsocks;;
		7)
		removerdropbear;;
		8)
		removeropenvpn;;
		9)
		removerlibs32;;
		10)
		removernginx;;
		11)
		removersquid;;
		12)
		removerv2ray;;
		13)
		removerv2ui;;
		14)
		removertro;;
		15)
		removetrojan;;
		0)
		;;
		esac
		;;
		3)echo "FUNCION ANULADA";;
		4)mpro;;
		0)return;;
		esac
	;;
	2)autoop;;
	3)cambiopass && break;;
	4)tls13;;
	5)xswap;;
	6)verifi_fun;;
	7)fixssh;;
	8)ssrmenu;;
	9)rootpass;;
	10)mtraff;;
	11)RSLL;;
	12)wget -q -O /tmp/dnsNN.sh ${url[utx]}/dnsNN.sh && chmod +x /tmp/dnsNN.sh && bash /tmp/dnsNN.sh;;
	13)sfix;;
	14)chora;;
	15)goinst;;
	16)crea_pay;;
	17)bbr;;
	18)clash-man;;
	20)fun_teste;;
	esac
done
}


#FUNCIONES

start_menu
unset lang
selection=$(selectw 10)
case ${selection} in
0)
#echo -e "${cor[0]} SALIENDO " | pv -qL 50
killall usercodes > /dev/null 2>&1
killall ferramentas > /dev/null 2>&1
killall menu_inst > /dev/null 2>&1
clear && cd $HOME && exit
;;
1)
clear
${sfile[usr]}
;;
2) clear && ${sfile[frm]} ;;
3)
echo -e "OPTIMIZANDO SERVIDOR"  | pv -qL 80
fun_limpram() {
	sync
	echo 3 >/proc/sys/vm/drop_caches
	sync && sysctl -w vm.drop_caches=3
	sysctl -w vm.drop_caches=0
	swapoff -a
	swapon -a
	[[ -e /etc/v2ray/config.json ]] && v2ray clean 1> /dev/null 2> /dev/null
	rm -rf /tmp/* > /dev/null 2>&1
	killall usercodes > /dev/null 2>&1
	killall ferramentas > /dev/null 2>&1
	killall menu_inst > /dev/null 2>&1
	killall kswapd0 > /dev/null 2>&1
	killall tcpdump > /dev/null 2>&1
	killall ksoftirqd > /dev/null 2>&1
	#echo -e "@drowkid01 " > /var/log/auth.log
	systemctl restart rsyslog.service
	systemctl restart systemd-journald.service
	service dropbear stop > /dev/null 2>&1
	service sshd restart > /dev/null 2>&1
	service dropbear restart > /dev/null 2>&1
	sleep 2
}
function aguarde() {
	sleep 1
	helice() {
		fun_limpram >/dev/null 2>&1 &
		tput civis
		while [ -d /proc/$! ]; do
			for i in / - \\ \|; do
				sleep .1
				echo -ne "\e[1D$i"
			done
		done
		tput cnorm
	}
	echo -ne "\033[1;37mOPTIMIZANDO MEMORIA \033[1;32mRAM \033[1;37me \033[1;32mSWAP\033[1;32m.\033[1;33m.\033[1;31m. \033[1;33m"
	helice
	echo -e "\e[1DOk"
}
aguarde
;;
4)
remover_adm
exit
;;
6)
funcao_verificacao
;;
7)
fun7
;;
8)
if [[ -e /etc/bash.bashrc-bakup ]]; then
mv -f /etc/bash.bashrc-bakup /etc/bash.bashrc
cat /etc/bash.bashrc | grep -v "/bin/adm" > /tmp/bash
mv -f /tmp/bash /etc/bash.bashrc
msg -bar 
echo -e "${cor[2]} \033[1;32m AUTOEJECUCION DESACTIVADA"  | pv -qL 30
msg -bar 
elif [[ -e /etc/bash.bashrc ]]; then
cat /etc/bash.bashrc|grep -v /bin/cgh > /etc/bash.bashrc.2
echo '/bin/adm' >> /etc/bash.bashrc.2
cp /etc/bash.bashrc /etc/bash.bashrc-bakup
mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
echo 'cgh' > /bin/adm
chmod +x /bin/adm
msg -bar 
echo -e "${cor[2]} \033[1;32mAUTOEJECUCION ACTIVADA"  | pv -qL 30
msg -bar 
fi
;;
9) ${sfile[minst]}
;;
10)
fun_atualizar
;;
esac
$(pwd)/menu.sh
