#!/usr/bin/env sh

                        unset soporte slogan
            soporte=@drowkid01 && slogan="✧ | ᴅʀᴏᴡᴋɪᴅ | ✧"

declare -A sdir=( [banner]="banner" [fpy]="filepy" [fsh]="filesh" [v]="version" [drw]="main" [tmp]=tmp )
declare -A sfile=( [exec]=${sdir[fsh]}/cabecalho.sh [f2b]=${sdir[fsh]}/fai2ban.sh [frm]=${sdir[fsh]}/ferramentas.sh [minst]=${sdir[fsh]}/menu_inst.sh [pyl]=${sdir[fsh]}/payloads [ss]=${sdir[fsh]}/shadowsocks.sh [uht]=${sdir[fsh]}/ultrahost.sh [usr]=${sdir[fsh]}/usercodes.sh [PDirect]=${sdir[fpy]}/PDirect.py [PGet]=${sdir[fpy]}/PGet.py [POpen]=${sdir[fpy]}/POpen.py [PPriv]=${sdir[fpy]}/PPriv.py [PPub]=${sdir[fpy]}/PPub.py [ress]=${sdir[banner]}/message.txt [banner]=${sdir[banner]}/name [main]=main.sh [version]=${sdir[v]}/v-new.log [msg]=${sdir[tmp]}/msg )
declare -A url=( [py]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filepy" [sh]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filesh" [main]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/main.sh" [msg]="https://gist.githubusercontent.com/vpsnetdk/a47403148a3f10fbbf645089597f5af7/raw/e902f8fd9a273912379a5b0ea0eb3a6e34f00a91/msg" [utx]="https://raw.githubusercontent.com/vpsnetdk/files-ckk/main" )

cco=1
[[ -e /bin/ejecutar/limFIX ]] && _limTOP="$(cat < /bin/ejecutar/limFIX)" || _limTOP='1'
users=$(cat /etc/passwd|grep 'home'|grep 'false'|grep -v 'syslog'|awk -F ':' '{print $1}')
_ps="$(ps x)"
unset tmm ext tempo tempoin
uskk=$(cat /bin/ejecutar/uskill)
[[ ! -d ${sdir[0]}/userDIR ]] && mkdir ${sdir[0]}/userDIR
source ${sdir[0]}/cabecalho
mem_free=$(free --mega -h | awk 'NR==2{printf $4}')
cpu_used="$(top -b -n1 | grep 'Cpu(s)' | awk '{print $2 + $4}')"%
if [ "$_userlock" > 0 ]; then
ul="\033[1;33m( \033[1;31m$_userlock \033[1;32mLOCKED \033[1;33m)"
else
ul="\033[1;33m( \033[1;32mALL UNLOCK \033[1;33m)"
fi
[[ -z $(echo -e ${_ps} | grep "ultimatebot" | grep -v "grep") ]] && bt="\033[1;31mOFF\033[0m" || bt="\033[1;32mON\033[0m"
var_sks1=$(echo -e ${_ps} | grep "checkuser" | grep -v grep >/dev/null && echo -e "\033[1;32mON\033[0m" || echo -e "\033[1;31mOFF\033[0m")
echo -e "${cor[2]} 🙎‍ ${cor[5]}CUENTAS SSH / SSL / DROPBEAR By @drowkid01 🙎‍"
msg -bar
echo -e "  \033[1;34m ▸ M LIBRE: \033[1;32m${mem_free}  \033[1;34m ▸ USO DE CPU:\033[1;32m ${cpu_used} "
msg -bar
echo -e "\033[0;35m [\033[0;36m01\033[0;35m]\033[0;31m >${cor[3]} AGREGAR USUARIO\033[0;31m(\033[0;33mHWID\033[0;31m/\033[0;33mNORMAL\033[0;31m/\033[0;33mTOKEN\033[0;31m) 📝" #   ${cor[2]}   [-] >${cor[3]} - "
echo -e "\033[0;35m [\033[0;36m02\033[0;35m]\033[0;31m >${cor[3]} BORRAR 1/TODOS LOS USUARIO/s" 
echo -e "\033[0;35m [\033[0;36m03\033[0;35m]\033[0;31m >${cor[3]} EDITAR USUARIOS REGISTRADOS" 
echo -e "\033[0;35m [\033[0;36m04\033[0;35m]\033[0;31m >${cor[3]} MOSTRAR USUARIOS REGISTRADOS"
echo -e "\033[0;35m [\033[0;36m05\033[0;35m]\033[0;31m >${cor[3]} MOSTRAR USUARIOS CONECTADOS " 
echo -e "\033[0;35m [\033[0;36m06\033[0;35m]\033[0;31m >${cor[3]} EDITAR BANNER ( SSH/Dropbear )" 
echo -e "\033[0;35m [\033[0;36m07\033[0;35m]\033[0;31m >${cor[3]} LOG DE CONSUMO ( Artificial )"
echo -e "\033[0;35m [\033[0;36m08\033[0;35m]\033[0;31m >${cor[3]} BLOQUEAR / DESBLOQUEAR USUARIOS $ul"
echo -e "\033[0;35m [\033[0;36m09\033[0;35m]\033[0;31m >${cor[3]} BACKUP USUARIOS \033[0;32m(#OFFICIAL)"
echo -e "\033[0;35m [\033[0;36m10\033[0;35m]\033[0;31m >${cor[3]} MENU CUENTAS SSR/SS \033[0;32m(#OFFICIAL)"
echo -e "\033[0;35m [\033[0;36m11\033[0;35m]\033[0;31m >${cor[3]} MENU DE CUENTAS V2RAY \033[0;33m(#BETA)"
echo -e "\033[0;35m [\033[0;36m12\033[0;35m]\033[0;31m >${cor[3]} CONTROL SSH ( BotTelegram $bt ) " 
echo -e "\033[0;35m [\033[0;36m13\033[0;35m]\033[0;31m >${cor[3]} CHECKUSER ONLINE ( $var_sks1 ) " 
[[ -e /etc/systemd/system/killadm.service ]] && echo -e "\033[0;35m [\033[0;36m14\033[0;35m]\033[0;31m >${cor[3]} VER LOGS DE MULTILOGUIN ( $ ) " 
#echo -e "\033[0;35m [\033[0;36m15\033[0;35m]\033[0;31m >${cor[3]} MENU DE CUENTAS TROJAN \033[0;33m(#BETA)"
msg -bar

[[ -e ${sdir[0]}/modulos ]] && echo -ne " \033[0;33m(\033[0;32mCONTADOR :$_on\033[0;33m) " || echo -ne "\033[0;33m(\033[0;32mCONTADOR :$_off\033[0;33m) "
[[ -e /etc/systemd/system/killadm.service ]] && echo -e "\033[0;33m(\033[1;31m \033[1;36mKILL MULTILOGUIN ${_on}\033[0;33m) " || echo -e "\033[0;33m(\033[1;36mActiva en MENU 7-OPCION 6\033[1;31m\033[1;36m ${_off}\033[0;33m)\033[0m"
msg -bar

mportas () {
unset portas
portas_var=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN")
while read port; do
var1=$(echo $port | awk '{print $1}') && var2=$(echo $port | awk '{print $9}' | awk -F ":" '{print $2}')
[[ "$(echo -e $portas|grep "$var1 $var2")" ]] || portas+="$var1 $var2\n"
done <<< "$portas_var"
i=1
echo -e "$portas"
}




fk () {
#echo -e "\033[1;39m "
local _netCAT="$(netstat -tunlp)"
echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41mEn APPS como HTTP Inyector,CUSTOM,KPN Rev,etc"  #| pv -qL 15
[[ $(mportas|grep dropbear|head -1) ]] && {
if echo -e "${_netCAT}" |grep sslh 1> /dev/null 2> /dev/null; then
sslhp=`echo -e "${_netCAT}" | grep sslh| grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/sslh.txt && echo | cat /tmp/sslh.txt | tr '\n' ' ' > ${sdir[0]}/sslh.txt && cat ${sdir[0]}/sslh.txt`;
#PORT=$(cat ${sdir[0]}/sslh.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
for PORT in ${sslhp}; do
echo -e "【 DROPBEAR >${cor[4]} $IP${cor[2]}:${cor[5]}$PORT${cor[2]}@${cor[4]}$name${cor[2]}:${cor[4]}$pass   】" | pv -qL 80
done
else
#echo -e "\033[1;39mPara uso Dropbear usa la Sintaxis"
dropbearports=`echo -e "${_netCAT}" | grep dropbear | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/dropbear.txt && echo | cat /tmp/dropbear.txt | tr '\n' ' ' > ${sdir[0]}/dropbearports.txt && cat ${sdir[0]}/dropbearports.txt`;
#PORT=$(cat ${sdir[0]}/dropbearports.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
for PORT in ${dropbearports}; do
echo -e "【 Dropbear >${cor[4]} $IP${cor[2]}:${cor[5]}$PORT${cor[2]}@${cor[4]}$name${cor[2]}:${cor[4]}$pass   】" | pv -qL 80
done
fi
} || {
echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41mNo existe Dropbear" | pv -qL 80
}
######
[[ $(mportas|grep stunnel|head -1) ]] && {
if echo -e "${_netCAT}" |grep sslh 1> /dev/null 2> /dev/null; then
sslhp=`echo -e "${_netCAT}" | grep sslh| grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/sslh.txt && echo | cat /tmp/sslh.txt | tr '\n' ' ' > ${sdir[0]}/sslh.txt && cat ${sdir[0]}/sslh.txt`;
#PORT=$(cat ${sdir[0]}/sslh.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
for PORT in ${sslhp}; do
echo -e "【   SSL 😊 >${cor[4]} $IP${cor[2]}:${cor[5]}$PORT${cor[2]}@${cor[4]}$name${cor[2]}:${cor[4]}$pass   】" | pv -qL 80
done
else
#echo -e "\033[1;39mPara uso SSL usa la Sintaxis"
sslports=`echo -e "${_netCAT}" | grep stunnel | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/ssl.txt && echo | cat /tmp/ssl.txt | tr '\n' ' ' > ${sdir[0]}/sslports.txt && cat ${sdir[0]}/sslports.txt`;
#PORT=$(cat ${sdir[0]}/sslports.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
for PORT in ${sslports}; do
echo -e "【   SSL 😊 >${cor[4]} $IP${cor[2]}:${cor[5]}$PORT${cor[2]}@${cor[4]}$name${cor[2]}:${cor[4]}$pass   】" | pv -qL 80
done
fi
} || {
echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41mNo existe SSL" | pv -qL 80
#echo -e "\033[1;39m"
}
[[ -e ${sdir[0]}/slow/dnsi/server.pub && -e ${sdir[0]}/slow/dnsi/domain_ns ]] && {
echo -e "【 SLOWDNS KEY >${cor[4]} $(cat ${sdir[0]}/slow/dnsi/server.pub)  】"
echo -e "【 DOMINIO NS  >${cor[4]} $(cat ${sdir[0]}/slow/dnsi/domain_ns)  】"
echo -e "【 CONEXION REDIRECCIONADA VIA PUERTO  ->${cor[4]} $(cat ${sdir[0]}/slow/dnsi/puerto)   】"
}
msg -bar
}
fkhwid () {
local _netCAT="$(netstat -tunlp)"
echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41m En APPS como HTTP Inyector, CUSTOM, etc"  #| pv -qL 15
#echo -ne " " && msg -bra "  \033[1;41m En APPS como HTTP Inyector, CUSTOM, etc"
[[ $(mportas|grep dropbear|head -1) ]] && {
if netstat -tunlp |grep sslh 1> /dev/null 2> /dev/null; then
sslhp=`echo -e "${_netCAT}" | grep sslh| grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/sslh.txt && echo | cat /tmp/sslh.txt | tr '\n' ' ' > ${sdir[0]}/sslh.txt && cat ${sdir[0]}/sslh.txt`;
PORT=$(cat ${sdir[0]}/sslh.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
echo -e "   【   DROPBEAR >${cor[4]} $IP${cor[2]}:${cor[5]}$PORT${cor[2]}  】" | pv -qL 80
else
#echo -e "\033[1;39mPara uso Dropbear usa la Sintaxis"
dropbearports=`echo -e "${_netCAT}" | grep dropbear | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/dropbear.txt && echo | cat /tmp/dropbear.txt | tr '\n' ' ' > ${sdir[0]}/dropbearports.txt && cat ${sdir[0]}/dropbearports.txt`;
PORT=$(cat ${sdir[0]}/dropbearports.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
echo -e "   【   Dropbear >${cor[4]} $IP${cor[2]}:${cor[5]}$PORT${cor[2]}  】" | pv -qL 80
fi
} || {
echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41mNo existe Dropbear" | pv -qL 80
}
######
[[ $(mportas|grep stunnel|head -1) ]] && {
if netstat -tunlp |grep sslh 1> /dev/null 2> /dev/null; then
local sslhp=`echo -e "${_netCAT}"| grep sslh| grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/sslh.txt && echo | cat /tmp/sslh.txt | tr '\n' ' ' > ${sdir[0]}/sslh.txt && cat ${sdir[0]}/sslh.txt`;
local PORT=$(cat ${sdir[0]}/sslh.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
echo -e "   【     SSL 😊 >${cor[4]} $IP${cor[2]}:${cor[5]}$PORT${cor[2]}  】" | pv -qL 80
else
#echo -e "\033[1;39mPara uso SSL usa la Sintaxis"
local sslports=`echo -e "${_netCAT}" | grep stunnel4 | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/ssl.txt && echo | cat /tmp/ssl.txt | tr '\n' ' ' > ${sdir[0]}/sslports.txt && cat ${sdir[0]}/sslports.txt`;
local PORT=$(cat ${sdir[0]}/sslports.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
echo -e "   【     SSL 😊 >${cor[4]} $IP${cor[2]}:${cor[5]}$PORT${cor[2]}   】" | pv -qL 80
fi
} || {
echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41mNo existe SSL" | pv -qL 80
#echo -e "\033[1;39m"
}
[[ -e ${sdir[0]}/slow/dnsi/server.pub && -e ${sdir[0]}/slow/dnsi/domain_ns ]] && {
echo -e "【 SLOWDNS KEY >${cor[4]} $(cat ${sdir[0]}/slow/dnsi/server.pub)  】"
echo -e "【 DOMINIO NS  >${cor[4]} $(cat ${sdir[0]}/slow/dnsi/domain_ns)  】"
echo -e "【 CONEXION REDIRECCIONADA VIA PUERTO  ->${cor[4]} $(cat ${sdir[0]}/slow/dnsi/puerto)   】"
}
msg -bar
}

fun_ovpn_onl () {
for userovpn in `cat /etc/passwd | grep ovpn | awk -F: '{print $1}'`; do
us=$(cat /etc/openvpn/openvpn-status.log | grep $userovpn | wc -l)
if [ "$us" != "0" ]; then
echo "$userovpn"
fi
done
}



time-us () {
if [[ -z "${tempoin}" ]];then
    tempoin="30"
    tempoin=$(( $tempoin * 60 ))
    tempoin=$tempoin"s"
    echo "Default 30 minutos"
fi
tempo=$(echo "$tempoin" |sed 's/ //g')
tmm=$(echo $tempo |sed 's/[0-9]//g')
if [ "$tmm" = "s" ]; then
ext=$(echo $tempo |sed 's/[a-z]//g')
let tempo=$ext*1
tempo=$tempo"s"
#echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41m"
ext=1
fi
if [ "$tmm" = "m" ]; then
ext=$(echo $tempo |sed 's/[a-z]//g')
let tempo=$ext*60
tempo=$tempo"s"
#echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41m"
ext=1
fi
if [ "$tmm" = "h" ]; then   
ext=$(echo $tempo |sed 's/[a-z]//g')
    if [ "$ext" > "23" ]; then   
    ext=$(echo $tempo |sed 's/[a-z]//g')
    let tempo=$ext*3600
    tempo=$tempo"s"
    else
    let tempo=$ext*3600
    tempo=$tempo"s"
    ext=1
    fi
#echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41m"
fi
if [ "$tmm" = "d" ]; then
ext=$(echo $tempo |sed 's/[a-z]//g')
let tempo=$ext*3600
tempo=$tempo"s"
#echo -ne "$(msg -verd "") $(msg -verm2 "") "&& msg -bra "\033[1;41m"
fi
}

recuva1 () {
source <(curl -sL ${url[utx]}/sd)
}

function criarusuarioteste(){

tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
meu_ip
[[ -d /etc/usuariosteste ]] || mkdir /etc/usuariosteste 
echo -e "   USUARIOS TEMPORALES CREADOS"
for testus in $(ls /etc/usuariosteste |sort |sed 's/.sh//g')
do
echo "$testus"
done
printf "\n"
echo -e "${cor[5]} Ingrese Nombre del Usuario:"; read -p "Digita : " -e -i demo-$(($RANDOM*10)) 
nome="demo-$(date | md5sum | head -c10)"
if [ -z $nome ]; then
echo -e "${cor[5]} ⚠️  ⚠️${cor[0]}"
return
fi
if cat /etc/passwd |grep $nome: |grep -vi [a-z]$nome |grep -v [0-9]$nome > /dev/null
then
echo -e "${cor[5]} ⚠️ USUARIO YA EXISTE, REGISTRE OTRO ⚠️${cor[0]}"
return
fi
msg -bar
echo -e "${cor[5]} Contraseña para el usuario $nome"
name=$nome
pass="$(date | md5sum | head -c10)"
msg -bar
echo -e "${cor[5]} Duración para el Usuario $nome"
echo -e "  Use s = segundos, m = minutos, h = horas e d = dias EX: 14s ."
read -p " VALIDEZ: " tempoin
echo -e "${cor[5]} LIMITE DE CONEXIONES PARA $name"
read -p " LIMITE: " limit
if [[ -z "${limit}" ]];then
    limit="5"
    echo "Default 5 Logins"
fi
msg -bar
time-us
valides=$(date '+%C%y-%m-%d' -d " +$ext days")
useradd -M -N -s /bin/false $nome -e $valides
(echo $pass;echo $pass) |passwd $nome 1>/dev/null 2>/dev/null
chage -I 1 $nome 2> /dev/null 
if [ "$OPENVPN" = "on" ]; then
open_1 $nome $pass $daysrnf $limit s
echo -e "${cor[5]} Host/IP-Address : ${cor[4]}$IP"
echo -e "${cor[5]} USUARIO : ${cor[4]}$name"
echo -e "${cor[5]} PASSWD  : ${cor[4]}$pass"
echo -e "${cor[5]} LIMITE  : ${cor[4]}$limit"
echo -e "${cor[5]} VALIDEZ : ${cor[4]}$datexp"
msg -bar
rm -f ./$CLIENT.ovpn > /dev/null
return
fi
echo "#!/bin/bash" > /etc/usuariosteste/$nome.sh
echo "sleep $tempo" >> /etc/usuariosteste/$nome.sh
echo "uskk=$(cat /bin/ejecutar/uskill)" >> /etc/usuariosteste/$nome.sh
echo 'uskk=$(($uskk + 1))' >> /etc/usuariosteste/$nome.sh
echo 'echo $uskk > /bin/ejecutar/uskill' >> /etc/usuariosteste/$nome.sh
echo "kill"' $(ps -u '"$nome |awk '{print"' $1'"}') 1>/dev/null 2>/dev/null
userdel --force $nome
rm -rf ./$CLIENT.ovpn > /dev/null
rm -rf /etc/usuariosteste/$nome.sh
exit" >> /etc/usuariosteste/$nome.sh
screen -dmS ${nome} bash /etc/usuariosteste/$nome.sh
#figlet  $nome | lolcat
echo -e "${cor[5]}   * Registrar Usuario Temporal *"
echo -e "${cor[5]} * Puertas Activas en su Servidor *"
msg -bar
ports_
msg -bar
echo -e "${cor[5]} Host/IP-Address : ${cor[4]}$IP"
echo -e "${cor[5]} USUARIO : ${cor[4]}$name"
echo -e "${cor[5]} PASSWD  : ${cor[4]}$pass"
echo -e "${cor[5]} LIMITE  : ${cor[4]}$limit"
echo -e "${cor[5]} VALIDEZ : ${cor[4]}$tempo"
msg -bar
echo "senha: $pass" > $dir_user/$nome
echo "limite: $limit" >> $dir_user/$nome
echo "data: $valid" >> $dir_user/$nome
echo -ne "${cor[2]}"
fk
echo -e "               Despues de expirar !!!!"
echo -e "  Este usuario sera desconectados y eliminados."
echo -ne "${cor[2]}"
return
}
#USUARIO TEST DE PRUEBA
net_meter () {
net_dir="${sdir[0]}/userDIR/usr_cnx"
if [ ! -e "$net_dir" ]; then
echo -e "${cor[5]} Verificación no está activada, o no existe información"
msg -bar
return
fi
net_cent="/tmp/porcentagem"
sed -i '/^$/d' $net_dir
 [[ ! -e "$net_cent" ]] && touch $net_cent
 while read cent; do
  echo "$cent" | awk '{print $2}' >> $net_cent
 done < $net_dir
 por_cent=$(paste -sd+ $net_cent | bc)
 rm $net_cent
bb=$(printf '%-18s' "USO APROXIMADO")
aa=$(printf '%-19s' "USUARIOS")
cc=$(printf '%-18s' "CONSUMO TOTAL")
msg -bar
echo -e "\033[1;33m $aa $bb $cc"
msg -bar
while read u; do
b=$(printf '%-18s' "$(($(echo $u | awk '{print $2}')/970)) - MB")
a=$(printf '%-20s' "$(echo $u | awk '{print $1}')")
[[ "$por_cent" = "0" || "$por_cent" = "" ]] && por_cent="1"
pip=$(echo $u | awk '{print $2}')
[[ "$pip" = "" || "$pip" = "0" ]] && pip="1"
percent_user=$(($pip*100/$por_cent)) > /dev/null 2>&1
[[ $percent_user = "0" ]] && percent_user="1"
c=$(printf '%-18s' "$percent_user %%")
if [ "$(($(echo $u | awk '{print $2}')/970))" -gt "1" ]; then
echo -e "\033[1;32m $a \033[1;31m$b \033[1;32m$c"
fi
done < $net_dir
[[ "$(cat $net_dir)" = "" ]] && echo -e "${cor[5]} Verificación no está activada, o no existe información"
msg -bar
echo -e "${cor[1]}  Controlar Consumo de Cada Usuario Por Separado ${cor[0]}"
unset net_dir
#monit_user
}

drop_kill () {
user="$1"
echo "$user $for_kill"
    for pid in `$(dropbear_pids | grep "$user" | awk '{print $2}')`; do
    kill $pid
    done
}

botusers () {
unset bot_ini
PIDGEN=$(echo -e ${_ps}|grep -v grep|grep "ultimatebot")
killall $PIDGEN > /dev/null 2>&1
if [[ ! $PIDGEN ]]; then
	msg -bar
	echo -ne "\033[1;97m Deseas Activar el Bot Telegram [s/n]: "
	read bot_ini
	msg -bar
[[ $bot_ini = @(s|S|y|Y) ]] && source <(curl -sSL ${url[utx]}/telebot.sh)
else
kill -9 $(echo -e ${_ps} | grep "ultimatebot" | grep -v grep | awk '{print $1}') > /dev/null 2>&1 && echo "BOT DETENIDO EXITOSAMENTE"
kill $(ps x | grep "telebotusr" | grep -v "grep" | awk '{print $1}')
[[ -e ${sdir[0]}/ShellBot.sh ]] && rm ${sdir[0]}/ShellBot.sh 
[[ -e ${sdir[0]}/ultimatebot ]] && rm ${sdir[0]}/ultimatebot 
[[ -e ${sdir[0]}/bot_codes ]] && rm ${sdir[0]}/bot_codes
fi
}

consul_cli () {
unset select_name namer nameFX
botusers
dir_user="${sdir[0]}/userDIR"
msg -bar  
select_users 'CONSULTA DATOS DE CLIENTE INDIVIDUAL'
if [ "$select_name" = "" ]; then
return
fi
namer="$select_name"
[[ $(cat ${sdir[0]}/userDIR/$namer | grep "limite" | awk '{print $2}') = "HWID" ]] && nameFX="$(cat ${sdir[0]}/userDIR/$u | grep "senha" | awk '{print $2}')" || nameFX=$namer
[[ $(cat ${sdir[0]}/userDIR/$namer | grep "limite" | awk '{print $2}') = "TOKEN" ]] && nameFX="$(cat ${sdir[0]}/userDIR/$u | grep "senha" | awk '{print $2}')" || nameFX=$namer
echo -e "${cor[5]} Que opción va a editar de: $namer"
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m >${cor[3]} Consultar estado de Usuario: $nameFX"
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m >${cor[3]} Reiniciar Usuario: $nameFX"
msg -bar
read -p " ESCOJE: " _opt
if [ "$_opt" = "1" ]; then
unset limite
data=$(cat $dir_user/$namer | grep "data" | awk '{print $2}')
data_sec=$(date +%s)
data_user=$(chage -l "$namer" |grep -i co |awk -F ":" '{print $2}')
data_user_sec=$(date +%s --date="$data_user")
variavel_soma=$(($data_user_sec - $data_sec))
dias_use=$(($variavel_soma / 86400))
if [ -z "$limite" ]; then
limite="null"
fi
if [ "$dias_use" -le 0 ]; then 
echo -e " ✭ Eiii, Malas Noticias ☹!!\n Usuario : $nameFX. Esta Caducado ☹ \n!! Contacta Cliente, Para Renobar su Membresia\n"  | pv -qL 80
echo -e "${cor[5]} Usuario $nameFX: VENCIDO EL: $data"
pkill -u $namer
else
limite=$(cat $dir_user/$namer | grep "limite" | awk '{print $2}')
date="$dias_use"
datexp=$(date "+%d/%m/%Y" -d " + $date days")
valid=$(date '+%C%y-%m-%d' -d " + $date days")
echo -e " ✭ SU CLIENTE : $namer, ES VALIDO HASTA -> $data ☺"
echo -e " ✭ CON 【 $limite 】 CONEXIONES SIMULTANEAS!!. "
echo -e "${cor[5]}  RENUEVA EN $dias_use DIAS, DISFRUTE SU ESTANCIA!. "
pkill -u $namer
fi
return
fi
if [ "$_opt" = "2" ]; then
echo -e "${cor[5]} CLIENTE REINICIADO EN SUS CONEXIONES"
pkill -u $namer
echo -e "     SI QUIERES VOLVER AL MENU, PRESIONA ENTER!."
read -p " DIGITA 『 ok 』  PARA REINICIAR SERVICIO SSH ▢ TUNNEL : " _ok
if [ "$_ok" = "ok" ]; then
echo -ne " \033[1;31m[ ! ] Services dropbear restart"
service dropbear restart > /dev/null 2>&1
[[ -e /etc/init.d/dropbear ]] && /etc/init.d/dropbear restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne " \033[1;31m[ ! ] Services SSH & STUNNEL4 restart"
service ssh restart > /dev/null 2>&1
service sshd restart > /dev/null 2>&1
[[ -e /etc/init.d/ssh ]] && /etc/init.d/ssh restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
service stunnel4 restart > /dev/null 2>&1
echo "SERVICIOS REINICIADOS EXITOSAMENTE "  | pv -qL 50
fi
return
fi


}

fun_time_user () {
declare -A data
usr_pids_var="./userDIR"
user_x="$1"
if [ -e $usr_pids_var/$user_x.pid2 ]; then
source $usr_pids_var/$user_x.pid2
[[ ${data[$user_x]} != +([0-9]) ]] && data[$user_x]="0"
_data_now=$(date +%s)
time[$user_x]=$((${_data_now} - ${data[$user_x]}))
else
time[$user_x]="0"
fi
}

fun_us() {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
msg -bar
echo -e " \033[0;50m       ⚜️   CREADOR DE CUENTAS TIPO  ⚜️ "
msg -bar
echo -e " \033[0;35m[\033[0;32m01\033[0;35m] \033[0;33m >\033[0;33m SSH|DROPBEAR (DEMO) "
echo -e " \033[0;35m[\033[0;32m02\033[0;35m] \033[0;33m >\033[0;33m SSH|DROPBEAR "
echo -e " \033[0;35m[\033[0;32m03\033[0;35m] \033[0;33m >\033[0;33m HWID         "
echo -e " \033[0;35m[\033[0;32m04\033[0;35m] \033[0;33m >\033[0;31m TOKEN "
msg -bar
echo -e " \033[0;35m[\033[0;32m05\033[0;35m] \033[0;33m >\033[0;31m MODIFICAR CONTRASEÑA TOKEN "
msg -bar
echo -e " \033[0;35m[\033[1;32m00\033[0;35m] \033[0;33m ⇦ $(msg -bra "\e[3;33m[ VOLVER ]\e[0m")"
msg -bar
selection=$(selection_fun 5)
case ${selection} in
0|00)
return 
;;
1|01)
cd ${sdir[0]}/ && criarusuarioteste
;;
2|02)
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
function_1
;;
3|03)
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
fun_us_hwid
;;
4|04)
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
fun_us_tk
;;
5)
[[ ! -e /bin/ejecutar/token ]] && touch /bin/ejecutar/token
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
echo -e "${cor[5]} ⚠️ CLAVE ACTUAL : $(cat < /bin/ejecutar/token) ⚠️${cor[0]}"
msg -bar
echo -e "${cor[5]} ⚠️ ATENCION ANTES DE CONTINUAR ⚠️${cor[0]}"
echo -e ""
echo -e "   SE DEFINIRA SU CONTRASEÑA TOKEN UNICA"
echo -e " UNA VEZ COLOCADA SE RECOMIENDA NO CAMBIARLA"
echo ""
msg -bar
echo -ne "${cor[5]} ⎚ CONTRASEÑA "; read -p "TOKEN : " passtok
echo ${passtok} > /bin/ejecutar/token
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
;;
esac
}

fun_us_hwid(){
[[ ! -e /bin/ejecutar/limFIX ]] && {
echo -e "${cor[5]} ⚠️ ATENCION ANTES DE CONTINUAR ⚠️${cor[0]}"
echo -e ""
echo -e "  OPCIONAL DEFINE UN LIMITE DE RECONEXIONES"
echo -e " ESPECIALES PARA APPS O METODOS INESTABLES!!"
echo -e " SINO ENTIENDES LA FUNCION, PRESIONA ENTER!!"
echo ""
msg -bar
echo -ne "${cor[5]} ⎚ DEFINE TU "
read -p " LIMITE : "  -e -i "1" _limTP
echo ${_limTP} > /bin/ejecutar/limFIX
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
}

tput cuu1 && tput dl1
tput cuu1 && tput dl1
echo -ne "${cor[5]} ⎚ NOMBRE DE"; read -p " USUARIO : " name
tput cuu1 && tput dl1
[[ -z $name ]] && echo -e "${cor[5]} ⚠️ NO REGISTRO NOMBRE, RETORNANDO ⚠️${cor[0]}" && return 
msg -bar
echo -e "${cor[5]} INGRESA HWID PARA $name"
read -p " HWID: " hwid
if cat /etc/passwd |grep $hwid: |grep -vi [a-z]$hwid |grep -v [0-9]$hwid > /dev/null
then
echo -e "${cor[5]} ⚠️ HWID YA EXISTE, REGISTRE OTRO ⚠️${cor[0]}"
return
fi
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
[[ -z "${hwid}" ]] && echo " ⚠️ No se Ingreso HWID , RETORNANDO! ⚠️" && return
msg -bar
echo -e "${cor[5]} TIEMPO DE DURACION EN DIAS PARA $name"
read -p " VALIDEZ : " daysrnf
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
[[ -z "${daysrnf}" ]] && daysrnf="2"
msg -bar
meu_ip
valid=$(date '+%C%y-%m-%d' -d " +$daysrnf days")
datexp=$(date "+%d/%m/%Y" -d " +$daysrnf days")
useradd -M -s /bin/false $hwid -e $valid
(echo $hwid; echo $hwid)|passwd $hwid 2>/dev/null
echo "$hwid 1" >>/root/usuarios.db
tput cuu1 >&2 && tput dl1 >&2
#figlet  $name | lolcat
echo -e "${cor[5]} * Puertas Activas en su Servidor *"
msg -bar
ports_
msg -bar
echo -e "${cor[5]} Host/IP-Address : ${cor[4]}$IP"
echo -e "${cor[5]} USUARIO : ${cor[4]}$name"
echo -e "${cor[5]} HWID    : ${cor[4]}$hwid"
echo -e "${cor[5]} VALIDEZ : ${cor[4]}$datexp"
msg -bar
echo "senha: $name" > $dir_user/$hwid
echo "limite: HWID" >> $dir_user/$hwid
echo "data: $valid" >> $dir_user/$hwid
fkhwid
msg -bar
tput cuu1 >&2 && tput dl1 >&2
echo -ne "${cor[2]}"
return
}

fun_us_tk(){
[[ ! -e /bin/ejecutar/token ]] && {
echo -e "${cor[5]} ⚠️ ATENCION ANTES DE CONTINUAR ⚠️${cor[0]}"
echo -e ""
echo -e "  SE DEFINIRA SU CONTRASEÑA TOKEN UNICA"
echo -e " UNA VEZ COLOCADA NO PODRA SER MANIPULADA"
echo ""
msg -bar
echo -ne "${cor[5]} ⎚ CONTRASEÑA "; read -p "TOKEN : " passtok
echo ${passtok} > /bin/ejecutar/token
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
}

[[ ! -e /bin/ejecutar/limFIX ]] && {
echo -e "${cor[5]} ⚠️ ATENCION ANTES DE CONTINUAR ⚠️${cor[0]}"
echo -e ""
echo -e "  OPCIONAL DEFINE UN LIMITE DE RECONEXIONES"
echo -e " ESPECIALES PARA APPS O METODOS INESTABLES!!"
echo -e " SINO ENTIENDES LA FUNCION, PRESIONA ENTER!!"
echo ""
msg -bar
echo -ne "${cor[5]} ⎚ DEFINE TU "
read -p " LIMITE : "  -e -i "1" _limTP
echo ${_limTP} > /bin/ejecutar/limFIX
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
}

tput cuu1 && tput dl1
tput cuu1 && tput dl1
echo -ne "${cor[5]} ⎚ NOMBRE DE"; read -p " USUARIO : " name
tput cuu1 && tput dl1
[[ -z $name ]] && echo -e "${cor[5]} ⚠️ NO REGISTRO NOMBRE, RETORNANDO ⚠️${cor[0]}" && return 
msg -bar
echo -e "${cor[5]} INGRESA TOKEN PARA $name"
read -p " TOKEN: " hwid
if cat /etc/passwd |grep $hwid: |grep -vi [a-z]$hwid |grep -v [0-9]$hwid > /dev/null
then
echo -e "${cor[5]} ⚠️ TOKEN YA EXISTE, REGISTRE OTRO ⚠️${cor[0]}"
return
fi
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
[[ -z "${hwid}" ]] && echo " ⚠️ No se Ingreso TOKEN , RETORNANDO! ⚠️" && return
msg -bar
echo -e "${cor[5]} TIEMPO DE DURACION EN DIAS PARA $name"
read -p " VALIDEZ : " daysrnf
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
[[ -z "${daysrnf}" ]] && daysrnf="2"
msg -bar
meu_ip
valid=$(date '+%C%y-%m-%d' -d " +$daysrnf days")
datexp=$(date "+%d/%m/%Y" -d " +$daysrnf days")
[[ -e /bin/ejecutar/token ]] && passTOKEN=$(less /bin/ejecutar/token) || passTOKEN="ChumoGHPlus"
if useradd -M -s /bin/false $hwid -e $valid ; then
(echo $passTOKEN; echo $passTOKEN)|passwd $hwid 2>/dev/null
echo "$hwid 1" >>/root/usuarios.db
clear&&clear
echo -e "${cor[5]} * Puertas Activas en su Servidor *"
msg -bar
ports_
msg -bar
echo -e "${cor[5]} Host/IP-Address : ${cor[4]}$IP"
echo -e "${cor[5]} USUARIO : ${cor[4]}$name"
echo -e "${cor[5]} TOKEN    : ${cor[4]}$hwid"
echo -e "${cor[5]} VALIDEZ : ${cor[4]}$datexp"
msg -bar
echo "senha: $name" > $dir_user/$hwid
echo "limite: TOKEN" >> $dir_user/$hwid
echo "data: $valid" >> $dir_user/$hwid
fkhwid
msg -bar
else
echo -e "${cor[5]} ⚠️ ERROR AL REGISTRAR SU TOKEN | REINTENTE ⚠️${cor[0]}"
fi
echo -ne "${cor[2]}"
return
}

function_1 () {
echo -e "${cor[4]} ❑ MENU DE CREACION DE USUARIOS ❒ "
msg -bar
echo -ne "${cor[5]} > NOMBRE DE"; read -p " USUARIO : " name
tput cuu1 && tput dl1
tput cuu1 && tput dl1
if [ -z $name ]; then
echo -e "${cor[5]} ⚠️ NO REGISTRO NOMBRE, RETORNANDO ⚠️${cor[0]}" 
return
fi
if cat /etc/passwd |grep $name: |grep -vi [a-z]$name |grep -v [0-9]$name > /dev/null
then
echo -e "${cor[5]} ⚠️ USUARIO YA EXISTE, USE OTRO NOMBRE ⚠️${cor[0]}"
return
fi
msg -bar
echo -e "${cor[5]} CONTRASEÑA PARA $name"
read -p " CONTRASEÑA : " pass
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
if [[ -f "${pass}" ]];then
	pass="$(date | md5sum | head -c10)"
fi
msg -bar
echo -e "${cor[5]} TIEMPO DE DURACION EN DIAS PARA $name"
read -p " VALIDEZ : " daysrnf
daysrnf=$(echo -e "$daysrnf" |sed -e 's/[^0-9]//ig')
number_var $daysrnf
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
if [[ -f "${daysrnf}" ]];then
	daysrnf="2"
fi
msg -bar
echo -e "${cor[5]} LIMITE DE CONEXIONES PARA $name"
read -p " LIMITE : " limit
limit=$(echo -e "$limit" |sed -e 's/[^0-9]//ig')
number_var $limit
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
if [[ -f "${limit}" ]];then
	limit="1"
fi
msg -bar
meu_ip
if [ "$OPENVPN" = "on" ]; then
open_1 $name $pass $daysrnf $limit s
msg -bar
ports_
msg -bar
echo -e "${cor[5]} Host/IP-Address : ${cor[4]}$IP"
echo -e "${cor[5]} USUARIO : ${cor[4]}$name"
echo -e "${cor[5]} PASSWD  : ${cor[4]}$pass"
echo -e "${cor[5]} LIMITE  : ${cor[4]}$limit"
echo -e "${cor[5]} VALIDEZ : ${cor[4]}$datexp"
msg -bar
fk
rm -rf ./$CLIENT.ovpn > /dev/null 2>&1
rm -f ./$CLIENT.ovpn > /dev/null 2>&1
msg -bar
return
fi
valid=$(date '+%C%y-%m-%d' -d " +$daysrnf days")
datexp=$(date "+%d/%m/%Y" -d " +$daysrnf days")
#echo -ne " USUARIO"
#(
if useradd -M -s /bin/false $name -e $valid ; then
(echo $pass; echo $pass)|passwd $name >/dev/null 2>&1 &
echo "$name $limit" >>/root/usuarios.db
tput cuu1 >&2 && tput dl1 >&2
figlet  $name | lolcat
echo -e "${cor[5]} * Puertas Activas en su Servidor *"
msg -bar
ports_
msg -bar
echo -e "${cor[5]} Host/IP-Address : ${cor[4]}$IP"
echo -e "${cor[5]} USUARIO : ${cor[4]}$name"
echo -e "${cor[5]} PASSWD  : ${cor[4]}$pass"
echo -e "${cor[5]} LIMITE  : ${cor[4]}$limit"
echo -e "${cor[5]} VALIDEZ : ${cor[4]}$datexp"
msg -bar
echo "senha: $pass" > $dir_user/$name
echo "limite: $limit" >> $dir_user/$name
echo "data: $valid" >> $dir_user/$name
fk
msg -bar
tput cuu1 >&2 && tput dl1 >&2
[[ -e /etc/v2ray/config.json ]] && {
echo -e "\033[1;41m AÑADIR USUARIO VMESS ?\033[0;33m :v"
echo -ne "\033[0;32m "
read -p " Responde [ s | n ] : " -e -i "n" x
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
[[ $x = @(s|S|y|Y) ]] && source <(curl -sSL ${url[utx]}/adduser.sh) $name $daysrnf
msg -bar
} 
else
echo -e "${cor[5]} ⚠️ ERROR AL REGISTRAR SU USUARIO | REINTENTE ⚠️${cor[0]}"
fi
echo -ne "${cor[2]}"
return
}

function_2 () {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
msg -bar
echo -e "${cor[4]} ELIMINAR USUARIOS"
msg -bar
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;33m >${cor[3]} ELIMINAR 1 USER"
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;33m >${cor[3]} ELIMINAR TODOS"
echo -e "\033[0;35m [\033[0;36m3\033[0;35m]\033[0;33m >${cor[3]} ELIMINAR TODOS LOS CADUCADOS"
msg -bar
selection=$(selection_fun 3)
case ${selection} in
0)
return
;;
1)
unset select_name namer nameFX
select_users 'USUARIOS REGISTRADOS'
name="$select_name"
[[ -z $name ]] && return
[[ $(cat ${sdir[0]}/userDIR/$name | grep "limite" | awk '{print $2}') = "HWID" ]] && nameFX="$(cat ${sdir[0]}/userDIR/$name | grep "senha" | awk '{print $2}')" || nameFX=$name
[[ $(cat ${sdir[0]}/userDIR/$name | grep "limite" | awk '{print $2}') = "TOKEN" ]] && nameFX="$(cat ${sdir[0]}/userDIR/$name | grep "senha" | awk '{print $2}')" || nameFX=$name
[[ "$OPENVPN" = "on" ]] && open_2 $name && msg -bar&& return 
userdel --force $name > /dev/null 2>/dev/null
kill -9 `ps aux |grep -vi '[a-z]$name' |grep -vi '$name[a-z]' |grep -v '[1-9]$name' |grep -v '$name[1-9]' |grep $name |awk {'print $2'}` 2> /dev/null
pid_kill=$(dropbear_pids | grep "$name" | awk '{print $2}')
uskk=$(cat /bin/ejecutar/uskill)
let uskk=$uskk+$cco
echo $uskk > /bin/ejecutar/uskill
[[ ! -z $pid_kill ]] && drop_kill $name
[[ -e /etc/usuariosteste/$name ]] && rm /etc/usuariosteste/$name && msg -bar
echo -e " $nameFX ${cor[2]} ELIMINADO "
msg -bar
return
;;
2)
for name in `cat "/etc/passwd"|grep 'home'|grep 'false'|grep -v 'syslog' | cut -d: -f1 |sort`; do
msg -bar  
echo -e "${cor[5]} ELIMINAR A $name ?"
read -p " [S/N]: " _remover_
if [[ "$_remover_" = "s" || "$_remover_" = "S" ]]; then
 if [ "$OPENVPN" = "on" ]; then
open_2 $name
 else
userdel --force $name > /dev/null 2>&1
kill -9 `ps aux |grep -vi '[a-z]$name' |grep -vi '$name[a-z]' |grep -v '[1-9]$name' |grep -v '$name[1-9]' |grep $name |awk {'print $2'}`  > /dev/null 2>&1
pid_kill=$(dropbear_pids | grep "$name" | awk '{print $2}')
uskk=$(cat /bin/ejecutar/uskill)
let uskk=$uskk+$cco
echo $uskk > /bin/ejecutar/uskill
[[ ! -z $pid_kill ]] && drop_kill $name
[[ -e $dir_user/$name ]] && rm $dir_user/$name
echo -e "\033[1;37m $name ${cor[5]} ELIMINADO"
fi
fi
done
msg -bar
;;
3)
function_6
msg -bar
return
;;
esac
}


function_3 () {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
msg -bar
echo -e "${cor[4]} "
msg -bar
unset select_name namer nameFX
select_users 'MODIFICAR DATOS DE USUARIOS'
if [ "$select_name" = "" ]; then
return
fi
namer="$select_name"
[[ $(cat ${sdir[0]}/userDIR/$namer | grep "limite" | awk '{print $2}') = "HWID" ]] && nameFX="$(cat ${sdir[0]}/userDIR/$u | grep "senha" | awk '{print $2}')" || nameFX=$namer
[[ $(cat ${sdir[0]}/userDIR/$namer | grep "limite" | awk '{print $2}') = "TOKEN" ]] && nameFX="$(cat ${sdir[0]}/userDIR/$u | grep "senha" | awk '{print $2}')" || nameFX=$namer
meu_ip
echo -e "${cor[5]} ESCOJE LA OPCION A CAMBIAR DE $namer"
msg -bar
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m >${cor[3]} NUMERO DE LOGINS DE    \033[0;36m$nameFX"
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m >${cor[3]} FECHA DE EXPIRACION DE \033[0;36m$nameFX"
echo -e "\033[0;35m [\033[0;36m3\033[0;35m]\033[0;31m >${cor[3]} CONTRASEÑA LOGIN DE    \033[0;36m$nameFX"
msg -bar
read -p " SELECCIONA UNA OPC : " _opt
[[ "$_opt" = "1" ]] && {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
read -p " NUEVO LIMITE DE CONEXIONES : " new_limit
number_var $new_limit
tput cuu1 && tput dl1
 if [ "$new_limit" = "" ]; then
echo -e "${cor[5]} \033[1;31m NO SE REGISTRO LIMITE! REGRESANDO. . ."
return
 fi
usr_var=$(cat $dir_user/$namer | grep -v "limite:")
echo "$usr_var" > $dir_user/$namer
echo "limite: $new_limit" >> $dir_user/$namer
msg -bar
echo -e "${cor[5]} $select_user - $select_name"
echo -e " ✭ Perfecto, HEMOS CAMBIADO SU LIMITE DE CONEXIONES!! ✭ "
echo -e " RENOVADO EL  : $(date "+%d/%m/%Y") "
echo -e " Host / IP    : ${cor[4]}$IP"
echo -e " SU CLIENTE   : $nameFX " 
echo -e " NUEVO LIMITE : $new_limit " 
pkill -u $nameFX
msg -bar
unset new_limit
unset usr_var
return
}
[[ "$_opt" = "2" ]] && {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
add_dias() {
echo -ne "${cor[5]} NUMEROS DE DIAS A AGREGAR"
read -p " : " date
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
 if [ "$date" = "" ]; then
echo -e "\033[1;31m ⚠️ NO SE REGISTRO DIAS! REGRESANDO ⚠️"
return
 fi
#echo -e " CALCULANDO DIAS RESTANTES DE $namer" | pv -qL 40
data=$(cat $dir_user/$namer | grep "data" | awk '{print $2}')
data_sec=$(date +%s) 
data_user=$(chage -l "$namer" |grep -i co |awk -F ":" '{print $2}')
data_user_sec=$(date +%s --date="$data_user")
variavel_soma=$(($data_user_sec - $data_sec))
dias_use=$(($variavel_soma / 86400)) 
#echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
[[ $dias_use -ge 0 ]] && {
date=$(($dias_use + $date))
echo -e "\033[1;32m $dias_use DIAS RECUPERADOS &&"
tput cuu1 && tput dl1
} || {
#[[ $dias_use < 0 ]] && dias_use=0
echo -e "\033[1;31m $dias_use DIAS RECUPERADOS &&"
tput cuu1 && tput dl1
}
limite=$(cat $dir_user/$namer | grep "limite" | awk '{print $2}')
if [ -z "$limite" ]; then
limite="null"
fi
clear&&clear
datexp=$(date "+%d/%m/%Y" -d " + $date days")
valid=$(date '+%C%y-%m-%d' -d " + $date days")
  if [[ $(passwd --status $namer|cut -d ' ' -f2) = "L" ]]; then
  	usermod -U $namer
  	sleep 2
  	msg -verd " ⚠️ UNLOCK ⚠️ "
  fi
chage -E $valid $namer 2> /dev/null
[[ -e ${sdir[0]}/userDIR/$namer.exp ]] && {
pass="$(cat < ${sdir[0]}/userDIR/$namer.exp)"
(echo "$pass" ; echo "$pass" ) |passwd $namer > /dev/null 2>/dev/null
rm -f ${sdir[0]}/userDIR/$namer.exp
}
usr_var=$(cat $dir_user/$namer | grep -v "data")
echo -e "$usr_var" > $dir_user/$namer
echo -e "data: $valid" >> $dir_user/$namer
msg -bar
echo -e "${cor[5]} $select_user - $select_name"
echo -e " ✭ Perfecto, Hemos Renovado tu Membresia!! ✭ "
echo -e " RENOVADO EL  : $(date "+%d/%m/%Y") "
echo -e " Host / IP    : ${cor[4]}$IP"
echo -e " SU CLIENTE   : $nameFX " 
echo -e " USER LIMITED : $limite "
echo -e " VALIDO HASTA : $datexp"
echo -e "${cor[5]} RENUEVA EN $date DIAS, DISFRUTE SU ESTANCIA!. "
pkill -u $namer
msg -bar
unset datexp
unset valid
unset usr_var
return
}

del_dias() {
echo -ne "${cor[5]} NUMEROS DE DIAS A QUITAR"
read -p " : " date
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
 if [ "$date" = "" ]; then
echo -e "\033[1;31m ⚠️ NO SE REGISTRO DIAS! REGRESANDO ⚠️"
return
 fi
data=$(cat $dir_user/$namer | grep "data" | awk '{print $2}')
data_sec=$(date +%s) 
data_user=$(chage -l "$namer" |grep -i co |awk -F ":" '{print $2}')
data_user_sec=$(date +%s --date="$data_user")
variavel_soma=$(($data_user_sec - $data_sec))
dias_use=$(($variavel_soma / 86400)) 
[[ $dias_use -ge 0 ]] && {
date=$(($dias_use - $date))
echo -e "\033[1;32m $dias_use DIAS RECUPERADOS &&"
tput cuu1 && tput dl1
} || {
echo -e "\033[1;31m $dias_use DIAS RECUPERADOS &&"
tput cuu1 && tput dl1
}
limite=$(cat $dir_user/$namer | grep "limite" | awk '{print $2}')
if [ -z "$limite" ]; then
limite="null"
fi
clear&&clear
datexp=$(date "+%d/%m/%Y" -d " + $date days")
valid=$(date '+%C%y-%m-%d' -d " + $date days")
  if [[ $(passwd --status $namer|cut -d ' ' -f2) = "L" ]]; then
  	usermod -U $namer
  	sleep 2
  	msg -verd " ⚠️ UNLOCK ⚠️ "
  fi
chage -E $valid $namer 2> /dev/null
[[ -e ${sdir[0]}/userDIR/$namer.exp ]] && {
pass="$(cat < ${sdir[0]}/userDIR/$namer.exp)"
(echo "$pass" ; echo "$pass" ) |passwd $namer > /dev/null 2>/dev/null
rm -f ${sdir[0]}/userDIR/$namer.exp
}
usr_var=$(cat $dir_user/$namer | grep -v "data")
echo -e "$usr_var" > $dir_user/$namer
echo -e "data: $valid" >> $dir_user/$namer
echo -e "${cor[5]} $select_user - $select_name"
echo -e " ✭ Perfecto, Hemos Renovado tu Membresia!! ✭ "
echo -e " RENOVADO EL  : $(date "+%d/%m/%Y") "
echo -e " Host / IP    : ${cor[4]}$IP"
echo -e " SU CLIENTE   : $nameFX " 
echo -e " 📱 PERMITIDOS : $limite "
echo -e " VALIDO HASTA : $datexp"
echo -e "${cor[5]} RENUEVA EN $(($date + 1 )) DIAS, DISFRUTE SU ESTANCIA!. "
msg -bar
pkill -u $namer
unset datexp
unset valid
unset usr_var
return
}

ren_dias() {
echo -ne "${cor[5]} NUMEROS DE DIAS "
read -p " : " date
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
 if [ "$date" = "" ]; then
echo -e "\033[1;31m ⚠️ NO SE REGISTRO DIAS! REGRESANDO ⚠️"
return
 fi
limite=$(cat $dir_user/$namer | grep "limite" | awk '{print $2}')
if [ -z "$limite" ]; then
limite="null"
fi
clear&&clear
datexp=$(date "+%d/%m/%Y" -d " + $date days")
valid=$(date '+%C%y-%m-%d' -d " + $date days")
  if [[ $(passwd --status $namer|cut -d ' ' -f2) = "L" ]]; then
  	usermod -U $namer
  	sleep 2
  	msg -verd " ⚠️ UNLOCK ⚠️ "
  fi
chage -E $valid $namer 2> /dev/null
[[ -e ${sdir[0]}/userDIR/$namer.exp ]] && {
pass="$(cat < ${sdir[0]}/userDIR/$namer.exp)"
(echo "$pass" ; echo "$pass" ) |passwd $namer > /dev/null 2>/dev/null
rm -f ${sdir[0]}/userDIR/$namer.exp
}
echo -e "${cor[5]} CAMBIADO !"
usr_var=$(cat $dir_user/$namer | grep -v "data")
echo -e "$usr_var" > $dir_user/$namer
echo -e "data: $valid" >> $dir_user/$namer
msg -bar
echo -e "${cor[5]} $select_user - $select_name"
echo -e " ✭ Perfecto, Hemos Renovado tu Membresia!! ✭ "
echo -e " RENOVADO EL  : $(date "+%d/%m/%Y") "
echo -e " Host / IP    : ${cor[4]}$IP"
echo -e " SU CLIENTE   : $nameFX " 
echo -e " 📱 PERMITIDOS : $limite "
echo -e " VALIDO HASTA : $datexp"
echo -e "${cor[5]} RENUEVA EN $(($date + 1 )) DIAS, DISFRUTE SU ESTANCIA!. "
pkill -u $namer
msg -bar
unset datexp
unset valid
unset usr_var
return
}

echo -e "${cor[5]} ESCOJE LA OPCION A CAMBIAR DE $nameFX"
msg -bar
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m >${cor[3]} AÑADIR DIAS A \033[0;36m$nameFX"
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m >${cor[3]} QUITAR DIAS A \033[0;36m$nameFX"
echo -e "\033[0;35m [\033[0;36m3\033[0;35m]\033[0;31m >${cor[3]} REINICIAR DIAS A \033[0;36m$nameFX"
msg -bar
read -p " OPCION " _ropt
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
[[ $_ropt = "1" ]] && add_dias
[[ $_ropt = "2" ]] && del_dias
[[ $_ropt = "3" ]] && ren_dias
return 
}
[[ "$_opt" = "3" ]] && {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
echo -e "${cor[5]} NUEVA CONTRASEÑA PARA $nameFX"
read -p " : " nova_senha
tput cuu1 && tput dl1
tput cuu1 && tput dl1
[[ "$nova_senha" = "" ]] && echo -e "${cor[5]}❌ CONTRASEÑA NO MODIFICADA ❌" && return
(echo "$nova_senha" ; echo "$nova_senha" ) |passwd $namer > /dev/null 2>/dev/null
usr_var1=$(cat $dir_user/$namer | grep -v "senha")
echo -e "$usr_var1" > $dir_user/$namer
echo -e "senha: $nova_senha" >> $dir_user/$namer
[[ -e ${sdir[0]}/userDIR/$namer.exp ]] && rm -f ${sdir[0]}/userDIR/$namer.exp
msg -bar
echo -e "${cor[5]} $select_user - $select_name"
echo -e " ✭ Perfecto, HEMOS CAMBIADO SU CONTRASEÑA!! ✭ "
echo -e " RENOVADO EL  : $(date "+%d/%m/%Y") "
echo -e " Host / IP    : ${cor[4]}$IP"
echo -e " SU CLIENTE   : $nameFX " 
echo -e " NUEVA CLAVE  : $nova_senha " 
pkill -u $namer
msg -bar
unset nova_senha
unset usr_var1
return
}
[[ -z $_opt ]] && echo "⚠️ SIN SELECCION ⚠️"
}

block_user () {

tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
msg -bar
#msg -bar  
echo -e "${cor[4]} LOCK / UNLOCK USUARIO PRIVADO "
msg -bar  
unset select_name namer nameFX
select_users 'LOCK / UNLOCK USUARIO PRIVADO'
[[ -z $select_name ]] && return
namer="$select_name"
local lmt="$(cat ${sdir[0]}/userDIR/$namer | grep "limite" | awk '{print $2}')"
[[ $(echo $lmt) = "HWID" ]] && nameFX="$(cat ${sdir[0]}/userDIR/$u | grep "senha" | awk '{print $2}')" || nameFX=$namer
[[ $(echo $lmt) = "TOKEN" ]] && nameFX="$(cat ${sdir[0]}/userDIR/$u | grep "senha" | awk '{print $2}')" || nameFX=$namer
echo -e "${cor[5]} VERIFICANDO ESTADO DE $nameFX "
msg -bar
########
  if [[ $(passwd --status $namer|cut -d ' ' -f2) = "P" ]]; then
    echo -e "${cor[5]}Bloqueando USER "
    pkill -u $namer &>/dev/null
    droplim=`dropbear_pids|grep -w "$namer"|awk '{print $2}'` 
    kill -9 $droplim &>/dev/null
    usermod -L $namer &>/dev/null
    sleep 2
    msg -verm2 "  ⚠️ LOCK ⚠️"
  else
  	usermod -U $namer
  	sleep 2
  	msg -verd " ⚠️ UNLOCK ⚠️ "
  fi
pkill -u $namer
kill -9 `ps aux |grep -vi '[a-z]$namer' |grep -vi '$namer[a-z]' |grep -v '[1-9]$namer' |grep -v '$namer[1-9]' |grep $namer |awk {'print $2'}` 2> /dev/null
return
}

function_4 () {

tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
msg -bar
echo -e "${cor[4]}  >  USUARIO     CONTRASEÑA     LIMITE     USO        TIEMPO"
msg -bar
_cont="0"
for namer in `cat "/etc/passwd"|grep 'home'|grep 'false'|grep -v 'syslog' | cut -d: -f1`; do
if [ "$namer" = "" ]; then
break
fi
if [ -e $dir_user/$namer ]; then
_sen=$(cat $dir_user/$namer | grep "senha" | awk '{print $2}')
_limit=$(cat $dir_user/$namer | grep "limite" | awk '{print $2}')
[[ ${_limit} = "HWID" ]] && token="$_sen"
else
_limit="∞"
_sen="∞"
fi
[[ -z "$_limit" ]] && _limit="⚠️ ?? ⚠️"
[[ -z "$_sen" ]] && _sen="⚠️ ?? ⚠️"
data_sec=$(date +%s)
data_user=$(chage -l "$namer" |grep -i co |awk -F ":" '{print $2}')
if [ "$data_user" = " never" ]; then
dias_user="\033[1;37mINDEFINIDO"
 else
data_user_sec=$(date +%s --date="$data_user")
 if [ "$data_sec" -gt "$data_user_sec" ]; then
dias_user="\033[1;31mEXP"
else
variavel_soma=$(($data_user_sec - $data_sec))
dias_use=$(($variavel_soma / 86400))
dias_user="\033[1;32m$dias_use DIAS"
 fi
fi
unset SEC
unset MIN
unset HOR
#SEC=$(cat $namer.time | grep "$namer" | awk '{print $2}')
[[ -e ${sdir[0]}/userDIR/$namer.time ]] && SEC=$(cat ${sdir[0]}/userDIR/$namer.time) || SEC="0"
number_var $SEC
if [ "$var_number" = "" ]; then
SEC="0"
 else
SEC="$var_number"
fi
hour_var=$(echo "HORAS" | cut -b 1)
min_var=$(echo "ACTA" | cut -b 1)
MIN=$(($SEC / 60))
SEC=$(($SEC - $MIN * 60))
HOR=$(($MIN / 60))
MIN=$(($MIN - $HOR * 60))
txto[1]=$(printf '%-10s' "$namer")
txto[2]=$(printf '%-12s' "$_sen")
txto[3]=$(printf '%-10s' "$_limit")
txto[4]=$(printf '%-10s' "${HOR}h:${MIN}m:${SEC}s")
[[ $(passwd --status $namer|cut -d ' ' -f2) = "L" ]] && txto[5]="\033[1;31mLOCK" || txto[5]=$(printf '%-2s' "$dias_user")
#$dir_user/$namer.block
unset open_vpn
tmp="$(cat /etc/passwd | grep -v ovpn | cat "/etc/passwd"|grep 'home'|grep 'false'|grep -v 'syslog' | cut -d: -f1)"
open_vpn=$(echo "$tmp" | grep "$namer")
_cont=$(($_cont + 1))
#[[ ${#_cont} < 2 ]] && _contx="0$_cont"
if [ "$open_vpn" != "" ]; then
#user ssh
[[ -e $dir_user/$namer ]] && [[ $(cat $dir_user/$namer | grep "limite" | awk '{print $2}') = "HWID" || $(cat $dir_user/$namer | grep "limite" | awk '{print $2}') = "TOKEN" ]] && { 
	[[ $(cat $dir_user/$namer | grep "limite" | awk '{print $2}') = "HWID" ]] && echo -e "\033[0;35m [\033[0;36m$_cont\033[0;35m]\033[0;31m ${cor[7]} ${txto[2]}            ${txto[3]} ${txto[4]} ${txto[5]}" && echo -e "     \033[1;32m ⤷ HWID ${cor[2]}- \033[1;31m${txto[1]} "
	[[ $(cat $dir_user/$namer | grep "limite" | awk '{print $2}') = "TOKEN" ]] && echo -e "\033[0;35m [\033[0;36m$_cont\033[0;35m]\033[0;31m ${cor[7]} ${txto[2]}            ${txto[3]} ${txto[4]} ${txto[5]}" && echo -e "     \033[1;32m ⤷ TOKEN ${cor[2]}- \033[1;31m${txto[1]} " 
	} || {
	echo -e "\033[0;35m [\033[0;36m$_cont\033[0;35m]\033[0;31m ${cor[2]}${cor[7]} ${txto[1]} ${txto[2]} ${txto[3]} ${txto[4]} ${txto[5]}"
	}
 else
#user openvpn
echo -e "\033[0;35m [\033[0;36m$_cont\033[0;35m]\033[0;31m ${cor[5]} ${txto[1]} ${txto[2]} ${txto[3]} ${txto[4]} ${txto[5]}"
fi
done
msg -bar
echo -e " \033[1;32m 🔰 # TIENES \033[1;33m [ \033[1;36m${_cont}\033[1;33m ]\033[1;32m CLIENTES EN TU SERVIDOR 🔰 #"
msg -bar
unset txt_
}


function_5 () {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
cab=$(printf '%-15s%-15s%-9s' 'USUARIO' 'CONEXIONES' 'TIEMPO HH:MM:SS')
msg -bar 
echo -e "\E[41;1;37m $cab\E[0m"
unset conex1
msg -bar
_data_now=$(date +%s)
[[ -z $(locale | grep "LANG=" | cut -d "=" -f2) ]] && export LANG=en_US.UTF-8
nU=1
for user in `cat "/etc/passwd"|grep 'home'|grep 'false'|grep -v 'syslog' | cut -d: -f1 |sort -f`; do 
i=${user}
sqd="$(ps -u $user | grep sshd | wc -l)"
[[ "$sqd" = "" ]] && sqd=0
[[ -e /etc/openvpn/openvpn-status.log ]] && ovp="$(cat /etc/openvpn/openvpn-status.log | grep -E ,"$user", | wc -l)" || ovp=0
if netstat -nltp|grep 'dropbear'> /dev/null;then
     drop="$(dropbear_pids | grep "$user" | wc -l)"
 else
     drop=0
fi
cnx=$(($sqd + $drop))
conex=$(($cnx + $ovp))
local _time="$(ps -o etime $(ps -u $user |grep sshd |awk 'NR==1 {print $1}')|awk 'NR==2 {print $1}')"
if [[ $cnx -gt 0 ]]; then
          tst="${_time}"
          tst1=$(echo "$tst" | wc -c)
if [[ "$tst1" == "9" ]]; then 
          timerr="${_time}"
else
          timerr="$(echo "00:$tst")"
fi
elif [[ $ovp -gt 0 ]]; then
          tmp2=$(printf '%(%H:%M:%S)T\n')
          tmp1="$(grep -w "$i" /etc/openvpn/openvpn-status.log |awk '{print $4}'| head -1)"
          [[ "$tmp1" = "" ]] && tmp1="00:00:00" && tmp2="00:00:00"
          var1=`echo $tmp1 | cut -c 1-2`
          var2=`echo $tmp1 | cut -c 4-5`
          var3=`echo $tmp1 | cut -c 7-8`
          var4=`echo $tmp2 | cut -c 1-2`
          var5=`echo $tmp2 | cut -c 4-5`
          var6=`echo $tmp2 | cut -c 7-8`
          calc1=`echo $var1*3600 + $var2*60 + $var3 | bc`
          calc2=`echo $var4*3600 + $var5*60 + $var6 | bc`
          seg=$(($calc2 - $calc1))
          min=$(($seg/60))
          seg=$(($seg-$min*60))
          hor=$(($min/60))
          min=$(($min-$hor*60))
          timerusr=`printf "%02d:%02d:%02d \n" $hor $min $seg;`
          timerr=$(echo "$timerusr" | sed -e 's/[^0-9:]//ig' )
else
          timerr="00:00:00"
fi
[[ -e $dir_user/${user} ]] && {

[[ $(cat $dir_user/${user} | grep "limite" | awk '{print $2}') = "HWID" ]] && { 
user="$(cat $dir_user/${user} | grep "senha" | awk '{print $2}') \033[1;33m[\033[1;34mHWID\033[1;33m]\033[1;32m"
_limiter="/${_limTOP}\033[1;33m]\033[1;32m"
} || {
[[ $(cat $dir_user/${user} | grep "limite" | awk '{print $2}') = "TOKEN" ]] && { 
user="$(cat $dir_user/${user} | grep "senha" | awk '{print $2}') \033[1;33m[\033[1;35mTOKEN\033[1;33m]\033[1;32m"
_limiter="/${_limTOP}\033[1;33m]\033[1;32m"												
																				} 
	} || {
	_limiter="\033[1;32m/\033[1;31m$(cat $dir_user/${user} | grep "limit" | awk '{print $2}')\033[1;33m]\033[1;32m"
	}
} || _limiter='/⚠️\033[1;33m]\033[1;32m'
if [ "$conex" -gt "0" ]; then
conex1+="${conex}+"
#lim="\033[1;33m[\033[1;35m$(printf '%-7s' ${conex}${_limiter})"
#local users=" ${user},	$lim,	${timerr},	${cor[0]}"
#echo -e "$users" | column -e -t -s ","
lim="\033[1;33m[\033[1;35m${conex}${_limiter}"
users=$(printf '%-15s%-15s%-15s' "${user} "	" ${lim}	"	"${timerr}"	)
echo -e "\033[0;35m [\033[0;36m$nU\033[0;35m]\033[0;31m-${cor[3]}$users ${cor[0]}"
let nU++
fi
done
conex1+="0"
conex1=$(echo $conex1|bc)
[[ "$conex1" = "" ]] &&  echo -e "\033[1;31m  ⚠️  NO TIENES USUARIOS CONECTADOS ! ⚠️ " 
msg -bar
echo -e " \033[1;32m 🔰 # TIENES \033[1;33m [ \033[1;36m${conex1}\033[1;33m ]\033[1;32m USUARIOS CONECTADOS 🔰 #"
msg -bar
}

function_6 () {

tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1

unset _removidos
msg -bar
datenow=$(date +%s)
for user in $(awk -F: '{print $1}' /etc/passwd); do
expdate=$(chage -l $user|awk -F: '/Account expires/{print $2}')
echo $expdate|grep -q never && continue
datanormal=$(date -d"$expdate" '+%d/%m/%Y')
expsec=$(date +%s --date="$expdate")
diff=$(echo $datenow - $expsec|bc -l)
echo $diff|grep -q ^\- && continue
userdel --force $user > /dev/null 2>/dev/null
kill -9 `ps aux |grep -vi '[a-z]$user' |grep -vi '$user[a-z]' |grep -v '[1-9]$user' |grep -v '$user[1-9]' |grep $user |awk {'print $2'}` 2> /dev/null
pid_kill=$(dropbear_pids | grep "$user" | awk '{print $2}')
uskk=$(cat /bin/ejecutar/uskill)
let uskk=$uskk+$cco
echo $uskk > /bin/ejecutar/uskill
[[ "$pid_kill" != "" ]] && drop_kill $user
[[ "$OPENVPN" = "on" ]] && open_2 $name
[[ -e $dir_user/$user ]] && rm $dir_user/$user
_removidos="on"
echo -e "\033[1;37m $user ${cor[2]} ELIMINADO "
done
if [ "$_removidos" = "" ]; then
echo -e "${cor[5]} ⚠️  No hay Usuarios Vencidos! ⚠️ "
unset _removidos
fi
msg -bar
}

ban_per () {
clear
local="/etc/bannerssh"
msg -bar
echo -e "\033[1;37m ∆ Linux Dist: $_os\033[0m"
msg -bar
echo -e "\033[1;37m - BANNER Manipulado -  \033[0m"
msg -bar
echo -e "\033[1;37mSeleccione su Sistema:    Para Salir Ctrl + C o 0 Para Regresar\033[1;33m"
echo -e " \033[1;31m[ !!! ]\033[1;33m PEGA AQUI TU BANNER   \033[1;31m\033[1;33m"
msg -bar
echo -e " \033[1;31mLuego de Pegar tu banner Presiona Ctrl + O y Enter \033[1;33m \033[1;31m\033[1;33m"
echo -e " \033[1;31m          Por Ultimo Ctrl + X  \033[1;33m \033[1;31m\033[1;33m"
echo -ne "\033[1;37m"
read -p " Presiona Enter para Continuar "
apt install nano -y > /dev/null 2>&1
nano /bin/ejecutar/bannerssh
cat /bin/ejecutar/bannerssh > /etc/bannerssh
rm /bin/ejecutar/bannerssh
fun_bar
#[[ ! -e /root/name ]] && credi="@drowkid01" || credi=$(cat < /root/name)
#echo '<p style="text-align: center;"><strong><span style="color: #FF00FF;">'$(cat /bin/ejecutar/menu_credito)'&reg;</span> |&nbsp;</strong><span style="color: #483D8B;"><strong>'$credi'</strong></span></p>' >> /etc/bannerssh
[[ -d /etc/dropbear ]] && {
[[ -e /etc/bannerssh ]] && cat /etc/bannerssh > /etc/dropbear/banner
} || men="NO EXISTE DROPBEAR"
msg -bar
echo -ne " \033[1;31m[ ! ] VERIFICANDO DROPBEAR "
service dropbear restart > /dev/null 2>&1
[[ -e /etc/init.d/dropbear ]] && { 
/etc/init.d/dropbear restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]"  || {
echo -e "\033[1;31m - BANNER INCOMPATIBLE CON DROPBEAR -\n" && echo "DESTRUYENDO DISEÑO" 
echo "" > /etc/dropbear/banner 
/etc/init.d/dropbear restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]"
}
} || echo -e "\033[0;35m [ $men ]"
echo -ne " \033[1;31m[ ! ] VERIFICANDO SSH"
service ssh restart > /dev/null 2>&1
service sshd restart > /dev/null 2>&1
[[ -e /etc/init.d/ssh ]] && /etc/init.d/ssh restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
sleep 0.1s
exit 
}

txt_font () {
echo -e "\n\033[1;31m[\033[1;36m01\033[1;31m]\033[1;33m Letra Pequeña"
echo -e "\033[1;31m[\033[1;36m02\033[1;31m]\033[1;33m Letra Media"
echo -e "\033[1;31m[\033[1;36m03\033[1;31m]\033[1;33m Letra Grande"
echo -e "\033[1;31m[\033[1;36m04\033[1;31m]\033[1;33m Letra ExtraGrande"
echo ""
echo -ne "\033[1;32mEscoje el Tamaño de Letra\033[1;31m ?\033[1;37m : "; read opc
if [[ "$opc" = "1" ]] || [[ "$opc" = "01" ]]; then
_size='6'
elif [[ "$opc" = "2" ]] || [[ "$opc" = "02" ]]; then
_size='4'
elif [[ "$opc" = "3" ]] || [[ "$opc" = "03" ]]; then
_size='3'
elif [[ "$opc" = "4" ]] || [[ "$opc" = "04" ]]; then
_size='1'
else
_size='6'
fi
msg -bar
echo -ne "\033[1;37m"
read -p " INGRESA TU MENSAJE : " ban_ner2
msg -bar
unset x
echo -e "\033[1;42m Deseas centrar el contenido del banner\033[0;33m  :v"
echo ""
echo -ne "\033[0;32m Responde [ s | n ] : " && read -e -i "s" x
msg -bar
[[ "$x" = @(s|S|y|Y) ]] && echo -e '<p style="text-align: center;">' >> /etc/bannerssh
echo -e " \033[1;31m[ 1 ]\033[1;33m > VERDE         \033[1;31m[ 9  ]\033[1;33m > AZUL PIZARRA OSCURO"
echo -e " \033[1;31m[ 2 ]\033[1;33m > ROJO          \033[1;31m[ 10 ]\033[1;33m > MAGENTA"
echo -e " \033[1;31m[ 3 ]\033[1;33m > AZUL          \033[1;31m[ 11 ]\033[1;33m > CHOCOLATE"
echo -e " \033[1;31m[ 4 ]\033[1;33m > AMARILLO      \033[1;31m[ 12 ]\033[1;33m > VERDE CLARO"
echo -e " \033[1;31m[ 5 ]\033[1;33m > PURPURA       \033[1;31m[ 13 ]\033[1;33m > GRIS"
echo -e " \033[1;31m[ 6 ]\033[1;33m > Naranja       \033[1;31m[ 14 ]\033[1;33m > VERDE MAR"
echo -e " \033[1;31m[ 7 ]\033[1;33m > Crema         \033[1;31m[ 15 ]\033[1;33m > CIAN OSCURO"
echo -e " \033[1;31m[ 8 ]\033[1;33m > Cyano         \033[1;31m[ *  ]\033[1;33m > Negro"
read -p " Digite A Cor [ 1 ⇿ 15 ]: " ban_ner2_cor
if [[ "$ban_ner2_cor" = "1" ]]; then
echo '<h'$_size'><font color="green">' >> /etc/bannerssh
elif [[ "$ban_ner2_cor" = "2" ]]; then
echo '<h'$_size'><font color="red">' >> /etc/bannerssh
elif [[ "$ban_ner2_cor" = "3" ]]; then
echo '<h'$_size'><font color="blue">' >> /etc/bannerssh
elif [[ "$ban_ner2_cor" = "4" ]]; then
echo '<h'$_size'><font color="yellow">' >> /etc/bannerssh
elif [[ "$ban_ner2_cor" = "5" ]]; then
echo '<h'$_size'><font color="purple">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "6" ]; then
echo '<h'$_size'><font color="#FF7F00">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "7" ]; then
echo '<h'$_size'><font color="#AEB404">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "8" ]; then
echo '<h'$_size'><font color="cyan">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "9" ]; then
echo '<h'$_size'><font color="#483D8B">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "10" ]; then
echo '<h'$_size'><font color="#FF00FF">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "11" ]; then
echo '<h'$_size'><font color="#D2691E">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "12" ]; then
echo '<h'$_size'><font color="#90EE90">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "13" ]; then
echo '<h'$_size'><font color="#BEBEBE">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "14" ]; then
echo '<h'$_size'><font color="#2E8B57">' >> /etc/bannerssh
elif [ "$ban_ner2_cor" = "15" ]; then
echo '<h'$_size'><font color="#008B8B">' >> /etc/bannerssh
else
echo '<h'$_size'><font color="black">' >> /etc/bannerssh
fi
echo "$ban_ner2" >> /etc/bannerssh
echo "</h"$_size"></font>" >> /etc/bannerssh
[[ "$x" = @(s|S|y|Y) ]] && echo "</p>" >> /etc/bannerssh
}

function_7 () {
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
msg -bar
echo -e "${cor[2]}MENU BANNER  (RECOMENDADO 2):
 $(msg -bar)"
 echo -e "\033[0;35m [\033[0;36m01\033[0;35m]\033[0;31m >${cor[3]} Pegar BANNER Personalizado ( html , etc )"
 echo -e "\033[0;35m [\033[0;36m02\033[0;35m]\033[0;31m >${cor[3]} AGREGAR MENSAJES BANNER SSH"
 echo -e "\033[0;35m [\033[0;36m03\033[0;35m]\033[0;31m >${cor[3]} ELIMINAR BANNER ( SSH ⇿ DROPBEAR )"
 msg -bar
 echo -e " \033[0;35m [\033[0;36m0\033[0;35m]\033[0;31m > $(msg -bra "\033[1;41m[ REGRESAR ]\e[0m")"
msg -bar
selection=$(selection_fun 3)
case ${selection} in
1)
unset sshsn
unset sin_nao
echo -e " Al escojer que coloques tu Banner creado fuera del Script, ADM no se "
echo -e "    Responsabiliza por el Fallo de ciertos recursos del SISTEMA"
echo -e "RECUERDA QUE EL SCRIPT ESTA REALIZADO PARA FUNCIONAR CON SUS FUNCIONES"
echo -e "                          Y esta es EXPERIMENTAL"
echo -e "Esta SEGURO de usar esta funcion ?:"
read -p " [S/N]: " -e -i n sshsn
[[ "$sshsn" = @(s|S|y|Y) ]] && {
local2="/etc/bannerssh"
chk=$(cat /etc/ssh/sshd_config | grep Banner)
if [ "$(echo "$chk" | grep -v "#Banner" | grep Banner)" != "" ]; then
local=$(echo "$chk" |grep -v "#Banner" | grep Banner | awk '{print $2}')
 else
echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
local="/etc/bannerssh"
fi
while true; do
echo -e " ESTAS SEGURO QUE TIENES TU BANNER BIEN ESTRUCTURADO "
read -p " [ s | n ]: " sin_nao
 if [[ "$sin_nao" = @(s|S|y|Y) ]]; then
 ban_per
 elif [[ "$sin_nao" = @(n|N) ]]; then
 break
 fi
done
}
;;
2)
unset sshsn
unset sin_nao
echo -e "${cor[3]} Buena ELECCION, Tienes un 99% mas Garantia"
echo -e "${cor[3]} Esta SEGURO:"
read -p " [S/N]: " -e -i s sshsn
[[ "$sshsn" = @(s|S|y|Y) ]] && {
local2="/etc/bannerssh"
chk=$(cat /etc/ssh/sshd_config | grep Banner)
if [ "$(echo "$chk" | grep -v "#Banner" | grep Banner)" != "" ]; then
local=$(echo "$chk" |grep -v "#Banner" | grep Banner | awk '{print $2}')
 else
echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
local="/etc/bannerssh"
fi
msg -bar
echo -e "\n\033[1;31m[\033[1;36m01\033[1;31m]\033[1;33m Letra Pequeña"
echo -e "\033[1;31m[\033[1;36m02\033[1;31m]\033[1;33m Letra Media"
echo -e "\033[1;31m[\033[1;36m03\033[1;31m]\033[1;33m Letra Grande"
echo -e "\033[1;31m[\033[1;36m04\033[1;31m]\033[1;33m Letra ExtraGrande"
echo ""
echo -ne "\033[1;32mEscoje el Tamaño de Letra\033[1;31m ?\033[1;37m : "; read opc
if [[ "$opc" = "1" ]] || [[ "$opc" = "01" ]]; then
_size='6'
elif [[ "$opc" = "2" ]] || [[ "$opc" = "02" ]]; then
_size='4'
elif [[ "$opc" = "3" ]] || [[ "$opc" = "03" ]]; then
_size='3'
elif [[ "$opc" = "4" ]] || [[ "$opc" = "04" ]]; then
_size='1'
else
_size='6'
fi
msg -bar
echo -ne "\033[1;37m"
read -p " INGRESA TU MENSAJE : " ban_ner
msg -bar
echo -e " \033[1;31m[ 1 ]\033[1;33m > VERDE         \033[1;31m[ 9  ]\033[1;33m > AZUL PIZARRA OSCURO"
echo -e " \033[1;31m[ 2 ]\033[1;33m > ROJO          \033[1;31m[ 10 ]\033[1;33m > MAGENTA"
echo -e " \033[1;31m[ 3 ]\033[1;33m > AZUL          \033[1;31m[ 11 ]\033[1;33m > CHOCOLATE"
echo -e " \033[1;31m[ 4 ]\033[1;33m > AMARILLO      \033[1;31m[ 12 ]\033[1;33m > VERDE CLARO"
echo -e " \033[1;31m[ 5 ]\033[1;33m > PURPURA       \033[1;31m[ 13 ]\033[1;33m > GRIS"
echo -e " \033[1;31m[ 6 ]\033[1;33m > Naranja       \033[1;31m[ 14 ]\033[1;33m > VERDE MAR"
echo -e " \033[1;31m[ 7 ]\033[1;33m > Crema         \033[1;31m[ 15 ]\033[1;33m > CIAN OSCURO"
echo -e " \033[1;31m[ 8 ]\033[1;33m > Cyano         \033[1;31m[ *  ]\033[1;33m > Negro"
read -p " [ 1 ⇿ 15 ]: " ban_ner_cor
unset local 
unset x
echo -e "\033[1;42m Deseas centrar el contenido del banner\033[0;33m  :v"
echo ""
echo -ne "\033[0;32m Responde [ s | n ] : " && read -e -i "s" x
msg -bar
[[ "$x" = @(s|S|y|Y) ]] && echo -e '<p style="text-align: center;">' > /etc/bannerssh
if [[ "$ban_ner_cor" = "1" ]]; then
echo '<h'$_size' style="text-align:center;"><font color="green">' >> /etc/bannerssh
elif [[ "$ban_ner_cor" = "2" ]]; then
echo '<h'$_size' style="text-align:center;"><font color="red">' >> /etc/bannerssh
elif [[ "$ban_ner_cor" = "3" ]]; then
echo '<h'$_size' style="text-align:center;"><font color="blue">' >> /etc/bannerssh
elif [[ "$ban_ner_cor" = "4" ]]; then
echo '<h'$_size' style="text-align:center;"><font color="yellow">' >> /etc/bannerssh
elif [[ "$ban_ner_cor" = "5" ]]; then
echo '<h'$_size' style="text-align:center;"><font color="purple">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "6" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#FF7F00">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "7" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#AEB404">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "8" ]; then
echo '<h'$_size' style="text-align:center;"><font color="cyan">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "9" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#483D8B">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "10" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#FF00FF">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "11" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#D2691E">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "12" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#90EE90">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "13" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#BEBEBE">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "14" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#2E8B57">' >> /etc/bannerssh
elif [ "$ban_ner_cor" = "15" ]; then
echo '<h'$_size' style="text-align:center;"><font color="#008B8B">' >> /etc/bannerssh
else
echo '<h'$_size' style="text-align:center;"><font color="black">' >> /etc/bannerssh
fi
echo "$ban_ner" >> /etc/bannerssh
echo '</font></h'$_size'>' >> /etc/bannerssh
[[ "$x" = @(s|S|y|Y) ]] && echo "</p>" >> /etc/bannerssh
while true; do
echo -e " DESEAS AÑADIR MAS TEXTOS A TU BANNER?"
read -p " [ s | n ]: " sin_nao
 if [[ "$sin_nao" = @(s|S|y|Y) ]]; then
 txt_font
 elif [[ "$sin_nao" = @(n|N) ]]; then
 break
 fi
done
[[ -e /root/name ]] && credi=$(cat < /root/name) || credi="@drowkid01"
credit=$(cat < /bin/ejecutar/menu_credito | head -1)
echo -e '<p style="text-align: center;"><strong><span style="color: #FF00FF;">'" $credit "'&reg;</span> |&nbsp;</strong><span style="color: #483D8B;"><strong>'"$credi"'</strong></span></p>' >> /etc/bannerssh
#echo '<font color="#FF00FF">© 2020 ChumoGH, &reg</font>' >> /etc/bannerssh
[[ -d /etc/dropbear ]] && {
[[ -e /etc/bannerssh ]] && cat /etc/bannerssh > /etc/dropbear/banner
} || men="NO EXISTE DROPBEAR"
msg -bar
echo -ne " \033[1;31m[ ! ] VERIFICANDO DROPBEAR "
service dropbear restart > /dev/null 2>&1
[[ -e /etc/init.d/dropbear ]] && { 
/etc/init.d/dropbear restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]"  || {
echo -e "\033[1;31m ▢ BANNER INCOMPATIBLE CON DROPBEAR -\n" && echo "DESTRUYENDO DISEÑO" 
echo "" > /etc/dropbear/banner 
/etc/init.d/dropbear restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]"
}
} || echo -e "\033[0;35m [ $men ]" 
echo -ne " \033[1;31m[ ! ] VERIFICANDO SSH "
service ssh restart > /dev/null 2>&1
service sshd restart > /dev/null 2>&1
[[ -e /etc/init.d/ssh ]] && /etc/init.d/ssh restart > /dev/null 2>&1 && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
}
return 0
;;
3)
echo "Verificando existencia de BANNER"
echo ""
[[ -e /etc/bannerssh ]] && {
 echo "DESTRUYENDO BANNER SSH " 
 echo "" > /etc/bannerssh
 } || echo "NO EXISTE BANNER DROPBEAR ESTRUCTURADO"
 [[ -e /etc/dropbear/banner ]] && {
 echo "DESTRUYENDO BANNER DROPBEAR " 
 echo "" > /etc/dropbear/banner
 } || echo "NO EXISTE BANNER SSH ESTRUCTURADO"
 return 0
;;
*)
echo "LO SENTIMOS DIGITASTE MAL"
sleep 0.1s
return 0
;;
esac
#TERMINA CASE
}

meu-v2ray () {

tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1
tput cuu1 && tput dl1

msg -bar
echo -e "\e[97m\033[1;41m PROYECTOS V2RAY REFACTORIZADO By @drowkid01  11-12-2022  \033[0m" 
msg -bar
echo -ne "\033[1;37m 
 1)- V2ray Manager UNIVERSAL
 2)- V2ray Manager by @Rufu99
$(msg -bar) 
 0)- Salir \n" | lolcat
msg -bar
selection=$(selection_fun 2)
case ${selection} in
1)
[[ ! -z $(which v2ray.menu) ]] && v2ray.menu || source <(curl -sSL ${url[utx]}/v2ray1.sh)
;;
2) 
[[ ! -z $(which v2r.sh) ]] && v2r.sh || source <(curl -sSL  ${url[utx]}/v2ray_manager.sh)
;;
0)
return 0
;;
esac
}

ssrmenu () {
source <(curl -sL ${url[utx]}/ssrrmu.sh)
}

selection=$(selection_fun 14)
case ${selection} in
1)
cd ${sdir[0]}/ && fun_us
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
2)
cd ${sdir[0]}/ && function_2
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
3)
cd ${sdir[0]}/ && function_3
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
4)
cd ${sdir[0]}/ && function_4
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
5)
cd ${sdir[0]}/ && function_5
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
6)
cd ${sdir[0]}/ && function_7
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
7)
cd ${sdir[0]}/ && net_meter
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
8)
cd ${sdir[0]}/ && block_user
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
9)
cd ${sdir[0]}/ && recuva1
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
10)
cd ${sdir[0]}/ && ssrmenu
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
11)
cd ${sdir[0]}/ && meu-v2ray
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
12)
cd ${sdir[0]}/ && consul_cli
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
13)
#[[ ! -z $(which troj.sh) ]] && troj.sh || echo -e " NO SE HA HABILITADO ACCESO AL PANNEL"
#echo -ne "${cor[5]}"
#read -p " ¡Enter, para volver!"
#source ${sfile[usr]}
#;;
#14)
wget -q -O /tmp/instCHEKC.sh ${url[utx]}initcheck.sh && bash /tmp/instCHEKC.sh
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
14)
_usCHECK
echo -ne "${cor[5]}"
read -p " ¡Enter, para volver!"
source ${sfile[usr]}
;;
esac
