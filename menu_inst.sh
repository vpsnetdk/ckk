#!/usr/bin/env sh

                        unset soporte slogan
            soporte=@drowkid01 && slogan="✧ | ᴅʀᴏᴡᴋɪᴅ | ✧"

declare -A sdir=( [banner]="banner" [fpy]="filepy" [fsh]="filesh" [v]="version" [drw]="main" [tmp]=tmp )
declare -A sfile=( [exec]=${sdir[fsh]}/cabecalho.sh [f2b]=${sdir[fsh]}/fai2ban.sh [frm]=${sdir[fsh]}/ferramentas.sh [minst]=${sdir[fsh]}/menu_inst.sh [pyl]=${sdir[fsh]}/payloads [ss]=${sdir[fsh]}/shadowsocks.sh [uht]=${sdir[fsh]}/ultrahost.sh [usr]=${sdir[fsh]}/usercodes.sh [PDirect]=${sdir[fpy]}/PDirect.py [PGet]=${sdir[fpy]}/PGet.py [POpen]=${sdir[fpy]}/POpen.py [PPriv]=${sdir[fpy]}/PPriv.py [PPub]=${sdir[fpy]}/PPub.py [ress]=${sdir[banner]}/message.txt [banner]=${sdir[banner]}/name [main]=main.sh [version]=${sdir[v]}/v-new.log [msg]=${sdir[tmp]}/msg )
declare -A url=( [py]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filepy" [sh]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filesh" [main]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/main.sh" [msg]="https://gist.githubusercontent.com/vpsnetdk/a47403148a3f10fbbf645089597f5af7/raw/e902f8fd9a273912379a5b0ea0eb3a6e34f00a91/msg" [utx]="https://raw.githubusercontent.com/vpsnetdk/files-ckk/main" )

clear&&clear
source ${sfile[msg]}
source ${sfile[exec]} "ports_"

_SFTP="$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN" | grep apache2)"
portFTP=$(echo -e "$_SFTP" |cut -d: -f2 | cut -d' ' -f1 | uniq)
portFTP=$(echo ${portFTP} | sed 's/\s\+/,/g' | cut -d , -f1)


number_var () {
unset var_number
if (echo "$1" | egrep '[^0-9]' &> /dev/null); then
echo -e "${cor[5]} SOLO NUMEROS!"
else
var_number="$1"
fi
}
sslkk (){
sslports=`netstat -tunlp | grep stunnel | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/ssl.txt && echo | cat /tmp/ssl.txt | tr '\n' ' ' > /ADMcgh/sslports.txt && cat /ADMcgh/sslports.txt`;
pt=$(netstat -nplt |grep 'sshd' | awk -F ":" NR==1{'print $2'} | cut -d " " -f 1)
}
#par=$(v2ray info | grep path |awk -F : '{print $4}')

verif_ptrs() {
		porta=$1
		PT=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" | grep -v "COMMAND" | grep "LISTEN")
		for pton in $(echo -e "$PT" | cut -d: -f2 | cut -d' ' -f1 | uniq); do
			svcs=$(echo -e "$PT" | grep -w "$pton" | awk '{print $1}' | uniq)
			[[ "$porta" = "$pton" ]] && {
				echo -e "\n\033[1;31mPUERTO \033[1;33m$porta \033[1;31mESTA EN USO POR \033[1;37m$svcs\033[0m"
				sleep 0.5
				return 0
			}
		done
	}

fun_log () {
[[ -e /bin/ejecutar/sshd_config ]] && { 
####
sysvar=$(cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/      //' | grep -o Ubuntu)
[[ ! $(cat /etc/shells|grep "/bin/false") ]] || sed -i "s%/bin/false%filemancgh%g" /etc/shells
[[ ! $(cat /etc/shells|grep "/usr/sbin/nologin") ]] || sed -i "s%/usr/sbin/nologin%filemancgh%g" /etc/shells
sed -i "/filemancgh/d" /etc/shells
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
[[ "$sysvar" != "" ]] && {
echo -e "Port 22
Protocol 2
KeyRegenerationInterval 3600
ServerKeyBits 1024
SyslogFacility AUTH
LogLevel INFO
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes
RSAAuthentication yes
PubkeyAuthentication yes
IgnoreRhosts yes
RhostsRSAAuthentication no
HostbasedAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
PasswordAuthentication yes
X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
#UseLogin no
AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server
UsePAM yes
Banner /etc/bannerssh" > /etc/ssh/sshd_config
} || {
echo -e "Port 22
Protocol 2
KeyRegenerationInterval 3600
ServerKeyBits 1024
SyslogFacility AUTH
LogLevel INFO
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes
RSAAuthentication yes
PubkeyAuthentication yes
IgnoreRhosts yes
RhostsRSAAuthentication no
HostbasedAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
PasswordAuthentication yes
X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
#UseLogin no
AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server
UsePAM yes
Banner /etc/bannerssh" > /etc/ssh/sshd_config
}
} || {
cp /etc/ssh/sshd_config /bin/ejecutar/sshd_config
sysvar=$(cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/      //' | grep -o Ubuntu)
[[ ! $(cat /etc/shells|grep "/bin/false") ]] || sed -i "s%/bin/false%filemancgh%g" /etc/shells
[[ ! $(cat /etc/shells|grep "/usr/sbin/nologin") ]] || sed -i "s%/usr/sbin/nologin%filemancgh%g" /etc/shells
sed -i "/filemancgh/d" /etc/shells
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
[[ "$sysvar" != "" ]] && {
echo -e "Port 22
Protocol 2
KeyRegenerationInterval 3600
ServerKeyBits 1024
SyslogFacility AUTH
LogLevel INFO
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes
RSAAuthentication yes
PubkeyAuthentication yes
IgnoreRhosts yes
RhostsRSAAuthentication no
HostbasedAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
PasswordAuthentication yes
X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
#UseLogin no
AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server
UsePAM yes
Banner /etc/bannerssh" > /etc/ssh/sshd_config
} || {
echo -e "Port 22
Protocol 2
KeyRegenerationInterval 3600
ServerKeyBits 1024
SyslogFacility AUTH
LogLevel INFO
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes
RSAAuthentication yes
PubkeyAuthentication yes
IgnoreRhosts yes
RhostsRSAAuthentication no
HostbasedAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
PasswordAuthentication yes
X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
#UseLogin no
AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server
UsePAM yes
Banner /etc/bannerssh" > /etc/ssh/sshd_config
}
}
######################

}


ban_inex () {
ban=$(cat < /ADMcgh/menu_credito | head -1)
echo -e " "
echo -e "BANNER INEXISTENTE - RECOMENDADO MODIFICAR TU BANNER"
fun_bar 
credit=$(cat </ADMcgh/menu_credito | head -1)
[[ -e /root/name ]] && credi="$(cat < /root/name)" || credi="${credit}"
echo -e '<p style="text-align: center;"> <big><big><big><big><big><big>🐉</big></big></big></big></big></big></p>' > /etc/bannerssh
echo -e '<p style="text-align: center;"><strong><span style="color: #FF00FF;">'" $credit "'&reg;</span> |&nbsp;</strong><span style="color: #483D8B;"><strong>'"$credi"'</strong></span></p>' >> /etc/bannerssh
[[ -d /etc/dropbear ]] && {
[[ -e /etc/bannerssh ]] && cat /etc/bannerssh > /etc/dropbear/banner
} || {
mkdir /etc/dropbear
[[ -e /etc/bannerssh ]] && cat /etc/bannerssh > /etc/dropbear/banner
}
echo -e "\033[1;32mCambia Banner en ( * \033[1;33m Menu 1\033[1;32m *\033[1;33m opcion 6 \033[1;32m*\033[1;32m)"
read -p "Presiona Enter para Continuar"
clear&&clear
dropbearuniversal
}

function dropbearuniversal(){
echo "⚡⚡ Preparando Instalacion, Espere un Momento"
echo -ne "\033[1;31m[ ! ] RESOLVIENDO SSH -> DROPBEAR  "
(
service dropbear stop 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
) && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
echo -ne "\033[1;31m[ ! ] VERIFICANDO COMPATIBILIDAD DEL BANNER " && sleep 0.5s && echo -e "\033[1;32m [OK]"
[[ -e /etc/bannerssh ]] && {
####
fun_log
####
echo " ⚡⚡ Instalando Dropbear"
fun_bar 'apt install dropbear -y'
service dropbear stop 1> /dev/null 2> /dev/null
msg -bar
    while true; do
    echo -ne "\033[1;37m"
    echo -e " PUERTOS RECOMENDADOS A USAR ( 80/90/100/443  Default 143 )"
	echo -e " "
    read -p " PUERTO DROPBEAR : " puertodropbear -e -i "143"
	tput cuu1 && tput dl1
	PortDROP=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $puertodropbear`
	[[ -n "$PortDROP" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$puertodropbear"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
    unset puertodropbear
	msg -bar
    done
msg -bar
echo $puertodropbear > /etc/default/dadd
echo -e 'NO_START=0' > /etc/default/dropbear
echo -e '# the TCP port that Dropbear listens on' >> /etc/default/dropbear 
echo -e '#DROPBEAR_PORT=22' >> /etc/default/dropbear
echo -e 'DROPBEAR_EXTRA_ARGS="-p '$puertodropbear'"' >> /etc/default/dropbear
echo -e 'DROPBEAR_BANNER="/etc/dropbear/banner"' >> /etc/default/dropbear
echo -e "DROPBEAR_RECEIVE_WINDOW=65536" >> /etc/default/dropbear
[[ ! $(cat /etc/shells|grep "/bin/false") ]] || sed -i "s%/bin/false%filemancgh%g" /etc/shells
[[ ! $(cat /etc/shells|grep "/usr/sbin/nologin") ]] || sed -i "s%/usr/sbin/nologin%filemancgh%g" /etc/shells
sed -i "/filemancgh/d" /etc/shells
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
[[ ! -e /etc/dropbear/banner ]] && touch /etc/dropbear/banner || cat /etc/bannerssh > /etc/dropbear/banner 
service dropbear restart 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
dropbearports=`netstat -tunlp | grep dropbear | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/dropbear.txt && echo | cat /tmp/dropbear.txt | tr '\n' ' ' > /ADMcgh/dropbearports.txt && cat /ADMcgh/dropbearports.txt`;
service sshd restart 1> /dev/null 2> /dev/null
echo -e "\033[1;31m ⚡⚡ DROPBEAR SE EJECUTA EN PUERTO\033[0m" $dropbearports " ESCOJIDO " $puertodropbear
service dropbear start 1> /dev/null 2> /dev/null
[[ -f "/usr/sbin/ufw" ]] && ufw allow $puertodropbear/tcp 1> /dev/null 2> /dev/null
fun_eth
return 0
 } || {
ban_inex
return 1
}
}


#LISTA PORTAS
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

#MEU IP
fun_ip () {
[[ -e /etc/catIPlocal && -e /etc/catIP ]] && {
MEU_IP=$(cat < /etc/catIPlocal)
MEU_IP2=$(cat < /etc/catIP)
[[ "$MEU_IP" != "$MEU_IP2" ]] && IP="$MEU_IP2" || IP="$MEU_IP"
} || {
MEU_IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1) && echo $MEU_IP > /etc/catIPlocal
MEU_IP2=$(wget -qO- ipv4.icanhazip.com) && echo $MEU_IP2 > /etc/catIP
[[ "$MEU_IP" != "$MEU_IP2" ]] && IP="$MEU_IP2" || IP="$MEU_IP" 
}
}
meu_ip () {
fun_ip
}


#ETHOOL SSH
fun_eth () {
eth=$(ifconfig | grep -v inet6 | grep -v lo | grep -v 127.0.0.1 | grep "encap:Ethernet" | awk '{print $1}')
    [[ $eth != "" ]] && {
    msg -bar
    echo -e "${cor[3]}  Aplicar Sistema Para Mejorar Sistema SSH?"
    echo -e "${cor[3]}  Opcion Para Usuarios Avanzados"
    msg -bar
    read -p " [S/N]: " -e -i n sshsn
           [[ "$sshsn" = @(s|S|y|Y) ]] && {
           echo -e "${cor[1]}  Correcion de problemas de paquetes en SSH..."
           echo -e "  Quota en Entrada"
           echo -ne "[ 1 - 999999999 ]: "; read rx
           [[ "$rx" = "" ]] && rx="999999999"
           echo -e "  Quota en Salida"
           echo -ne "[ 1 - 999999999 ]: "; read tx
           [[ "$tx" = "" ]] && tx="999999999"
           apt-get install ethtool -y > /dev/null 2>&1
           ethtool -G $eth rx $rx tx $tx > /dev/null 2>&1
           }
     msg -bar
     }
}

 

squid_cache () {
msg -bar
echo -e "${cor[5]} Caché de Squid no es más Que
 Un historial de navegación en Squid
 Que ahorrará datos al abrir sitios
 Alojados en su caché 
 ¡El script hará una breve comprobación!"
msg -bar
sleep 0.5s
if [ -e /etc/squid/squid.conf ]; then
squid_var="/etc/squid/squid.conf"
elif [ -e /etc/squid3/squid.conf ]; then
squid_var="/etc/squid3/squid.conf"
else
echo -e "${cor[5]} No se ha identificado Squid!"
return 1
fi
teste_cache="#CACHE DO SQUID"
if [[ `grep -c "^$teste_cache" $squid_var` -gt 0 ]]; then
  [[ -e ${squid_var}.bakk ]] && {
  echo -e "${cor[5]} Desactivando SquidCache !!\n ESPERA PORFAVOR !"
  mv -f ${squid_var}.bakk $squid_var
  echo -e "${cor[5]} COLOCAR ARCHIVO ONLINE"
  msg -bar
  service squid restart > /dev/null 2>&1
  service squid3 restart > /dev/null 2>&1
  return 0
  }
fi
echo -e "${cor[5]} ¡Squid esta Activo en tu sistema!\n ${cor[5]} No hay servicio de caché en el Squid!\n Activando el servicio SquidCache!"
msg -bar
_tmp="#CACHE DO SQUID\ncache_mem 200 MB\nmaximum_object_size_in_memory 32 KB\nmaximum_object_size 1024 MB\nminimum_object_size 0 KB\ncache_swap_low 90\ncache_swap_high 95"
[[ "$squid_var" = "/etc/squid/squid.conf" ]] && _tmp+="\ncache_dir ufs /var/spool/squid 100 16 256\naccess_log /var/log/squid/access.log squid" || _tmp+="\ncache_dir ufs /var/spool/squid3 100 16 256\naccess_log /var/log/squid3/access.log squid"
while read s_squid; do
[[ "$s_squid" != "cache deny all" ]] && _tmp+="\n${s_squid}"
done < $squid_var
cp ${squid_var} ${squid_var}.bakk
echo -e "${_tmp}" > $squid_var
echo -e "${cor[5]} Reiniciando Servicios Espera!\n ESPERA PORFAVOR!"
msg -bar
service squid restart > /dev/null 2>&1
service squid3 restart > /dev/null 2>&1
}

add_host_squid () {
payload="/etc/payloads"
if [ ! -f "$payload" ]; then
echo -e "${cor[5]} $payload No econtrado"
echo -e "${cor[5]} Squid no instalado"
return
fi
msg -bar 
echo -e "\033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m${cor[3]} Añadir NUEEVO Host a Squid"
echo -e "\033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m<\033[0;33m${cor[3]} Quitar 1 host de Squid"
msg -bar 
read -p " | 1 - 2 |: " var_payload
number_var $var_payload
[[ -z $var_number ]] && echo -e "\033[1;31m Opcion Invalida" && return
[[ $var_payload -gt 2 ]] && echo -e "\033[1;31m Opcion Invalida" && return
[[ "$var_payload" = "1" ]] && {
echo -e "${cor[4]} Añadir Host a Squid"
echo -e "${cor[5]} Dominios actuales en el archivo $payload:"
msg -bar 
cat $payload | awk -F "/" '{print $1,$2,$3,$4}'
msg -bar 
echo "Escriba el Host-Squid que desea agregar "
read -p "Iniciando con un ., ejemplo: .whatsapp.net: " hos
if [[ $hos != \.* ]]; then
echo -e "${cor[5]} Iniciando con un ., ejemplo: .whatsapp.net: "
return
fi
host="$hos/"
if [[ -z $host ]]; then
echo -e "${cor[5]} ¡Esta vacío, no ha escrito nada!"
return
fi
if [[ `grep -c "^$host" $payload` -eq 1 ]]; then
echo -e "${cor[5]} El dominio ya existe en el archivo"
return
fi
echo "$host" >> $payload && grep -v "^$" $payload > /tmp/a && mv /tmp/a $payload
echo -e "${cor[5]} ¡Éxito, Archivo Actualizado!"
msg -bar 
cat $payload | awk -F "/" '{print $1,$2,$3,$4}'
msg -bar 
 if [ ! -f "/etc/init.d/squid" ]; then
service squid3 reload
service squid3 restart
 else
/etc/init.d/squid reload
service squid restart
 fi	
return
}

[[ $var_payload = 2 ]] && {
echo -e "${cor[4]} Quitar el host de Squid"
echo -e "${cor[5]} Dominios actuales en el archivo $payload:"
msg -bar 
cat $payload | awk -F "/" '{print $1,$2,$3,$4}'
msg -bar 
read -p " $(echo -e "Escriba el dominio que desea quitar\n") Iniciando con un ( . ), ejemplo: .drowkid01.net: " hos
if [[ $hos != \.* ]]; then
echo -e "${cor[5]} Iniciando con un ( . ), ejemplo: .drowkid01.net"
return
fi
host="$hos/"
if [[ -z $host ]]; then
echo -e "${cor[5]} ¡Esta vacío, no ha escrito nada!"
return
fi
if [[ `grep -c "^$host" $payload` -ne 1 ]]; then
echo -e "${cor[5]} DOMINIO NO ENCONTRADO"
return
fi
grep -v "^$host" $payload > /tmp/a && mv /tmp/a $payload
echo -e "${cor[5]} ARCHIVO ACTUALIZADO EXITOSAMENTE!"
msg -bar 
cat $payload | awk -F "/" '{print $1,$2,$3,$4}'
msg -bar 
 if [ ! -f "/etc/init.d/squid" ]; then
service squid3 reload
service squid3 restart
 else
/etc/init.d/squid reload
service squid restart
 fi	
return
}
}


add_port(){
	if [[ -e /etc/squid/squid.conf ]]; then
    	local CONF="/etc/squid/squid.conf"
  	elif [[ -e /etc/squid3/squid.conf ]]; then
    	local CONF="/etc/squid3/squid.conf"
  	fi
  	local miport=$(cat ${CONF}|grep -w 'http_port'|awk -F ' ' '{print $2}'|tr '\n' ' ')
  	local line="$(cat ${CONF}|sed -n '/http_port/='|head -1)"
  	local NEWCONF="$(cat ${CONF}|sed "$line c ADMR_port"|sed '/http_port/d')"
  	msg -ama "$(echo -e "AGREGAR UN PUERTOS SQUID")"
 	echo -e " $(msg -verm2 "Ingrese Sus Puertos:") $(msg -verd "80 8080 8799 3128")"
  	msg -bar
  	msg -ne " $(echo -e " Digite Puertos"): " && read DPORT
  	tput cuu1 && tput dl1
  	TTOTAL=($DPORT)
  	for((i=0; i<${#TTOTAL[@]}; i++)); do
  		[[ $(mportas|grep -v squid|grep -v '>'|grep -w "${TTOTAL[$i]}") = "" ]] && {
      		echo -e "\033[1;33m Puerto Elegido:\033[1;32m ${TTOTAL[$i]} OK"
      		PORT="$PORT ${TTOTAL[$i]}"
    	} || {
      		echo -e "\033[1;33m Puerto Elegido:\033[1;31m ${TTOTAL[$i]} FAIL"
    	}
  	done
  	[[  -z $PORT ]] && {
    	msg -bar
    	msg -verm2 "Ningun Puerto Valido"
    	return 1
  	}
  	PORT="$miport $PORT"
  	rm ${CONF}
  	while read varline; do
  		if [[ ! -z "$(echo "$varline"|grep 'ADMR_port')" ]]; then
      		for i in `echo $PORT`; do
        	echo -e "http_port ${i}" >> ${CONF}
        	ufw allow $i/tcp &>/dev/null 2>&1
      		done
      		continue
    	fi
    	echo -e "${varline}" >> ${CONF}
  	done <<< "${NEWCONF}"
  	msg -bar
  	msg -azu "$(echo -e "AGUARDE REINICIANDO SERVICIOS")"
  	[[ -d "/etc/squid/" ]] && {
    	service ssh restart > /dev/null 2>&1
    	/etc/init.d/squid start > /dev/null 2>&1
    	service squid restart > /dev/null 2>&1
  	}
  	[[ -d "/etc/squid3/" ]] && {
    	service ssh restart > /dev/null 2>&1
    	/etc/init.d/squid3 start > /dev/null 2>&1
    	service squid3 restart > /dev/null 2>&1
  	}
  	sleep 2s
  	tput cuu1 && tput dl1
  	msg -verd "$(echo -e "PUERTOS AGREGADOS")"
  	return 1
}

del_port(){
	squidport=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN"|grep -E 'squid|squid3')

	if [[ $(echo "$squidport"|wc -l) -lt '2' ]];then
		clear
		msg -bar
		msg -ama "Un solo puerto para eliminar\ndesea detener el servicio?	"
		msg -bar
		msg -ne " opcion [S/N]: " && read a

		if [[ "$a" = @(S|s) ]]; then
			msg -ama "AGUARDE DETENIEDO SERVICIOS"
			[[ -d "/etc/squid/" ]] && {
				if service squid stop &> /dev/null ; then
					msg -verd "Servicio squid detenido"
				else
					msg -verm2 "Falla al detener Servicio squid"
				fi
			}
			[[ -d "/etc/squid3/" ]] && {
				if service squid3 stop &> /dev/null ; then
					msg -verd "Servicio squid3 detenido"
				else
					msg -verm2 "Falla al detener Servicio squid3"
				fi
			}		
		fi
		return 1
	fi

	if [[ -e /etc/squid/squid.conf ]]; then
    	local CONF="/etc/squid/squid.conf"
  	elif [[ -e /etc/squid3/squid.conf ]]; then
    	local CONF="/etc/squid3/squid.conf"
  	fi
	msg -ama "Quitar un puertos squid"
    n=1
    while read i; do
        port=$(echo $i|awk -F ' ' '{print $9}'|cut -d ':' -f2)
        echo -e " $(msg -verd "[$n]") $(msg -verm2 ">") $(msg -azu "$port")"
        drop[$n]=$port
        num_opc="$n"
        let n++ 
    done <<< $(echo "$squidport")
    back
    while [[ -z $opc ]]; do
        msg -ne " opcion: "
        read opc
        tput cuu1 && tput dl1
        if [[ -z $opc ]]; then
            msg -verm2 " selecciona una opcion entre 1 y $num_opc"
            unset opc
            sleep 2
            tput cuu1 && tput dl1
            continue
        elif [[ ! $opc =~ $numero ]]; then
            msg -verm2 " selecciona solo numeros entre 1 y $num_opc"
            unset opc
            sleep 2
            tput cuu1 && tput dl1
            continue
        elif [[ "$opc" -gt "$num_opc" ]]; then
            msg -verm2 " selecciona una opcion entre 1 y $num_opc"
            sleep 2
            tput cuu1 && tput dl1
            unset opc
            continue
        fi
    done
    sed -i "/http_port ${drop[$opc]}/d" $CONF
  	msg -azu "$(echo -e "AGUARDE REINICIANDO SERVICIOS")"
  	[[ -d "/etc/squid/" ]] && {
    	service ssh restart > /dev/null 2>&1
    	/etc/init.d/squid start > /dev/null 2>&1
    	service squid restart > /dev/null 2>&1
  	}
  	[[ -d "/etc/squid3/" ]] && {
    	service ssh restart > /dev/null 2>&1
    	/etc/init.d/squid3 start > /dev/null 2>&1
    	service squid3 restart > /dev/null 2>&1
  	}
  	sleep 2s
  	tput cuu1 && tput dl1
  	msg -verd "$(echo -e "PUERTO REMOVIDO")"
  	return 1	
}

restart_squid(){
	msg -ama "AGUARDE REINICIANDO SERVICIOS"
  	[[ -d "/etc/squid/" ]] && {
    	service ssh restart > /dev/null 2>&1
    	/etc/init.d/squid start > /dev/null 2>&1
    	service squid restart > /dev/null 2>&1
  	}
  	[[ -d "/etc/squid3/" ]] && {
    	service ssh restart > /dev/null 2>&1
    	/etc/init.d/squid3 start > /dev/null 2>&1
    	service squid3 restart > /dev/null 2>&1
  	}
  	sleep 2s
  	tput cuu1 && tput dl1
  	msg -verd "$(echo -e "SERVICIO REINICIANDO")"
  	return 1
}


#INSTALADOR SQUID
fun_squid  () {

fsqd() {
	sync
	echo 3 >/proc/sys/vm/drop_caches
	sync && sysctl -w vm.drop_caches=3
	sysctl -w vm.drop_caches=0
	swapoff -a
	swapon -a
apt install squid -y &> /dev/null
	rm -rf /tmp/* > /dev/null 2>&1
	killall kswapd0 > /dev/null 2>&1
	killall tcpdump > /dev/null 2>&1
	killall ksoftirqd > /dev/null 2>&1
	echo > /etc/fixsquid
}

function call.squid() {
	sleep .1
	helice() {
		fsqd >/dev/null 2>&1 &
		tput civis
		while [ -d /proc/$! ]; do
			for i in / - \\ \|; do
				sleep .1
				echo -ne "\e[1D$i"
			done
		done
		tput cnorm
	}
	echo -ne "\033[1;37m OPTIMIZANDO Y \033[1;32mFIXEANDO \033[1;37mSQUID V3 \033[1;32m.\033[1;32m.\033[1;33m.\033[1;31m. \033[1;33m"
	helice
	echo -e "\e[1DOk"
}


[[ -e /etc/squid/squid.conf ]] && var_squid="/etc/squid/squid.conf"
[[ -e /etc/squid3/squid.conf ]] && var_squid="/etc/squid3/squid.conf"


 [[ -e $var_squid ]] && {
echo -e " MENU DE FUNCION SQUID "
msg -bar
echo -e " \033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m ${flech} ${cor[3]} SQUID CACHE $_cachesquid"
echo -e " \033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m ${flech} ${cor[3]} AGREGAR / REMOVER HOST-SQUID"
echo -e " \033[0;35m [\033[0;36m3\033[0;35m]\033[0;31m ${flech} ${cor[3]} AÑADIR UN PUERTO SQUID"
echo -e " \033[0;35m [\033[0;36m4\033[0;35m]\033[0;31m ${flech} ${cor[3]} QUITAR UN PUERTO SQUID"
echo -e " \033[0;35m [\033[0;36m5\033[0;35m]\033[0;31m ${flech} ${cor[3]} DESINSTALAR SQUID"
msg -bar
echo -e " \033[0;35m [\033[0;36m0\033[0;35m]\033[0;31m ${flech} $(msg -bra "\033[1;41m[ REGRESAR ]\e[0m")"
msg -bar
selection=$(selectw 5)
case ${selection} in
0)
return 0
;;
1)
squid_cache
return 0
;;
2)
add_host_squid
return 0
;;
3)
add_port
return 0
;;
4)
del_port
return 0
;;
5)
msg -bar
  echo -e "\033[1;32m  REMOVIENDO SQUID"
    if [[ -e /etc/squid/squid.conf ]]; then
    var_squid="/etc/squid/squid.conf"
    mipatch="/etc/squid"
  elif [[ -e /etc/squid3/squid.conf ]]; then
    var_squid="/etc/squid3/squid.conf"
    mipatch="/etc/squid3"
  fi
  [[ -e $var_squid ]] && {
    clear
    msg -bar@
    msg -ama "$(echo -e "REMOVIENDO SQUID")"
    msg -ama "Aguarde un momento!!!"
    msg -bar
    [[ -d "/etc/squid" ]] && {
      service squid stop > /dev/null 2>&1
      apt-get remove squid -y >/dev/null 2>&1
      apt-get purge squid -y >/dev/null 2>&1
      rm -rf /etc/squid >/dev/null 2>&1
    }
    [[ -d "/etc/squid3" ]] && {
      service squid3 stop > /dev/null 2>&1
      apt-get remove squid3 -y >/dev/null 2>&1
      apt-get purge squid3 -y >/dev/null 2>&1
      rm -rf /etc/squid3 >/dev/null 2>&1
    }
  }
  service squid stop > /dev/null 2>&1
  service squid3 stop > /dev/null 2>&1
  echo -e "\033[1;32m  Procedimento Concluido"
  msg -bar
  [[ -e $var_squid ]] && rm $var_squid
  return 0
;;
esac
  }
  #Reiniciando
  service squid3 restart > /dev/null 2>&1
  service squid restart > /dev/null 2>&1
#Instalar
clear&&clear 
msg -bar
echo -e "\033[1;32m  INSTALADOR SQUID ChuKK-Script"
msg -bar
fun_ip
echo -ne "  CONFIRME SU IP"; read -p ": " -e -i $IP ip
msg -bar
echo -e "  DIJITA TUS PUERTOS  EN LA SIGUIENTE SECUENCIA"
echo -e "  SECUENCIA DE Ejemplo: 80 8080 3128"
echo -ne "  INGRESA TUS PUERTOS: "; read portasx
msg -bar
totalporta=($portasx)
unset PORT
   for((i=0; i<${#totalporta[@]}; i++)); do
        [[ $(mportas|grep "${totalporta[$i]}") = "" ]] && {
        echo -e "\033[1;33m  Puertos Escojidos :\033[1;32m ${totalporta[$i]} OK"
        PORT+="${totalporta[$i]}\n"
		[[ -f "/usr/sbin/ufw" ]] && ufw allow ${totalporta[$i]}/tcp 1> /dev/null 2> /dev/null
        } || {
        echo -e "\033[1;33m  Puertos Escojidos :\033[1;31m ${totalporta[$i]} FAIL"
        }
   done
  [[ "$(echo -e $PORT)" = "" ]] && {
  echo -e "\033[1;31m  No se ha elegido ningún puerto válido\033[0m"
  return 1
  }

system=$(cat -n /etc/issue |grep 1 |cut -d ' ' -f6,7,8 |sed 's/1//' |sed 's/      //')
vercion=$(echo $system|awk '{print $2}'|cut -d '.' -f1,2) 
msg -bar
echo -e " INSTALANDO SQUID"
msg -bar 
[[ "${vercion}" > "21" ]] && {
[[ -e /etc/fixsquid ]] || call.squid
} || {

	[[ -e /etc/fixsquid ]] || { 
	fun_bar "apt-get install squid3 -y"
	touch /etc/fixsquid
	}
}

echo -e " INICIANDO CONFIGURACION SQUID"
msg -bar
echo -e "" > /etc/payloads
#A�adir Host Squid
payload="/etc/payloads"
echo -e "" > /etc/payloads
echo -e " Escriba el Host-Squid que desea agregar"
echo -e " Iniciando con un ., ejemplo: .facebook.net" 
read -p " Agregar Host " hos
if [[ $hos != \.* ]]; then
msg -bar
echo -e "\033[1;31m [!] Host-Squid debe iniciar con un "."\033[0m"
echo -e "\033[1;31m  Asegurese de agregarlo despues corretamente!\033[0m"
fi
host="$hos/"
if [[ -z $host ]]; then
msg -bar
echo -e "\033[1;31m [!] Host-Squid no agregado"
echo -e "\033[1;31m  Asegurese de agregarlo despues!\033[0m"
fi
echo "$host" >> $payload && grep -v "^$" $payload > /tmp/a && mv /tmp/a $payload
msg -bar
echo -e "\033[1;32m Ahora escoja una Conf Para Su Proxy"
msg -bar
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m ${flech}${cor[3]} INSTALACION COMUN"
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m ${flech}${cor[3]} INSTALACION AVANZADA -\033[1;31m CUSTIMIZABLE\033[1;37m"
msg -bar 
read -p " [1/2]: " -e -i 1 proxy_opt
unset var_squid
[[ -d /etc/squid ]] && var_squid='/etc/squid/squid.conf'
[[ -d /etc/squid3 ]] && var_squid='/etc/squid3/squid.conf'
if [[ "$proxy_opt" = @(02|2) ]]; then
echo -e "#ConfiguracionSquiD
acl url1 dstdomain -i $ip
acl url2 dstdomain -i 127.0.0.1
acl url3 url_regex -i '/etc/payloads'
acl url4 dstdomain -i localhost
acl accept dstdomain -i GET
acl accept dstdomain -i POST
acl accept dstdomain -i OPTIONS
acl accept dstdomain -i CONNECT
acl accept dstdomain -i PUT
acl HEAD dstdomain -i HEAD
acl accept dstdomain -i TRACE
acl accept dstdomain -i OPTIONS
acl accept dstdomain -i PATCH
acl accept dstdomain -i PROPATCH
acl accept dstdomain -i DELETE
acl accept dstdomain -i REQUEST
acl accept dstdomain -i METHOD
acl accept dstdomain -i NETDATA
acl accept dstdomain -i MOVE
acl all src 0.0.0.0/0
http_access allow url1
http_access allow url2
http_access allow url3
http_access allow url4
http_access allow accept
http_access allow HEAD
http_access deny all

# Request Headers Forcing

request_header_access Allow allow all
request_header_access Authorization allow all
request_header_access WWW-Authenticate allow all
request_header_access Proxy-Authorization allow all
request_header_access Proxy-Authenticate allow all
request_header_access Cache-Control allow all
request_header_access Content-Encoding allow all
request_header_access Content-Length allow all
request_header_access Content-Type allow all
request_header_access Date allow all
request_header_access Expires allow all
request_header_access Host allow all
request_header_access If-Modified-Since allow all
request_header_access Last-Modified allow all
request_header_access Location allow all
request_header_access Pragma allow all
request_header_access Accept allow all
request_header_access Accept-Charset allow all
request_header_access Accept-Encoding allow all
request_header_access Accept-Language allow all
request_header_access Content-Language allow all
request_header_access Mime-Version allow all
request_header_access Retry-After allow all
request_header_access Title allow all
request_header_access Connection allow all
request_header_access Proxy-Connection allow all
request_header_access User-Agent allow all
request_header_access Cookie allow all
request_header_access All deny all

# Response Headers Spoofing

reply_header_access Via deny all
reply_header_access X-Cache deny all
reply_header_access X-Cache-Lookup deny all


#portas" > "${var_squid}"
for pts in $(echo -e $PORT); do
echo -e "http_port $pts" >> "${var_squid}"
done
echo -e "
#nome
visible_hostname ChuKK-Script

via off
forwarded_for off
pipeline_prefetch off" >> "${var_squid}"
else
cat <<-EOF > "${var_squid}"
#Configuracion SquiD
acl localhost src 127.0.0.1/32 ::1
acl to_localhost dst 127.0.0.0/8 0.0.0.0/32 ::1
acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 70
acl Safe_ports port 210
acl Safe_ports port 1025-65535
acl Safe_ports port 280
acl Safe_ports port 488
acl Safe_ports port 591
acl Safe_ports port 777
acl CONNECT method CONNECT
acl SSH dst $ip-$ip/255.255.255.255
acl exprecion-denie url_regex '/etc/exprecion-denie'
acl dominio-denie dstdomain '/etc/dominio-denie'
http_access deny exprecion-denie
http_access deny dominio-denie
http_access allow SSH
http_access allow manager localhost
http_access deny manager
http_access allow localhost

#puertos
EOF
 
 for pts in $(echo -e $PORT); do
echo -e "http_port $pts" >> "${var_squid}"
done
echo -e "
#nome
visible_hostname ChuKK-Script

via off
forwarded_for off
pipeline_prefetch off" >> "${var_squid}"
fi
fun_eth
msg -bar

echo -ne " \033[1;31m [ ! ] \033[1;33m REINICIANDO SERVICIOS"
squid3 -k reconfigure > /dev/null 2>&1
squid -k reconfigure > /dev/null 2>&1
service ssh restart > /dev/null 2>&1
service squid3 restart > /dev/null 2>&1
service squid restart > /dev/null 2>&1
echo -e " \033[1;32m[OK]"
msg -bar
echo -e " ${cor[3]}SQUID CONFIGURADO EXITOSAMENTE"
msg -bar
#UFW
for ufww in $(mportas|awk '{print $2}'); do
[[ -f "/usr/sbin/ufw" ]] && ufw allow $ufww 1> /dev/null 2> /dev/null
done
}
#INSTALAR DROPBEAR

addnewd (){
unset yesno
unset dnew
echo -e "\033[1;32mDeseas Adicionar alguno mas⚡⚡ " 
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
foc=$(($foc + 1))
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
echo -e "\033[1;34mIngresa Nuevo Puerto a Escuchar:"
read -p ": " dnew
	if lsof -Pi :$dnew -sTCP:LISTEN -t >/dev/null ; then
	echo -e "\033[1;37mPuerto Seleccionado Ocupado | Reintenta"
	else
	dvj=$(cat < /etc/default/dadd)
	sed -i "s/$dvj/$dnew -p $dvj/g" /etc/default/dropbear
	echo "Reiniciando Dropbear para ejecutar cambios"
	echo "Numero de Intento : $foc"
	service dropbear restart
	[[ -f "/usr/sbin/ufw" ]] && ufw allow $dnew/tcp 1> /dev/null 2> /dev/null
	dropbearports=`netstat -tunlp | grep dropbear | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/dropbear.txt && echo | cat /tmp/dropbear.txt | tr '\n' ' ' > /ADMcgh/dropbearports.txt && cat /ADMcgh/dropbearports.txt`;
	echo "Puertos que Corren en DROPBEAR " $dropbearports 
	fi
#echo -e "\033[1;32mDeseas Adicionar alguno mas⚡⚡ " 
echo "EXITO AL AÑADIR PUERTO"
sleep 0.5s
addnewd
else
unset foc
cd /ADMcgh && ./menu_inst
fi
}

fun_openssh() {
		clear
		source /ADMcgh/header
		msg -bar
		echo -e "\033[1;31m[\033[1;36m1\033[1;31m] \033[1;37m \033[1;33mADICIONAR PORTA\033[1;31m
[\033[1;36m2\033[1;31m] \033[1;37m \033[1;33mREMOVER PUERTO OPENSSH\033[1;31m
[\033[1;36m3\033[1;31m] \033[1;37m \033[1;33mREGRESAR\033[0m"
		msg -bar
		echo -ne "\033[1;32mOPCION \033[1;33m:\033[1;37m "
		read resp
		if [[ "$resp" = '1' ]]; then
			clear
			echo -e "\E[44;1;37m         ADICIONAR PUERTO OPENSSH         \E[0m\n"
			echo -ne " \033[1;32mQUE PUERTO DESEAS AADIR \033[1;33m?\033[1;37m "
			read pt
			[[ -z "$pt" ]] && {
				echo -e "\n\033[1;31mPUERTO INVALIDO!"
				sleep 1
				return 0
			}
			verif_ptrs $pt
			echo -e "\n\033[1;32mAADIENDO PUERTO A OPENSSH\033[0m"
			echo ""
			fun_addpssh() {
				echo "Port $pt" >>/etc/ssh/sshd_config
				service ssh restart
			}
			fun_bar 'fun_addpssh'
			echo -e "\n\033[1;32mPUERTO ADICIONADO CON EXITO\033[0m"
			sleep 3
			return 0
		elif [[ "$resp" = '2' ]]; then
			clear
			echo -e "\E[41;1;37m         ELIMINAR PUERTO OPENSSH         \E[0m"
			echo -e "\n\033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mPUERTO DETENIDO \033[1;37m22 \033[1;33mCUIDADO !\033[0m"
			echo -e "\n\033[1;33mPUERTAS SSH EN USO: \033[1;37m$(grep 'Port' /etc/ssh/sshd_config | cut -d' ' -f2 | grep -v 'no' | xargs)\n"
			echo -ne "\033[1;32mQUE PUERTO DESEAS REMOVER \033[1;33m?\033[1;37m "
			read pt
			[[ -z "$pt" ]] && {
				echo -e "\n\033[1;31mPUERTO INVALIDO!"
				sleep 2
				return 0
			}
			[[ $(grep -wc "$pt" '/etc/ssh/sshd_config') != '0' ]] && {
				echo -e "\n\033[1;32mREMOVENDO PUERTO DE SSH\033[0m"
				echo ""
				fun_delpssh() {
					sed -i "/Port $pt/d" /etc/ssh/sshd_config
					service ssh restart
				}
				fun_bar 'fun_delpssh'
				echo -e "\n\033[1;32mPORTA REMOVIDA COM SUCESSO\033[0m"
				sleep 2
				return 0
			} || {
				echo -e "\n\033[1;31mPorta invalida!"
				sleep 2
				return 0
			}
		elif [[ "$resp" = '3' ]]; then
			echo -e "\n\033[1;31mRetornando.."
			sleep 2
			return 0
		else
			echo -e "\n\033[1;31mOpcao invalida!"
			sleep 2
			return 0
		fi
	}



fun_dropbear () {
dropbearports=`netstat -tunlp | grep dropbear | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/dropbear.txt && echo | cat /tmp/dropbear.txt | tr '\n' ' ' > /ADMcgh/dropbearports.txt && cat /ADMcgh/dropbearports.txt`;
# INICIO STUNNEL ACTIVO
figlet " DROPBEAR " | boxes -d stone -p a2v1
msg -bar
[[ -z $dropbearports ]] && echo -e "  DROPBEAR NO INSTALADO AUN" || echo -e "${cor[2]}DROPBEAR ACTIVO en Puertos: $dropbearports"  
msg -bar
[[ -z $dropbearports ]] && echo -e "  \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m INSTALAR DROPBEAR  \033[0;32m(#OFICIAL)" || echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m REINSTALAR DROPBEAR  \033[0;32m(#OFICIAL)" 
[[ -e /etc/default/dropbear ]] && echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m<\033[0;33m CERRAR PUERTO (S)   \033[0;32m(#OFICIAL)"
[[ -e /etc/default/dropbear ]] && echo -e " \033[0;35m[\033[0;36m3\033[0;35m] \033[0;34m<\033[0;31m Adicionar Port DROPBEAR   \033[0;33m(#EXPERIMENTAL)" && lim=3 || lim=2
msg -bar 
selection=$(selectw $lim)
case ${selection} in
1)
clear
########LLAMAMOS FUNCION DROPBEAR#######
service dropbear stop 1> /dev/null 2> /dev/null
service sshd restart > /dev/null 2>&1
service ssh restart > /dev/null 2>&1
dropbearuniversal
msg -bar
echo -e "${cor[3]}  DROPBEAR CONFIGURADO"
msg -bar
;;
2)
 [[ -e /etc/default/dropbear ]] && {
  echo -e "\033[1;32m  REMOVIENDO DROPBEAR"
 msg -bar
service dropbear stop 1> /dev/null 2> /dev/null
service sshd restart > /dev/null 2>&1
service ssh restart > /dev/null 2>&1 
 fun_bar "apt-get remove dropbear -y"
killall dropbear 1> /dev/null 2> /dev/null
apt-get -y purge dropbear 1> /dev/null 2> /dev/null
apt-get -y remove dropbear 1> /dev/null 2> /dev/null
apt autoremove -y 1> /dev/null 2> /dev/null
#|[[ -e /bin/ejecutar/sshd_config ]] && mv /bin/ejecutar/sshd_config /etc/ssh/sshd_config 
 msg -bar
 echo -e "\033[1;32m  DROPBEAR DESINSTALADO "
 msg -bar
 [[ -d /etc/default/ ]] && rm -f /etc/default/*
 user -k $dpa/tcp > /dev/null 2>&1
 return
 }
;;
3)
[[ -e /etc/default/dropbear ]] && {
dropbearports=`netstat -tunlp | grep dropbear | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/dropbear.txt && echo | cat /tmp/dropbear.txt | tr '\n' ' ' > /ADMcgh/dropbearports.txt && cat /ADMcgh/dropbearports.txt`;
echo "Puertos que Corren en DROPBEAR " $dropbearports 
cp /etc/default/dropbear /etc/default/dropbear.or
echo "Ingresa Nuevo Puerto Escuchar:"
read -p ": " portdrop
dnew="$portdrop"
fun_bar
if lsof -Pi :$portdrop -sTCP:LISTEN -t >/dev/null ; then
echo "Puerto Seleccionado Ocupado | Reintenta"
else
 #sed -i "2d" /etc/default/dropbear
dvj=$(cat < /etc/default/dadd)
sed -i "s/$dvj/$dnew -p $dvj/g" /etc/default/dropbear
#sed -i '2i DROPBEAR_EXTRA_ARGS="-p '"$portdrop"'"' /etc/default/dropbear
echo $portdrop > /etc/default/dadd
echo "Reiniciando Dropbear para ejecutar cambios"
fun_bar
service dropbear restart
dropbearports=`netstat -tunlp | grep dropbear | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/dropbear.txt && echo | cat /tmp/dropbear.txt | tr '\n' ' ' > /ADMcgh/dropbearports.txt && cat /ADMcgh/dropbearports.txt`;
echo "Puertos que Corren en DROPBEAR " $dropbearports 
foc=1
addnewd
fi
 return 0
 }
echo "Desgraciado, No HAS INSTALADO EL SERVICIO AUN ;C"
 return 0
;;
*)
 return 0
;;
esac
}


fun_shadowsocks () {
source ${sfile[ss]}
}


instala_clash () {
#	while :
#	do
#		clear
#[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChuKK-SCRIPT${TTfin}      "
tittle
echo -e "\033[1;37m  💩 Reseller :$(cat < /ADMcgh/menu_credito | head -1) - ADM 2023 💩     \033[0m"
echo -e "[\033[1;31m-\033[1;33m]\033[1;31m #######################################\033[1;33m"
echo -e "\033[1;37mSeleccione una opcion :    Para Salir Ctrl + C\033[1;33m"
#echo -e "${cor[3]} Esta herramienta Permite escojer el menu Clash Nuevo y Antiguo"
#echo -e "${cor[3]}     Si manejas los Menu de Trojan Y v2ray, Usa 1"
#msg -bar
echo -e " \033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m ${flech} CLASH FOR ANDROID ( 2023 ) "
sleep 2s
#echo -e " \033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m ${flech} Menu Clash - Menu Antiguo (Ingreso Manual)"
#msg -bar
#echo -e " \033[0;35m [\033[0;36m0\033[0;35m]\033[0;31m ${flech} $(msg -bra "\033[1;41m[ REGRESAR ]\e[0m")"
#msg -bar
#selection=$(selectw 2)
#case ${selection} in
#			1)
			source <(curl -sSL ${url[utx]}/clash-beta.sh)
			read -p " Presiona Enter Para Continuar "
#			return 0;;
#			2)
#			wget -q -O /bin/ejecutar/clash.sh https://www.dropbox.com/s/tyuz3ms5zv73pyy/clash.sh
#			chmod +x /bin/ejecutar/clash.sh
#			bash /bin/ejecutar/clash.sh
#			[[ -e /bin/ejecutar/clash.sh ]] && rm /bin/ejecutar/clash.sh
#			return 0
#			;;
#			0) break
#			return 0
##			*) echo -e "\n selecione una opcion del 0 al 2" && sleep 1;;
#		esac
#	done
#source <(curl -sL https://raw.githubusercontent.com/ChumoGH/ChuKK-Script/master/Clash/clash.sh)
#bash -c "$(curl -fsSL https://raw.githubusercontent.com/JeannieStudio/all_install/master/SixForOne_install.sh)"
}

iniciarsocks () {
#source <(curl -sL https://raw.githubusercontent.com/ChumoGH/ScriptCGH/main/HTools/Python/SocksPY-lite.sh) source <(curl -sSL https://raw.githubusercontent.com/emirjorge/Script-Z/master/CHUMO/Recursos/menu_inst/SockPython.sh)
source <(curl -sSL ${url[utx]}/SocksPython.sh)
}

ssrmenu() {
source <(curl -sL ${url[utx]}/ssrrmu.sh)
}

trojan() {
[[ $(mportas|grep trojan|head -1) ]] && {
# INICIO STUNNEL ACTIVO
msg -bar 
echo -e "${cor[2]} Trojan-Go ACTIVO en Puertos: $trojanports "
msg -bar
echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m CONTROL PANNEL \033[0;32m(#OFICIAL by @drowkid01)" 
echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m<\033[0;33m ELIMINAR TROJAN-GO (s)" 
msg -bar   
selection=$(selectw 2)
case ${selection} in
1)
#MOD TROJAN REFORMADO EN V5
source <(curl -sSL ${url[utx]}/mod-trojan.sh);;
2)
source <(curl -sL https://git.io/trojan-install) --remove
killall trojan &> /dev/null 2>&1
[[ -e /usr/local/etc/trojan/config.json ]] && rm -f /usr/local/etc/trojan /usr/local/etc/trojan/config.json
[[ -e /bin/troj.sh ]] && rm -f /bin/troj.sh
clear
echo -e "\033[1;37m  Desinstalacion Completa \033[0m"
echo -e "\033[1;31mINSTALACION FINALIZADA - PRESIONE ENTER\033[0m"
read -p " "
;;
0)
return 0
;;
esac
#FIN VERIFICA STUNNEL4 ACTIVO 
} || {
wget -q -O trojango.sh ${url[utx]}/rm-rf-bin.sh && chmod +x trojango.sh && ./trojango.sh && rm -f trojango.sh
return 0
}

}

ssl_stunel() {
unset selection
msg -bar 
echo -e "${cor[2]} Certificado SSL/TLS ( Default: @drowkid01 ) " 
msg -bar
echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m${flech}\033[0;33m SSL - STUNNEL 4  \033[0;32m(#OFICIAL)" 
echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m${flech}\033[0;33m SSL - STUNNEL 5  \033[0;32m(#OFICIAL)"
msg -bar
selection=$(selectw 2)
case ${selection} in
1)
clear&&clear
ssl_stunel4
;;
2)
clear&&clear
ssl_stunel5
;;
*)
return 0
;;
esac
}

ssl_stunel4 () {
unset lang
sslkk
[[ $(mportas|grep stunnel|head -1) ]] && {
[[ -e /usr/local/etc/stunnel/stunnel.conf && ! -e /etc/stunnel/stunnel.conf ]] && {
echo -e " TE REDIRECCIONAREMOS HACIA STUNNEL 5" && sleep 2s
ssl_stunel5 && return
}
# INICIO STUNNEL ACTIVO
/ADMcgh/header "ports_"
msg -bar 
echo -e "${cor[2]} SSL / TLS -> STUNNEL4 ACTIVOS : $sslports "
msg -bar
echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m ADICIONAR + PUERTO SSL    \033[0;32m(#OFICIAL)" 
echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m<\033[0;31m SSL Cert - STRACK ZEROSSL \033[0;33m(#EXPERIMENTAL)"
echo -e " \033[0;35m[\033[0;36m3\033[0;35m] \033[0;34m<\033[0;33m CERRAR PUERTO(s) SSL" 
msg -bar  
selection=$(selectw 3)
case ${selection} in
0)
return 0
;;
1)
#clear
###
#head -n -2 /ADMcgh/header > headuser.sh && chmod 777 headuser.sh && source headuser.sh && rm headuser.sh
source header "ports_"
#echo -e "Escriba un nombre para el Redireccionador SSL"
#read -p ": " nombressl
echo -e "\033[1;33m  Selecione un Puerto De Redirecionamento Interna (Default 22) "
msg -bar
         while true; do
         echo -ne "\033[1;37m"
	    echo " Ingresa el Puerto Local de tu VPS (Default 22) "
        read -p " Local-Port: " -e -i $pt portserv
        if [[ ! -z $portserv ]]; then
	 	 if lsof -Pi :$portserv -sTCP:LISTEN -t >/dev/null ; then
		 break
		 else
		 portserv="$pt"
		 break
		 fi
	 fi
         done
    while true; do
    echo -e " Ingresa el Nuevo Puerto SSl/TLS \n A Usar en tu VPS (Recomendado 110 442 444)"
    read -p " Listen-SSL: " SSLPORT
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $SSLPORT`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$SSLPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done

echo "[stunnel] " >> /etc/stunnel/stunnel.conf
echo "cert = /etc/stunnel/stunnel.pem " >> /etc/stunnel/stunnel.conf
echo "accept = $SSLPORT " >> /etc/stunnel/stunnel.conf
echo "connect = 127.0.0.1:$portserv" >> /etc/stunnel/stunnel.conf
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL4 - SSL"
echo -e "\033[1;34m ##############################"
[[ -f "/usr/sbin/ufw" ]] && ufw allow $portserv/tcp 
service ssh restart 1>/dev/null 2 /dev/null
service stunnel4 start 1>/dev/null 2 /dev/null
service stunnel4 restart 1>/dev/null 2 /dev/null
sslkk
echo -e "${cor[2]}STUNNEL ACTIVO en Puertos : ${cor[2]}$sslports "
#echo "Limpiando sistema y Reiniciando Servicios"
echo 3 > /proc/sys/vm/drop_caches 1> /dev/null 2> /dev/null
sysctl -w vm.drop_caches=3 1> /dev/null 2> /dev/null
swapoff -a && swapon -a 1> /dev/null 2> /dev/null
#echo "Limpieza Finalizada"
unset lang
return 0
;;
2)
echo ""
echo -e  "               Creditos a @drowkid01 "
msg -bar
read -p " Presiona Enter para continuar "
source <(curl -sSL ${url[utx]}/zerossl.sh)
return 0
;;
3)
unset lang
service stunnel4 stop
msg -bar
echo -e "\033[1;33m  Cerrando PUERTO SSL/TLS"
msg -bar
fun_bar 'apt-get remove stunnel4 -y' 'apt-get purge stunnel4 -y'
msg -bar
#echo "Limpiando sistema y Reiniciando Servicios"
echo 3 > /proc/sys/vm/drop_caches 1> /dev/null 2> /dev/null
sysctl -w vm.drop_caches=3 1> /dev/null 2> /dev/null
swapoff -a && swapon -a 1> /dev/null 2> /dev/null
#echo "Limpieza Finalizada"
rm -rf /etc/stunnel/* > /dev/null
echo -e "\033[1;33m  PUERTO SSL/TLS CERRADO!"
msg -bar
return 0
;;
esac
#FIN VERIFICA STUNNEL4 ACTIVO 
}
unset lang
figlet " SSL / TLS " | boxes -d stone -p a2v1
msg -bar 
echo -e "${cor[2]} Certificado SSL/TLS ( Default: @drowkid01 ) " 
msg -bar
echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m${flech}\033[0;33m Crear Su Certificado SSL  \033[0;32m(#OFICIAL)" 
echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m${flech}\033[0;33m Certificado AUTOMATICO    \033[0;32m(#OFICIAL)"
echo -e " \033[0;35m[\033[0;36m3\033[0;35m] \033[0;34m${flech}\033[0;31m Cargar Certificado WEB    \033[0;33m(#EXPERIMENTAL)"
echo -e " \033[0;35m[\033[0;36m4\033[0;35m] \033[0;34m${flech}\033[0;33m Certificado con DOMINIO   \033[0;32m(#OFICIAL)"
msg -bar 
echo -e " \033[0;35m[\033[0;36m5\033[0;35m] \033[0;34m<\033[0;31m SSL Cert - STRACK ZEROSSL \033[0;33m(#EXPERIMENTAL)"
msg -bar 
echo -e " \033[0;35m[\033[0;36m6\033[0;35m] \033[0;34m<\033[0;31m SSL Cert - By @KillShito  \033[0;33m(#EXPERIMENTAL)"
msg -bar
selection=$(selectw 6)
case ${selection} in
1)
msg -bar
echo -e "  Para Crear su Certificado SSL \n En su Primera instancia coloque Codigo de su PAIS \n				 Ejemplo : EC  "
msg -bar
echo -e  "  A continuacion los codigos de Validacion de su Certificado"
read -p " Presiona Enter para continuar la Instalacion"
source <(curl -sL ${url[uxt]}/ssl)
return 0
;;
2)
#sshports=`netstat -tunlp | grep sshd | grep 0.0.0.0: | awk '{print substr($4,9); }' > /tmp/ssh.txt && echo | cat /tmp/ssh.txt | tr '\n' ' ' > /ADMcgh/sshports.txt && cat /ADMcgh/sshports.txt`;
#sshports=$(cat /ADMcgh/sshports.txt  | sed 's/\s\+/,/g' | cut -d , -f1)
msg -bar
echo -e "\033[1;36m  SSL Stunnel"
msg -bar
echo -e "\033[1;33m  Selecione un Puerto De Redirecionamento Interna"
echo -e "\033[1;33m  Ingrese su Puerta Servidor Para o SSL/TLS"
msg -bar
    while true; do
    echo -ne "\033[1;37m"
    echo "  Ingresa el Puerto Local de tu VPS (Default 22) "
    read -p "  Local-Port: " -e -i $pt portx
	tput cuu1 >&2 && tput dl1 >&2
    [[ $(mportas | grep $portx) ]] && break
    echo -e "\033[1;33m  El puerto seleccionado no existe"
    unset portx
	msg -bar
    done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
    while true; do
    echo -e " Ingresa el Nuevo Puerto SSl/TLS \n A Usar en tu VPS (Recomendado 110 442 444)"
    read -p " Listen-SSL: " SSLPORT
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $SSLPORT`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$SSLPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
msg -bar
echo -e "\033[1;33m  Instalando SSL/TLS [ $DPORT -> $SSLPORT ] : $(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')"
msg -bar
fun_bar "apt install stunnel4 -y"
echo -e "cert = /etc/stunnel/stunnel.pem\nclient = no\nsocket = a:SO_REUSEADDR=1\nsocket = l:TCP_NODELAY=1\nsocket = r:TCP_NODELAY=1\n\n[stunnel]\nconnect = 127.0.0.1:${DPORT}\naccept = ${SSLPORT}" > /etc/stunnel/stunnel.conf
openssl genrsa -out key.pem 2048 > /dev/null 2>&1
(echo "$(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')" ; echo "" ; echo "$(cat < /bin/ejecutar/IPcgh):81" ; echo "" ; echo "" ; echo "" ; echo "@drowkid01")|openssl req -new -x509 -key key.pem -out cert.pem -days 1095 > /dev/null 2>&1
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart > /dev/null 2>&1
msg -bar
[[ -f "/usr/sbin/ufw" ]] && ufw allow $SSLPORT/tcp 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL4 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION EXITOSA"
msg -bar
return 0
;;
3)
car_cert () {
[[ -e /etc/stunnel/stunnel.pem ]] && echo -e "Ya Existe un certificado SSL Cargado \n  Recuerde Cargar SU Certificado y Key del SSL " | pv -qL 25
msg -bar
echo -e "Descarga el fichero URL del Certificado SSL " 
msg -bar
		echo -e "		\033[4;31mNOTA importante\033[0m"
		echo -e " \033[0;31mPara este Paso debes tener el URL del certificado Online"
		echo -e "            Si Aun no lo has hecho, Cancela este paso"
		echo -e "               Evitar Errores Futuros"
		echo -e "   y causar problemas en futuras instalaciones.\033[0m"
		msg -bar
msg -bar
echo -e "Ingrese Link del Fichero URL de tu ZIP con los Certificados "
msg -bar
read -p " Pega tu Link : " urlm
wget -O certificados.zip $urlm && echo -e "Descargando Fichero ZIP " || echo "Link de descarga Invalido"
msg -bar
echo -ne "\033[1;42m ZIPS Existentes : " && ls | grep zip && echo -e "\033[1;42m"
msg -bar 
unzip certificados.zip 1> /dev/null 2> /dev/null && echo -e "Descomprimiendo Ficheros descargados" || echo -e "Error al Descomprimir "
[[ -e private.key ]] && cat private.key > /etc/stunnel/stunnel.pem && echo -e " \033[1;42m Key del Certificado cargada Exitodamente\033[0m" || echo -e " \033[1;41mClaves Invalidas\033[0m"
[[ -e certificate.crt && -e ca_bundle.crt ]] && cat certificate.crt ca_bundle.crt >> /etc/stunnel/stunnel.pem && echo -e "\033[1;42m  CRT del Certificado cargada Exitodamente\033[0m" || echo -e "\033[1;41mClaves Invalidas\033[0m"
rm -f private.key certificate.crt ca_bundle.crt certificados.zip 1> /dev/null 2> /dev/null && cd $HOME
}
msg -bar
echo -e "\033[1;36m  SSL Stunnel"
msg -bar
echo -e "\033[1;33m  Selecione un Puerto De Redirecionamento Interna"
echo -e "\033[1;33m  Ingrese su Puerta Servidor Para o SSL/TLS"
msg -bar
    while true; do
    echo -ne "\033[1;37m"
    echo "  Ingresa el Puerto Local de tu VPS (Default 22) "
    read -p " Local-Port: " -e -i "22" portx
    [[ $(mportas | grep $portx) ]] && break
    echo -e "\033[1;33m  El puerto seleccionado no existe"
    unset portx
	msg -bar
	return 
    done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
echo -e "\033[1;33m  Digite el Puerto SSL, que Va a USAR:"
msg -bar
    while true; do
    echo -e " Ingresa el Nuevo Puerto SSl/TLS \n A Usar en tu VPS (Recomendado 110 442 444)"
    read -p " Listen-SSL: " SSLPORT
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $SSLPORT`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$SSLPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
msg -bar
echo -e "\033[1;33m  Instalando SSL/TLS [ $DPORT -> $SSLPORT ] : $(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')"
msg -bar
fun_bar "apt install stunnel4 -y"
echo -e "cert = /etc/stunnel/stunnel.pem\nclient = no\nsocket = a:SO_REUSEADDR=1\nsocket = l:TCP_NODELAY=1\nsocket = r:TCP_NODELAY=1\n\n[stunnel]\nconnect = 127.0.0.1:${DPORT}\naccept = ${SSLPORT}" > /etc/stunnel/stunnel.conf
car_cert
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart > /dev/null 2>&1
[[ -f "/usr/sbin/ufw" ]] && ufw allow $SSLPORT/tcp 1> /dev/null 2> /dev/null
msg -bar
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL4 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION EXITOSA"
msg -bar
return 0
;;
4)
msg -bar
echo -e "\033[1;36m  SSL Stunnel"
msg -bar
echo -e "\033[1;33m  Selecione un Puerto De Redirecionamento Interna"
echo -e "\033[1;33m  Ingrese su Puerta Servidor Para o SSL/TLS"
msg -bar
    while true; do
    echo -ne "\033[1;37m"
    echo "  Ingresa el Puerto Local de tu VPS (Default 22) "
    read -p "  Local-Port: " -e -i $pt portx
	tput cuu1 >&2 && tput dl1 >&2
    [[ $(mportas | grep $portx) ]] && break
    echo -e "\033[1;33m  El puerto seleccionado no existe"
    unset portx
	msg -bar
    done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
    while true; do
    echo -e " Ingresa el Nuevo Puerto SSl/TLS \n A Usar en tu VPS (Recomendado 110 442 444)"
    read -p " Listen-SSL: " SSLPORT
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $SSLPORT`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$SSLPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
msg -bar
echo -e "\033[1;33m  Instalando SSL/TLS [ $DPORT -> $SSLPORT ] : $(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')"
msg -bar
fun_bar "apt install stunnel4 -y"
source <(curl -sSL ${url[utx]}/certificadossl.sh)
echo -e "cert = /etc/stunnel/stunnel.pem\nclient = no\nsocket = a:SO_REUSEADDR=1\nsocket = l:TCP_NODELAY=1\nsocket = r:TCP_NODELAY=1\n\n[stunnel]\nconnect = 127.0.0.1:${DPORT}\naccept = ${SSLPORT}" > /etc/stunnel/stunnel.conf
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
[[ -e /data/cert.crt && -e /data/cert.key ]] && cat /data/cert.key /data/cert.crt >> /etc/stunnel/stunnel.pem ||  {
echo -e " ERROR AL CREAR CERTIFICADO "
apt purge stunnel4 -y > /dev/null 2>&1
[[ -f "/usr/sbin/ufw" ]] && ufw allow $SSLPORT/tcp 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL4 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION FALLIDA"
msg -bar
return 0
}
service stunnel4 restart > /dev/null 2>&1
msg -bar
#echo "Limpiando sistema y Reiniciando Servicios"
echo 3 > /proc/sys/vm/drop_caches 1> /dev/null 2> /dev/null
sysctl -w vm.drop_caches=3 1> /dev/null 2> /dev/null
swapoff -a && swapon -a 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL4 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION EXITOSA"
msg -bar
return 0
;;
5)
#echo -e  "  ESTE MINI SCRIPT ES FUE DESARROLLADO POR @KillShito "
echo ""
echo -e  "               Creditos a @drowkid01 "
msg -bar
read -p " Presiona Enter para continuar "
source <(curl -sSL ${url[utx]}/zerossl.sh)
return 0
;;
6)
msg -bar
echo -e  "  ESTE MINI SCRIPT ES FUE DESARROLLADO POR @KillShito "
echo ""
echo -e  "               Creditos a @KillShito "
msg -bar
read -p " Presiona Enter para continuar "
source <(curl -sSL ${url[utx]}/front.sh)
return 0
;;
*)
return 0
;;
esac
}

_fun_ST5() {
sudo apt install autoconf automake libpcre3-dev libnl-3-dev libsqlite3-dev libssl-dev ethtool build-essential g++ libnl-genl-3-dev libgcrypt20-dev libtool python3-distutils -y
sudo apt install -y pkg-config 
#git clone https://github.com/mtrojnar/stunnel.git
wget -O stunnel.tar.gz ${url[utx]}/stunnel-5.65.tar.gz
tar xzf stunnel.tar.gz
rm -f stunnel.tar.gz
cd ./stunnel-5.65
#cd ./stunnel
./configure
make
make install
#cd /ADMcgh && rm -rf stunnel* 
[[ -z $(cat /etc/passwd | grep "stunnel" | grep -v "stunnel4") ]] && useradd -s /usr/sbin/nologin -r stunnel
[[ -d /var/lib/stunnel ]] || mkdir /var/lib/stunnel
chown stunnel:stunnel /var/lib/stunnel
cp /usr/local/share/doc/stunnel/examples/stunnel.init /etc/init.d/stunnel5
chmod 755 /etc/init.d/stunnel5
cp /usr/local/share/doc/stunnel/examples/stunnel.service /etc/systemd/system/stunnel5.service
}
function inst_stunnel5() {
	sleep 1
	helice() {
		_fun_ST5 >/dev/null 2>&1 &
		tput civis
		while [ -d /proc/$! ]; do
			for i in / - \\ \|; do
				sleep .1
				echo -ne "\e[1D$i"
			done
		done
		tput cnorm
	}
	echo -ne "\033[1;37m INSTALANDO Y COMPILANDO \033[1;32mSTUNNEL  \033[1;37mV \033[1;32m5\033[1;32m.\033[1;33m.\033[1;31m. \033[1;33m"
	helice
	echo -e "\e[1DOk"
}

ssl_stunel5 () {
unset lang

sslkk
[[ $(mportas|grep stunnel|head -1) ]] && {
[[ ! -e /usr/local/etc/stunnel/stunnel.conf && -e /etc/stunnel/stunnel.conf ]] && {
echo -e " TE REDIRECCIONAREMOS HACIA STUNNEL 4" && sleep 2s
ssl_stunel4 && return
}
# INICIO STUNNEL ACTIVO
/ADMcgh/header "ports_"
msg -bar
echo -e "${cor[2]} SSL / TLS -> STUNNEL5 ACTIVOS : $sslports "
msg -bar
echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m<\033[0;33m ADICIONAR + PUERTO SSL (STUNNEL5)  \033[0;32m(#OFICIAL)" 
echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m<\033[0;33m CERRAR TODOS LOS PUERTO(s) SSL" 
msg -bar  
selection=$(selectw 2)
case ${selection} in
0)
return 0
;;
1)source header "ports_"
unset portserv
echo -e "\033[1;33m  Selecione un Puerto De Redirecionamento Interna (Default 22) "
msg -bar
         while true; do
         echo -ne "\033[1;37m"
	    echo " Ingresa el Puerto Local de tu VPS (Default 22) "
        read -p " Local-Port: " -e -i $pt portserv
        if [[ ! -z $portserv ]]; then
	 	 if lsof -Pi :$portserv -sTCP:LISTEN -t >/dev/null ; then
		 break
		 else
		 portserv="$pt"
		 break
		 fi
	 fi
         done
    while true; do
    echo -e " Ingresa el Nuevo Puerto SSl/TLS \n A Usar en tu VPS (Recomendado 110 442 444)"
    read -p " Listen-SSL: " SSLPORT
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $SSLPORT`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$SSLPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done

echo "
[stunnel5] 
accept  = ${SSLPORT}
connect = ${portserv}
cert = /usr/local/etc/stunnel/stunnel.cert
key = /usr/local/etc/stunnel/stunnel.key
" >> /usr/local/etc/stunnel/stunnel.conf
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL5 - SSL"
echo -e "\033[1;34m ##############################"
[[ -f "/usr/sbin/ufw" ]] && ufw allow $portserv/tcp 
service ssh restart 1>/dev/null 2 /dev/null
systemctl daemon-reload &>/dev/null
systemctl restart stunnel5 &>/dev/null
sslkk
echo -e "${cor[2]}STUNNEL5 ACTIVO en Puertos : ${cor[2]}$sslports "
echo 3 > /proc/sys/vm/drop_caches 1> /dev/null 2> /dev/null
sysctl -w vm.drop_caches=3 1> /dev/null 2> /dev/null
swapoff -a && swapon -a 1> /dev/null 2> /dev/null
unset lang
return 0
;;
2)
unset lang
msg -bar
echo -e "\033[1;33m  Cerrando PUERTO SSL/TLS"
msg -bar
fun_bar 
systemctl daemon-reload &>/dev/null
systemctl stop stunnel5 &>/dev/null
systemctl disable stunnel5 &>/dev/null
rm -f /etc/systemd/system/stunnel5.service &>/dev/null
rm -rf /usr/local/etc/stunnel &>/dev/null
rm -rf /usr/local/share/doc/stunnel &>/dev/null
rm -rf /ADMcgh/stunnel* &>/dev/null
rm -rf /var/lib/stunnel
msg -bar
echo 3 > /proc/sys/vm/drop_caches 1> /dev/null 2> /dev/null
sysctl -w vm.drop_caches=3 1> /dev/null 2> /dev/null
swapoff -a && swapon -a 1> /dev/null 2> /dev/null
rm -rf /etc/stunnel/* > /dev/null
echo -e "\033[1;33m  PUERTO SSL/TLS CERRADO!"
msg -bar
return 0
;;
esac
#FIN VERIFICA STUNNEL5 ACTIVO 
}
unset lang
figlet " STUNNEL5 " | boxes -d stone -p a2v1
msg -bar 
echo -e "${cor[2]} Certificado SSL/TLS ( Default: @drowkid01 ) " 
msg -bar
echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m${flech}\033[0;33m Certificado AUTOMATICO    \033[0;32m(#OFICIAL)"
echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m${flech}\033[0;33m Certificado con DOMINIO   \033[0;32m(#OFICIAL)"
echo -e " \033[0;35m[\033[0;36m3\033[0;35m] \033[0;34m${flech}\033[0;33m Cargar con ZIP URL        \033[0;32m(#OFICIAL)"
msg -bar
selection=$(selectw 4)
case ${selection} in
1)
msg -bar
echo -e "\033[1;36m  SSL Stunnel"
msg -bar
echo -e "\033[1;33m  Selecione un Puerto De Redirecionamento Interna"
echo -e "\033[1;33m  Ingrese su Puerta Servidor Para o SSL/TLS"
msg -bar
    while true; do
    echo -ne "\033[1;37m"
    echo "  Ingresa el Puerto Local de tu VPS (Default 22) "
    read -p "  Local-Port: " -e -i $pt portx
	tput cuu1 >&2 && tput dl1 >&2
    [[ $(mportas | grep $portx) ]] && break
    echo -e "\033[1;33m  El puerto seleccionado no existe"
    unset portx
	msg -bar
    done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
    while true; do
    echo -e " Ingresa el Nuevo Puerto SSl/TLS \n A Usar en tu VPS (Recomendado 110 442 444)"
    read -p " Listen-SSL: " SSLPORT
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $SSLPORT`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$SSLPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
msg -bar
echo -e "\033[1;33m  Instalando SSL/TLS [ $DPORT -> $SSLPORT ] : $(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')"
msg -bar
inst_stunnel5
echo "; It is recommended to drop root privileges if stunnel is started by root
setuid = stunnel
setgid = stunnel

; PID file is created inside the chroot jail (if enabled)
chroot = /var/lib/stunnel
pid = /stunnel.pid

; TLS front-end to a web server
; Use the cert and key from certbot
[https]
accept  = ${SSLPORT}
connect = ${DPORT}
cert = /usr/local/etc/stunnel/stunnel.cert
key = /usr/local/etc/stunnel/stunnel.key
" > /usr/local/etc/stunnel/stunnel.conf
openssl genrsa -out key.pem 2048 > /dev/null 2>&1
(echo "$(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')" ; echo "" ; echo "$(cat < /bin/ejecutar/IPcgh):81" ; echo "" ; echo "" ; echo "" ; echo "@drowkid01")|openssl req -new -x509 -key key.pem -out cert.pem -days 1095 > /dev/null 2>&1
[[ -d /usr/local/etc/stunnel ]] && cat cert.pem > /usr/local/etc/stunnel/stunnel.cert
[[ -d /usr/local/etc/stunnel ]] && cat key.pem > /usr/local/etc/stunnel/stunnel.key
[[ -e /usr/local/share/doc/stunnel/examples/stunnel.init ]] && cp /usr/local/share/doc/stunnel/examples/stunnel.init /etc/init.d/stunnel5
chmod 755 /etc/init.d/stunnel5
cp /usr/local/share/doc/stunnel/examples/stunnel.service /etc/systemd/system/stunnel5.service
systemctl daemon-reload &>/dev/null
systemctl start stunnel5 &>/dev/null
systemctl enable stunnel5 &>/dev/null
msg -bar
[[ -f "/usr/sbin/ufw" ]] && ufw allow $SSLPORT/tcp 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL5 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION EXITOSA"
msg -bar
return 0
;;
2)
msg -bar
echo -e "\033[1;36m  SSL Stunnel"
msg -bar
echo -e "\033[1;33m  Selecione un Puerto De Redirecionamento Interna"
echo -e "\033[1;33m  Ingrese su Puerta Servidor Para o SSL/TLS"
msg -bar
    while true; do
    echo -ne "\033[1;37m"
    echo "  Ingresa el Puerto Local de tu VPS (Default 22) "
    read -p "  Local-Port: " -e -i $pt portx
	tput cuu1 >&2 && tput dl1 >&2
    [[ $(mportas | grep $portx) ]] && break
    echo -e "\033[1;33m  El puerto seleccionado no existe"
    unset portx
	msg -bar
    done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
    while true; do
    echo -e " Ingresa el Nuevo Puerto SSl/TLS \n A Usar en tu VPS (Recomendado 110 442 444)"
    read -p " Listen-SSL: " SSLPORT
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $SSLPORT`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$SSLPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
msg -bar
echo -e "\033[1;33m  Instalando SSL/TLS [ $DPORT -> $SSLPORT ] : $(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')"
msg -bar
inst_stunnel5
source <(curl -sSL ${url[utx]}/certificadossl.sh)
echo "; It is recommended to drop root privileges if stunnel is started by root
setuid = stunnel
setgid = stunnel

; PID file is created inside the chroot jail (if enabled)
chroot = /var/lib/stunnel
pid = /stunnel.pid

; TLS front-end to a web server
; Use the cert and key from certbot
[https]
accept  = ${SSLPORT}
connect = ${DPORT}
cert = /usr/local/etc/stunnel/stunnel.cert
key = /usr/local/etc/stunnel/stunnel.key
" > /usr/local/etc/stunnel/stunnel.conf
cp /usr/local/share/doc/stunnel/examples/stunnel.init /etc/init.d/stunnel5
chmod 755 /etc/init.d/stunnel5
cp /usr/local/share/doc/stunnel/examples/stunnel.service /etc/systemd/system/stunnel5.service
[[ -e /data/cert.crt && -e /data/cert.key ]] && {
cat /data/cert.key > /usr/local/etc/stunnel/stunnel.key 
cat /data/cert.crt > /usr/local/etc/stunnel/stunnel.cert
} ||  {
echo -e " ERROR AL CREAR CERTIFICADO "
rm -f /etc/systemd/system/stunnel5.service &>/dev/null
rm -rf /usr/local/etc/stunnel/* &>/dev/null
rm -rf /usr/local/share/doc/stunnel &>/dev/null
rm -rf /ADMcgh/stunnel-5.65 &>/dev/null
rm -f /usr/local/etc/stunnel/stunnel.conf &>/dev/null
[[ -f "/usr/sbin/ufw" ]] && ufw allow $SSLPORT/tcp 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL5 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION FALLIDA"
msg -bar
return 0
}
systemctl daemon-reload &>/dev/null
systemctl start stunnel5 &>/dev/null
systemctl enable stunnel5 &>/dev/null
msg -bar
#echo "Limpiando sistema y Reiniciando Servicios"
echo 3 > /proc/sys/vm/drop_caches 1> /dev/null 2> /dev/null
sysctl -w vm.drop_caches=3 1> /dev/null 2> /dev/null
swapoff -a && swapon -a 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL5 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION EXITOSA"
msg -bar
return 0
;;
3)
msg -bar
echo -e "\033[1;36m  SSL Stunnel"
msg -bar
echo -e "\033[1;33m  Selecione un Puerto De Redirecionamento Interna"
echo -e "\033[1;33m  Ingrese su Puerta Servidor Para o SSL/TLS"
msg -bar
    while true; do
    echo -ne "\033[1;37m"
    echo "  Ingresa el Puerto Local de tu VPS (Default 22) "
    read -p "  Local-Port: " -e -i $pt portx
	tput cuu1 >&2 && tput dl1 >&2
    [[ $(mportas | grep $portx) ]] && break
    echo -e "\033[1;33m  El puerto seleccionado no existe"
    unset portx
	msg -bar
    done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
    while true; do
    echo -e " Ingresa el Nuevo Puerto SSl/TLS \n A Usar en tu VPS (Recomendado 110 442 444)"
    read -p " Listen-SSL: " SSLPORT
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $SSLPORT`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$SSLPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
msg -bar
echo -e "\033[1;33m  Instalando SSL/TLS [ $DPORT -> $SSLPORT ] : $(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')"
msg -bar
inst_stunnel5
[[ -e /usr/local/etc/stunnel/stunnel.cert && -e /usr/local/etc/stunnel/stunnel.key ]] && echo -e "Ya Existe un certificado SSL Cargado \n  Recuerde Cargar SU Certificado y Key del SSL " | pv -qL 25
msg -bar
echo -e "Descarga el fichero URL del Certificado SSL " 
msg -bar
		echo -e "		\033[4;31mNOTA importante\033[0m"
		echo -e " \033[0;31mPara este Paso debes tener el URL del certificado Online"
		echo -e "            Si Aun no lo has hecho, Cancela este paso"
		echo -e "               Evitar Errores Futuros"
		echo -e "   y causar problemas en futuras instalaciones.\033[0m"
		msg -bar
msg -bar
echo -e "Ingrese Link del Fichero URL de tu ZIP con los Certificados "
msg -bar
read -p " Pega tu Link : " urlm
wget -q -O certificados.zip $urlm && echo -e "Descargando Fichero ZIP " || echo "Link de descarga Invalido"
msg -bar
echo -ne "\033[1;42m ZIPS Existentes : " && ls | grep zip && echo -e "\033[1;42m"
msg -bar 
unzip certificados.zip 1> /dev/null 2> /dev/null && echo -e "Descomprimiendo Ficheros descargados" || echo -e "Error al Descomprimir "
[[ $(ls | grep ".key") ]] && cat *.key > /usr/local/etc/stunnel/stunnel.key && echo -e " \033[1;42m Key del Certificado cargada Exitodamente\033[0m" || echo -e " \033[1;41mClaves Invalidas\033[0m"
[[ $(ls | grep ".crt") ]] && cat *.crt > /usr/local/etc/stunnel/stunnel.cert && echo -e "\033[1;42m  CRT del Certificado cargada Exitodamente\033[0m" || echo -e "\033[1;41mClaves Invalidas\033[0m"
[[ $(ls | grep ".pem") ]] && cat *.pem > /usr/local/etc/stunnel/stunnel.cert && echo -e "\033[1;42m  PEM del Certificado cargada Exitodamente\033[0m" 
rm -f *.key *.crt *.pem certificados.zip 1> /dev/null 2> /dev/null && cd $HOME
echo "; It is recommended to drop root privileges if stunnel is started by root
setuid = stunnel
setgid = stunnel

; PID file is created inside the chroot jail (if enabled)
chroot = /var/lib/stunnel
pid = /stunnel.pid

; TLS front-end to a web server
; Use the cert and key from certbot
[https]
accept  = ${SSLPORT}
connect = ${DPORT}
cert = /usr/local/etc/stunnel/stunnel.cert
key = /usr/local/etc/stunnel/stunnel.key
" > /usr/local/etc/stunnel/stunnel.conf
cp /usr/local/share/doc/stunnel/examples/stunnel.init /etc/init.d/stunnel5
chmod 755 /etc/init.d/stunnel5
cp /usr/local/share/doc/stunnel/examples/stunnel.service /etc/systemd/system/stunnel5.service
[[ -e /usr/local/etc/stunnel/stunnel.key && -e /usr/local/etc/stunnel/stunnel.cert ]] || {
echo -e " ERROR AL CREAR CERTIFICADO "
rm -f /etc/systemd/system/stunnel5.service &>/dev/null
rm -rf /usr/local/etc/stunnel/* &>/dev/null
rm -rf /usr/local/share/doc/stunnel &>/dev/null
rm -rf /ADMcgh/stunnel-5.65 &>/dev/null
rm -f /usr/local/etc/stunnel/stunnel.conf &>/dev/null
[[ -f "/usr/sbin/ufw" ]] && ufw allow $SSLPORT/tcp 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m FALLO AL INSTALAR STUNNEL5 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION FALLIDA"
msg -bar
return 0
}
systemctl daemon-reload &>/dev/null
systemctl start stunnel5 &>/dev/null
systemctl enable stunnel5 &>/dev/null
msg -bar
#echo "Limpiando sistema y Reiniciando Servicios"
echo 3 > /proc/sys/vm/drop_caches 1> /dev/null 2> /dev/null
sysctl -w vm.drop_caches=3 1> /dev/null 2> /dev/null
swapoff -a && swapon -a 1> /dev/null 2> /dev/null
service ssh restart 1> /dev/null 2> /dev/null
echo -e "\033[1;34m ##############################"
echo -e "\033[1;37m R E I N I C I A N D O  -  STUNNEL5 - SSL"
echo -e "\033[1;34m ##############################"
echo -e "\033[1;33m  INSTALACION EXITOSA"
msg -bar
return 0
;;
*)
return 0
;;
esac
}


painel_upload () {
msg -bar
echo -e "${cor[2]}Desea Instalar Panel De Upload?"
msg -bar
read -p " [ s | n ]: " up_load
msg -bar
   [[ "$up_load" = @(s|S|y|Y) ]] && bash /ADMcgh/insta_painel || {
   echo -e "${cor[2]}Instalacao Abortada"
   msg -bar
   }
}


function psix(){
clear
tittle
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;31m${flech} ${cor[3]}PSIPHON OFICIAL "
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;31m${flech} ${cor[3]}PSIPHON HTTP CUSTOM ( \033[0;33mNEW\033[0m )"
echo -e "\033[0;35m [\033[0;36m3\033[0;35m]\033[0;31m${flech} ${cor[3]}INICIAR PSIPHON "
echo -e "\033[0;35m [\033[0;36m4\033[0;35m]\033[0;31m${flech} ${cor[3]}DETENER PSIPHON"
echo -e "\033[0;35m [\033[0;36m5\033[0;35m]\033[0;31m${flech} ${cor[3]}DETENER PSIPHON"
msg -bar
echo -e "\033[0;35m [\033[0;36m0\033[0;35m]\033[0;31m ${flech} $(msg -bra "\033[1;41m[ REGRESAR ]\e[0m")"
msg -bar #msg -bar
selection=$(selectw 5)
case ${selection} in
1)
psiserver
read -p " Enter";;
2)
psiservernew
read -p " Enter";;
3)
psiiniciar
read -p " Enter";;
4)
psidetener
read -p " Enter";;
5)
psireiniciar
read -p " Enter";;
0)
return;;
esac
}

function psireiniciar(){
echo -e "\033[1;33m Se iniciar el servidor de Psiphon Custom\033[0m"
echo -e "\033[1;33m Debes tener Instalador el Servidor\033[0m"
echo -e "\033[1;33m Continuar?\033[0m"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
kill $(ps aux | grep 'psiphond' | awk '{print $2}') 1> /dev/null 2> /dev/null
killall psiphond 1> /dev/null 2> /dev/null
cd /root/psi 2> /dev/null
screen -dmS psi ./psiphond run 2> /dev/null
if pgrep psiphond >/dev/null
then
echo "Status: El proceso se ha reiniciado"
else
echo "Status: El servicio est detenido"
fi
fi
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
read -p " "
}

function psidetener(){
echo -e "\033[1;33m Se iniciar el servidor de Psiphon Custom\033[0m"
echo -e "\033[1;33m Debes tener Instalador el Servidor\033[0m"
echo -e "\033[1;33m Continuar?\033[0m"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
kill $(ps aux | grep 'psiphond' | awk '{print $2}') 1> /dev/null 2> /dev/null
killall psiphond 1> /dev/null 2> /dev/null
if pgrep psiphond >/dev/null
then
echo "Status: El proceso aun sigue activo"
else
echo "Status: El servicio se ha detenido"
fi
fi
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
read -p " "
}

function psiiniciar(){
echo -e "\033[1;33m Se iniciar el servidor de Psiphon Custom\033[0m"
echo -e "\033[1;33m Debes tener Instalador el Servidor\033[0m"
echo -e "\033[1;33m Continuar?\033[0m"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
kill $(ps aux | grep 'psiphond' | awk '{print $2}') 1> /dev/null 2> /dev/null
killall psiphond 1> /dev/null 2> /dev/null
cd /root/psi 2> /dev/null
screen -dmS psi ./psiphond run 2> /dev/null
if pgrep psiphond >/dev/null
then
echo "Status: El proceso se ha iniciado"
else
echo "Status: El servicio no se ha iniciado. Verifique su configuracin o reinstale el servidor"
fi
fi
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
read -p " "
}

psiserver(){
 install_psiphone() {
    clear && clear
    if ps aux | grep 'psiphond' | grep -v grep >/dev/null; then
      echo "El proceso psiphond ya está activo."
      exit 1
    fi

    msg -bar
    msg -tit
    msg -bar
    msg -ama "            INSTALADOR DE SERVR-PSIPHONE"
    msg -bar
rm -rf /root/psi
echo -e "\033[1;33m Se instalará el servidor de Psiphon\033[0m"
echo -e "\033[1;33m ESTA OPCION PODRIA NO FUNCIONAR EN CIERTOS VPS\033[0m"
echo -e "\033[1;33m Si ya tenías una instalacion Previa, esta se eliminara\033[0m"
echo -e "\033[1;33m Debes tener instalado previamente GO Lang \033[0m"
echo -e "\033[1;33m BINARIO FUNCIONAL BAJO GOLANG >='1.20.xx'  \033[0m"
echo -e "\033[1;33m PUEDES INSTALAR GO-LANG EN EL MENU 7, OPC 15\033[0m"
echo -e "\033[1;33m Continuar?\033[0m"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
rm -rf /root/psi
kill $(ps aux | grep 'psiphond' | awk '{print $2}') 1> /dev/null 2> /dev/null
killall psiphond 1> /dev/null 2> /dev/null
cd /root
mkdir psi
cd psi
psi=`cat /root/psi.txt`;
ship=$(wget -qO- ipv4.icanhazip.com)
curl -o /root/psi/psiphond https://raw.githubusercontent.com/Psiphon-Labs/psiphon-tunnel-core-binaries/master/psiphond/psiphond 1> /dev/null 2> /dev/null
chmod 777 psiphond
    while true; do
    echo -e "\033[1;33m PUERTO Psiphon SSH ( NO LOCAL SSH 22 ):\033[0m"
    read -p " Listen-P-SSH: " sh
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $sh`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$sh"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
    tput cuu1 && tput dl1
    tput cuu1 && tput dl1	
    tput cuu1 && tput dl1	
#2	
    while true; do
    echo -e "\033[1;33m Escribe el puerto para Psiphon OSSH:\033[0m"
    read -p " Listen-P-OSSH: " osh
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $osh`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$osh"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
	tput cuu1 && tput dl1
    tput cuu1 && tput dl1	
    tput cuu1 && tput dl1
#3
    while true; do
	echo -e "\033[1;33m Escribe el puerto para Psiphon FRONTED-MEEK:\033[0m"
    read -p " Listen-P-OSSH: " fm
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $fm`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$fm"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
    tput cuu1 && tput dl1
    tput cuu1 && tput dl1	
    tput cuu1 && tput dl1	
#4
    while true; do
	echo -e "\033[1;33m Escribe el puerto para Psiphon UNFRONTED-MEEK:\033[0m"
    read -p " Listen UNFRONTED-MEEK: " umo
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $umo`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$umo"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
    tput cuu1 && tput dl1
    tput cuu1 && tput dl1	
    tput cuu1 && tput dl1
./psiphond --ipaddress $ship --protocol SSH:$sh --protocol OSSH:$osh --protocol FRONTED-MEEK-OSSH:$fm --protocol UNFRONTED-MEEK-OSSH:$umo generate
chmod 666 psiphond.config
chmod 666 psiphond-traffic-rules.config
chmod 666 psiphond-osl.config
chmod 666 psiphond-tactics.config
chmod 666 server-entry.dat
[[ -e server-entry.dat ]] && {
serverCAT=$(cat server-entry.dat)
cat server-entry.dat > /root/psi/psi.txt
}
screen -dmS psiserver ./psiphond run
cd /root
echo -e "\033[1;33m LA CONFIGURACION DE TU SERVIDOR ES:\033[0m"
msg -bar
echo -e "\033[1;32m ${serverCAT} \033[0m"
msg -bar
echo -e "\033[1;33m PROTOCOLOS HABILITADOS:\033[0m"
echo -e "\033[1;33m ⚡⚡ SSH:\033[1;32m $sh \033[0m"
echo -e "\033[1;33m ⚡⚡ OSSH:\033[1;32m $osh \033[0m"
echo -e "\033[1;33m ⚡⚡ FRONTED-MEEK-OSSH:\033[1;32m $fm \033[0m"
echo -e "\033[1;33m ⚡⚡ UNFRONTED-MEEK-OSSH:\033[1;32m $umo \033[0m"
msg -bar
echo -e " "
echo -e "\033[1;33m DIRECTORIO DE ARCHIVOS:\033[1;32m /root/psi \033[0m"
msg -bar
[[ "$(ps x | grep psiserver | grep -v grep | awk '{print $1}')" ]] && msg -verd "    >> SERVIDOR-PSIPHONE INSTALADO CON EXITO <<" || msg -ama "                  ERROR VERIFIQUE"
msg -bar
read -t 120 -n 1 -rsp $'\033[1;39m   Presiona enter para Continuar\n'
fi
}

 desactivar_psiphone() {
    clear && clear
    msg -bar
    echo -e "\033[1;31m            DESISNTALANDO PUERTOS UDP-SERVER "
    msg -bar
    rm -rf /root/psi
    kill $(ps aux | grep 'psiphond' | awk '{print $2}') 1>/dev/null 2>/dev/null
    killall psiphond 1>/dev/null 2>/dev/null
    [[ "$(ps x | grep psiserver | grep -v grep | awk '{print $1}')" ]] && echo -e "\033[1;32m        >> UDP-SERVER DESINSTALADO CON EXICO << "
    read -t 60 -n 1 -rsp $'\033[1;39m       << Presiona enter para Continuar >>\n'
    menu_inst
  }
  clear && clear
  msg -bar
  tittle
  msg -ama "  PSIPHONE-SERVER | @drowkid01"
  msg -bar
  if [[ ! -e /bin/psiphond ]]; then
    curl -o /bin/psiphond https://raw.githubusercontent.com/Psiphon-Labs/psiphon-tunnel-core-binaries/master/psiphond/psiphond &>/dev/null
    chmod 777 /bin/psiphond
  fi
  echo -ne " \e[1;93m [\e[1;32m1\e[1;93m]\033[1;31m > \e[1;97m INSTALAR SERVER-PSIPHONE  \e[97m \n"
  echo -ne " \e[1;93m [\e[1;32m2\e[1;93m]\033[1;31m > \033[1;97m DETENER SERVER-PSIPHONE \e[97m \n"
  msg -bar
  echo -ne " \e[1;93m [\e[1;32m0\e[1;93m]\033[1;31m > \033[1;97m" && msg -bra "  \e[97m\033[1;41m VOLVER \033[1;37m"
  msg -bar
  echo -ne "\033[1;97m OPCION:\e[32m "
  read opcao
  case $opcao in
  1)
    msg -bar
    install_psiphone
    ;;
  2)
    msg -bar
    desactivar_psiphone
    ;;
  *)
    echo -e "$ SOLO OPCION ENTRE [0-2]"
    msg -bar
    ;;
  esac

}


function psiservernew(){
clear&&clear
msg -bar
msg -ama "         BINARIO OFICIAL DE Epro Dev Team"
msg -bar
echo -e "\033[1;33m SE RECOMIENDA : HTTP-OSSH 80 y OSSH 443\033[0m"
echo -e "\033[1;33m HABILITAREMOS SERVIDOR PSIPHON SERVER CUSTOM MOD\033[0m"
echo -e "\033[1;33m SI TIENES UNA CONFIG PREVIA, SE SOBREESCRIBIRA CON ESTA\033[0m"
echo -e "\033[1;33m  SE RECOMIENDA VERIFICAR EL PANNEL DE PUERTOS \033[0m"
echo -e "\033[1;33m   Y CHECAR LOS PUERTOS QUE VALLAS A UTILIZAR\033[0m"
msg -bar
echo -e "\033[1;33m ACEPTAS CONTINUAR?\033[0m"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
kill $(ps aux | grep 'psiphond' | awk '{print $2}') 1> /dev/null 2> /dev/null
killall psiphond 1> /dev/null 2> /dev/null
rm -rf /root/psi 2>/dev/null
rm /root/psi.txt 2>/dev/null
rm /var/www/html/psi.txt 2>/dev/null
cd /root
mkdir psi
cd psi
wget 'https://raw.githubusercontent.com/emirjorge/Script-Z/master/CHUMO/Recursos/binarios/Psiphond-Epro/psiphond' -O '/root/psi/psiphond' 2> /dev/null
cd /root/psi
chmod 775 /root/psi/psiphond
#1
    while true; do
    echo -e "\033[1;33m Escribe el puerto para FRONTED-MEEK-HTTP-OSSH:\033[0m"
    read -p " Listen-P-OSSH: " httposh
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $httposh`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$httposh"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
#FIN 1
#2
    while true; do
    echo -e "\033[1;33m Escribe el puerto para FRONTED-MEEK-OSSH:\033[0m"
    read -p " Listen-P-OSSH: " osh
	tput cuu1 >&2 && tput dl1 >&2
	PortSSL=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $osh`
	[[ -n "$PortSSL" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$osh"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
#FIN 2

cd /root/psi
[[ -e /root/psi/server-entry.dat ]] && {
echo -e " CONFIGURACION BASE REUTILIZADA !!!"
} || {
/root/psi/psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-HTTP-OSSH:$httposh --protocol FRONTED-MEEK-OSSH:$osh generate
	[[ -e /root/psi/psiphond.config ]] && {
		_ruta='/root/psi/'
		psi1='psiphond-tactics.config'
		psi2='psiphond-traffic-rules.config'
		psi3='psiphond-osl.config'
	#psi4='psiphond-traffic-rules.config'
			sed -i "s%${psi1}%${_ruta}${psi1}%g" /root/psi/psiphond.config
			sed -i "s%${psi2}%${_ruta}${psi2}%g" /root/psi/psiphond.config
			sed -i "s%${psi3}%${_ruta}${psi3}%g" /root/psi/psiphond.config
			#sed -i "s%${psi4}%${_ruta}${psi4}%g" /root/psi/psiphond.config
	}

}
cat /root/psi/server-entry.dat >> /root/psi.txt
  msg -bar      
  msg -azu "...  ACIVANDO PSISERVER _..."    
if screen -dmS psiserver /root/psi/psiphond -config /root/psi/psiphond.config run ; then
  #-------------------------
	[[ $(grep -wc "psiserver" /bin/autoboot) = '0' ]] && {
						echo -e "netstat -tlpn | grep -w $httposh > /dev/null || {  screen -r -S 'psiserver' -X quit;  screen -dmS psiserver /root/psi/psiphond -config /root/psi/psiphond.config run; }" >>/bin/autoboot
					} || {
						sed -i '/psiserver/d' /bin/autoboot
						echo -e "netstat -tlpn | grep -w $httposh > /dev/null || {  screen -r -S 'psiserver' -X quit;  screen -dmS psiserver /root/psi/psiphond -config /root/psi/psiphond.config run; }" >>/bin/autoboot
					}
	crontab -l > /root/cron
#echo "@reboot /bin/autoboot" >> /root/cron
	crontab /root/cron
	service cron restart
	rm -f /root/cron
#-------------------------
  msg -verd "    Con Exito!!!"       
  msg -bar      
  else    
  msg -verm "    Con Fallo!!!"       
  msg -bar      
  fi      
cd /root

#portFTP=$(lsof -V -i tcp -P -n | grep apache2 | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN" | cut -d: -f2 | cut -d' ' -f1 | uniq)
#_pFTP="$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN" | grep apache2 | cut -d " " -f1 | uniq)"
psi=`cat /root/psi.txt`
echo -e "\033[1;33m SERVER CONFIG:\033[0m"
echo -e "[\033[1;31m-\033[1;33m]\033[1;31m \033[1;33m"
echo -e "\033[1;32m $psi \033[0m"
echo -e "[\033[1;31m-\033[1;33m]\033[1;31m \033[1;33m"
echo -e "\033[1;33m PROTOCOLOS:\033[0m"
echo -e "\033[1;33m  FRONTED-MEEK-OSSH:\033[1;32m $httposh \033[0m"
echo -e "\033[1;33m  OSSH:\033[1;32m $osh \033[0m"
echo -e "[\033[1;31m-\033[1;33m]\033[1;31m \033[1;33m"
echo -e " "
echo -e "\033[1;33m DIRECTORIO DE ARCHIVOS:\033[1;32m /root/psi \033[0m"
[[ -z $portFTP ]] && echo -e "SERVICIO FTP NO ACTIVO " || {
IP="$(cat < /bin/ejecutar/IPcgh)"
cp /root/psi.txt /var/www/html/psi.txt
echo -e "\033[1;33m RUTA PUBLICA DE CONFIG GENERADA:\033[1;32m http://$IP:${portFTP}/psi.txt \033[0m"
}
fi
msg -bar
		echo -e "		\033[4;31mNOTA importante\033[0m"
		echo -e " \033[0;31mSI DESEAS REINICIAR ESTE SERVICIO "
		echo -e " SE RECOMIENDA SOLO IR AL MENU PRINCIPAL"
		echo -e "        MENU 7, OPCION 1, SUBOBCION 1"
		echo -e " REINICIARAS TODOS LOS SERVICIOS SIN REINICIAR."
		echo -e "              TU SERVIDOR VPS\033[0m"
msg -bar
}


antiddos (){
if [ -d '/usr/local/ddos' ]; then
	if [ -e '/usr/local/sbin/ddos' ]; then
		rm -f /usr/local/sbin/ddos
	fi
	if [ -d '/usr/local/ddos' ]; then
		rm -rf /usr/local/ddos
	fi
	if [ -e '/etc/cron.d/ddos.cron' ]; then
		rm -f /etc/cron.d/ddos.cron
	fi
	sleep 1s
	msg -bar
	echo -e "\033[1;31m ANTIDDOS DESINSTALADO CON EXITO\033[1;37m"
	msg -bar
	return 1
else
	mkdir /usr/local/ddos
fi
wget -q -O /usr/local/ddos/ddos.conf https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/ADM-MANAGER-MOD/master/DDOS/ddos.conf -o /dev/null
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE -o /dev/null
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list -o /dev/null
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh -o /dev/null
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
sleep 2s
msg -bar
echo -e "\033[1;32m ANTIDDOS INSTALADO CON EXITO.\033[1;37m"
msg -bar
}

v2ui() {
cd $HOME
fun_ip(){
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
last_version=$(curl -Ls "https://api.github.com/repos/vaxilu/x-ui/releases/latest" | grep 'V' | sed -E 's/.*"([^"]+)".*/\1/')
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
kill -9 $(ps x|grep -v grep|grep "xray-linu"|awk '{print $1}')
kill -9 $(ps x|grep -v grep|grep "x-ui"|awk '{print $1}')
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
fun_ip
autogen() {
x-ui start  > /dev/null 2>&1
x-ui enable > /dev/null 2>&1
[[ ! -d /etc/x-ui ]] && mkdir /etc/x-ui
[[ -d /etc/x-ui ]] && cd /etc/x-ui
openssl genrsa -out key.key 2048 > /dev/null 2>&1
(echo "$(curl -sSL ipinfo.io > info && cat info | grep country | awk '{print $2}' | sed -e 's/[^a-z0-9 -]//ig')"; echo ""; echo "$(cat < /bin/ejecutar/IPcgh):81"; echo ""; echo ""; echo ""; echo "@drowkid01")|openssl req -new -x509 -key /etc/x-ui/cert.key -out /etc/x-ui/cert.crt -days 1095 > /dev/null 2>&1
cd $HOME
fun_bar
echo -e "CERTIFICADO GENERADO"
}
creargen(){
x-ui start
x-ui enable
[[ ! -d /etc/x-ui ]] && mkdir /etc/x-ui > /dev/null 2>&1
[[ -d /etc/x-ui ]] && cd /etc/x-ui > /dev/null 2>&1
openssl genrsa 2048 > key.key
openssl req -new -key key.key -x509 -days 1000 -out cert.crt
#[[ -e /etc/x-ui/key.key ]] && cp /etc/x-ui/key.key /etc/x-ui/cert.key
#[[ -e /etc/x-ui/cert.crt ]] && cp /etc/x-ui/cert.crt /etc/x-ui/cert.crt
fun_bar
echo -e "CERTIFICADO GENERADO"
}
certdom () {
[[ ! -d /etc/x-ui ]] && mkdir /etc/x-ui
[[ -d /etc/x-ui ]] && cd /etc/x-ui
source <(curl -sSL ${url[utx]}/certificadossl.sh)
[[ -e /data/cert.crt && -e /data/cert.key ]] && {
cat /data/cert.key > /etc/x-ui/cert.key
cat /data/cert.crt > /etc/x-ui/cert.crt 
echo -e "CERTIFICADO GENERADO"
} ||  {
echo -e " ERROR AL CREAR CERTIFICADO "
}

certweb () {
[[ -e /etc/x-ui/cert.key && -e /etc/x-ui/cert.crt ]] && echo -e "Ya Existe un certificado SSL Cargado \n  Recuerde Cargar SU Certificado y Key del SSL " | pv -qL 25
msg -bar
echo -e "Descarga el fichero URL del Certificado SSL " 
msg -bar
		echo -e "		\033[4;31mNOTA importante\033[0m"
		echo -e " \033[0;31mPara este Paso debes tener el URL del certificado Online"
		echo -e "            Si Aun no lo has hecho, Cancela este paso"
		echo -e "               Evitar Errores Futuros"
		echo -e "   y causar problemas en futuras instalaciones.\033[0m"
		msg -bar
msg -bar
echo -e "Ingrese Link del Fichero URL de tu ZIP con los Certificados "
msg -bar
read -p " Pega tu Link : " urlm
wget -O certificados.zip $urlm && echo -e "Descargando Fichero ZIP " || echo "Link de descarga Invalido"
msg -bar
echo -ne "\033[1;42m ZIPS Existentes : " && ls | grep zip && echo -e "\033[1;42m"
msg -bar 
unzip certificados.zip 1> /dev/null 2> /dev/null && echo -e "Descomprimiendo Ficheros descargados" || echo -e "Error al Descomprimir "
[[ -e private.key ]] && cat private.key > /etc/x-ui/cert.key && echo -e " \033[1;42m Key del Certificado cargada Exitodamente\033[0m" || echo -e " \033[1;41mClaves Invalidas\033[0m"
[[ -e certificate.crt && -e ca_bundle.crt ]] && cat certificate.crt ca_bundle.crt > /etc/x-ui/cert.crt && echo -e "\033[1;42m  CRT del Certificado cargada Exitodamente\033[0m" || echo -e "\033[1;41mClaves Invalidas\033[0m"
rm -f private.key certificate.crt ca_bundle.crt certificados.zip 1> /dev/null 2> /dev/null && cd $HOME
}
}

act_gen () {
v2ray-cgh="/etc/x-ui"  > /dev/null 2>&1
while [[ ${varread} != @([0-5]) ]]; do
echo -e "\033[1;33mv2-ui v${last_version}${plain} La instalación está completa y el panel se ha activado⚡⚡"
systemctl daemon-reload
systemctl enable x-ui
systemctl start x-ui
echo -e ""
echo -e "  Si se trata de una nueva instalación \n El puerto web predeterminado es ${green}54321${plain}，\n El nombre de usuario y la contraseña son ambos predeterminados ${green}admin${plain}"
echo -e "  Asegúrese de que este puerto no esté ocupado por otros programas，\n${yellow}Asegúrate 65432 El puerto ha sido liberado${plain}"
echo -e "  Si desea modificar 65432 a otro puerto, \n ingrese el comando x-ui para modificarlo, \n y también asegúrese de que el puerto que modifica también esté permitido"
echo -e ""
echo -e "Si es un panel de actualización, acceda al panel como lo hizo antes, \n A continuacion crearemos su Certificado SSL"
echo -e ""
msg -bar
echo -e " WELCOME TO V2RAY-UI, MOD ChuKK-Script \n \033[1;36mREAD THE INSTRUCTIONS CAREFULLY BEFORE CONTINUING....."
msg -bar
echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m${flech}\033[0;33m  Certificado AUTOMATICO    \033[0;32m(#OFICIAL)" 
echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m${flech}\033[0;33m  Crear Su Certificado SSL  \033[0;32m(#OFICIAL)"
echo -e " \033[0;35m[\033[0;36m3\033[0;35m] \033[0;34m${flech}\033[0;33m  Cargar Certificado WEB    \033[0;33m(#EXPERIMENTAL)"
echo -e " \033[0;35m[\033[0;36m4\033[0;35m] \033[0;34m${flech}\033[0;33m  Certificado con DOMINIO   \033[0;32m(#EXPERIMENTAL)"
msg -bar 
echo -e " \033[0;35m[\033[0;36m0\033[0;35m] \033[0;34m<\033[0;33m Regresar"
msg -bar
echo -ne "${cor[6]}"
read -p " Opcion : " varread
done
msg -bar
if [[ ${varread} = 0 ]]; then
return 0
elif [[ ${varread} = 1 ]]; then
autogen
elif [[ ${varread} = 2 ]]; then
creargen
elif [[ ${varread} = 3 ]]; then
certweb
elif [[ ${varread} = 4 ]]; then
certdom
fi
}
act_gen
clear&&clear
msg -bar
echo -e "\033[1;36m 1). -PRIMER PASO -"
msg -bar
echo -e "\n    Desde Cualquier Navegador WEB | \nAccede con \033[1;32m http://$IP:54321 \033[1;31m "
msg -bar
echo -e "\033[1;32m 2). -SEGUNDO PASO -"
msg -bar
echo -e "\nUSUARIO \033[1;32m admin\033[1;33m PASSWD \033[1;31m admin\033[1;31m "
msg -bar
echo -e "\033[1;32m 3). -TERCER PASO -"
msg -bar
echo -e "\033[1;34mEn \033[1;32maccounts\033[1;31m añade en \033[1;32m+\033[1;31m y fijate "
msg -bar
echo -e "\033[1;32m 4). -CUARTO PASO -"
msg -bar
echo -e "\033[1;31mAsegurate de Activar el \033[1;31mTLS"
msg -bar
echo -e "\033[1;32m 5). -QUINTO PASO -"
msg -bar
echo -e "\033[1;31m Escoje tu Protocolo ADECUADO, \n Y en DOMAIN tu dominio"
msg -bar
echo -e "\033[1;32m 6). -SEXTO PASO -"
msg -bar
echo -e "\033[1;31m En cert file path : \033[1;33m/etc/x-ui/cert.crt "
echo -e "\033[1;31m En key  file path : \033[1;33m/etc/x-ui/cert.key "
msg -bar
echo -e "\033[1;32m 7). -SEPTIMO PASO -"
msg -bar
echo -e "\033[1;32m💥 ASEGURATE DE MODIFICAR EL USUARIO Y PUERTO DE ACCESO 💥"
msg -bar
echo -e "\033[1;32m 8). -Añade mas Perfiles, Si deseas!!  -"
msg -bar
echo -e "\033[1;32m 9). -DISFRUTA TU CONFGURACION SI TODO ES CORRECTO -"
msg -bar
echo -e "\033[1;32m 9). - Si deseas acceder al PANNEL teclea \033[1;35mx-ui \033[1;32men consola -"
msg -bar
echo -e "  MANUAL EN EL PORTAL https://seakfind.github.io/2021/10/10/X-UI/ "
msg -bar
curl -o /usr/bin/x-ui -sSL ${url[utx]}/x-ui.sh
chmod +x /usr/bin/x-ui	

msg -ama "        UNLOCK SYSTEMCTL ...."
  if systemctl daemon-reload &> /dev/null ;then
  msg -verd "        Con exito!!!"    
  msg -bar
  else    
  msg -verm "        Con fallo!!!"    
  msg -bar
fi
msg -ama "        HABILITANDO X-UI ...."
  if systemctl x-ui enable &> /dev/null ;then
  msg -verd "        Con exito!!!"    
  msg -bar
  else    
  msg -verm "        Con fallo!!!"    
  msg -bar
fi

msg -ama "        Reiniciando X-UI ...."
  if systemctl x-ui restart &> /dev/null ;then
  msg -verd "        Con exito!!!"    
  msg -bar
  else    
  msg -verm "        Con fallo!!!"    
  msg -bar
fi

[[ -f "/usr/sbin/ufw" ]] && ufw allow 54321/tcp 1> /dev/null 2> /dev/null
}

v2ray-socket() {
msg -bar
echo -e "MOTOR DE INSTALACION DE PANNEL WEB Y CONSOLA DE V2RAY Y XRAY"
msg -bar
echo -e " \033[0;35m[\033[0;36m1\033[0;35m] \033[0;34m${flech}\033[0;33m  Original (Todo en Consola)   \033[0;32m(#OFICIAL)" 
echo -e " \033[0;35m[\033[0;36m2\033[0;35m] \033[0;34m${flech}\033[0;33m  MENU Rufu99 Mod @drowkid01     \033[0;32m(#OFICIAL)   " #\033[0;33m(#EXPERIMENTAL)"
echo -e " \033[0;35m[\033[0;36m3\033[0;35m] \033[0;34m${flech}\033[0;33m  MENU Reforma @drowkid01        \033[0;32m(#OFICIAL)"
echo -e " \033[0;35m[\033[0;36m4\033[0;35m] \033[0;34m${flech}\033[0;33m  Pannel WEB ( X-RAY ) Traduccion @drowkid01  \033[0;32m(#OFICIAL)"
echo -e " \033[0;35m[\033[0;36m5\033[0;35m] \033[0;34m${flech}\033[0;33m  REMOVED V2RAY BASE "
#echo -e " \033[0;35m[\033[0;36m6\033[0;35m] \033[0;34m${flech}\033[0;33m  FIX PARA INSTALLS FAILS DE V2RAY  "
msg -bar 
selection=$(selectw 7)
case ${selection} in
1)
[[ -e /etc/v2ray/config.json ]] && v2r.sh || source <(curl -sSL ${url[utx]}/v2ray.sh)
;;
2)
source <(curl -sSL ${url[utx]}/v2ray_manager.url.sh)
;;
3)
unset yesno
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
echo "DESEAS ENTRAR AL MENU PASO A PASO "
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
echo -e "source <(curl -sSL ${url[utx]}/v2ray1.sh)" > /bin/v2ray.menu
chmod +x /bin/v2ray.menu 
v2ray.menu
else
v2ray 
fi
exit
;;
4)
[[ -e /usr/bin/x-ui ]] && x-ui || v2ui
;;
5)
source <(curl -sL https://multi.netlify.com/v2ray.sh) --remove
source <(curl -sL https://git.io/fNgqx) --remove
rm -rf /usr/local/V2ray.Fun
rm -f /etc/v2ray/*
rm -rf /etc/v2ray/
exit
;;
99)
msg -bar
echo -e ""
echo -e " ESTE PROCESO PUEDE DEMORAR UN POCO "
echo -e ""
echo -e "  LE RECOMENDAMOS SER PACIENTE DURANTE EL PROCESO"
echo ""
read -p "PRESIONE ENTER PARA COMENZAR"
_fix_() {
apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
apt update
sudo apt install python3.7 -y
python3.7 --version
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
sudo update-alternatives --config python3
python3.7 -m pip install pip
sudo apt-get install -y build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev zlib1g-dev openssl libffi-dev python3-dev python3-setuptools wget
mkdir /tmp/Python37
cd /tmp/Python37
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
tar xvf Python-3.7.0.tar.xz
cd /tmp/Python37/Python-3.7.0
./configure
sudo make altinstall
	sync
	echo 3 >/proc/sys/vm/drop_caches
	sync && sysctl -w vm.drop_caches=3
	sysctl -w vm.drop_caches=0
	swapoff -a
	swapon -a
	killall kswapd0 > /dev/null 2>&1
	killall tcpdump > /dev/null 2>&1
	killall ksoftirqd > /dev/null 2>&1
}
function aguarde() {
	helice() {
		_fix_ >/dev/null 2>&1 &
		tput civis
		while [ -d /proc/$! ]; do
			for i in / - \\ \|; do
				sleep .1
				echo -ne "\e[1D$i"
			done
		done
		tput cnorm
	}
	echo -ne "\033[1;37m FIXEANDO PYTHON 3.7 \033[1;32mV2RAY \033[1;37m. \033[1;32m.\033[1;32m.\033[1;33m.\033[1;31m. \033[1;33m"
	helice
	echo -e "\e[1DOk"
}
echo -e "  ESTE PROCESO DEMORARA UN POCO, TENGA PACIENCIA!!!"
echo -e ""
aguarde
#clear&&clear
msg -bar
echo -e ""
echo -e "        ESTE PROCESO FINALIZO  "
echo -e ""
echo -e "  PRUEBE INSTALAR V2RAY NUEVAMENTE"
echo ""
;;
*)
return 0
;;
esac
}

fun_openvpn () {
source <(curl -sSL ${url[utx]}/openvpn.sh)
}

function tcpd(){
echo -e "A continuacion se instalara el TCP DNS"
echo -e "Este paquete solo funcionara en Debian/Ubuntu"
echo -e "AVISO!!!"
echo -e "Para realizar la instalacion de TCP DNS"
echo -e "Debes configurar previamente tu DNS/Dominio"
echo -e "Si aun no lo haz configurado el DNS/Dominio"
echo -e "Presiona CTRL + C para cancelar la instalacion"
echo -e "Si ya configuraste tu DNS/Dominio Correctamente, presiona ENTER"
read -p " "
echo -e "Espera un momento..."
echo -e "Limpiando DNS Primario..."
sleep 1
sed -i '/DNSStubListener/d' /etc/systemd/resolved.conf
echo -e "Agregando Fix DNS Primario..."
sleep 1
echo "DNSStubListener=no" >> /etc/systemd/resolved.conf
echo -e "Reiniciando DNS Primario..."
sleep 1
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
systemctl restart systemd-resolved
echo -e "Instalando paquetes Necesarios, espere... "
sleep 1
apt-get install python-pip -y 1> /dev/null 2> /dev/null
apt-get install libevent-dev -y 1> /dev/null 2> /dev/null
apt-get install python-gevent -y 1> /dev/null 2> /dev/null
apt-get install python-daemon -y 1> /dev/null 2> /dev/null
git clone https://github.com/henices/Tcp-DNS-proxy.git 1> /dev/null 2> /dev/null
cd Tcp-DNS-proxy/
wget https://raw.githubusercontent.com/serverdensity/python-daemon/master/daemon.py
chmod +x ./install.sh
./install.sh
screen -dmS tcpdns python tcpdns.py -f tcpdns.json.example
cd /root
echo -e "TCP DNS Instalado"
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
read -p " "
return 0
}

slow-dns () {
clear&&clear
apt-get install ncurses-utils > /dev/null 2>&1
msg -bar
[[ ! -d /ADMcgh/slow/ ]] && mkdir /ADMcgh/slow/
source <(curl -sSL ${url[utx]}/SlowDNS.sh)
}

_funUDP () {
[[ -e /tmp/udpSS ]] && bash /tmp/udpSS || {
wget -q -O /tmp/udpSS ${url[utx]}/UDPserver.sh
bash /tmp/udpSS
}
rm -f /tmp/udpSS
}

function dnsserver(){
echo -e "Instalando DNS Server"
curl -sSL https://download.technitium.com/dns/install.sh | bash 1> /dev/null 2> /dev/null
echo -e "Actualizando DNS del Servidor"
echo -e "DNS Server Instalado"
echo -e "Consola Web DNS Server: http://$(cat < /bin/ejecutar/IPcgh):5380/"
echo -e "No olvide establecer su password admin del Panel"
}


fun_chisel() {
		cor1='\033[41;1;37m'
		cor2='\033[44;1;37m'
		scor='\033[0m'
		GREEN='\033[1;32m'
		YELLOW='\033[1;33m'
		SCOLOR='\033[0m'
		echo -e "\E[44;1;37m            GERENCIAR CHISEL             \E[0m"
		echo ""


		[[ "$(netstat -tlpn | grep 'docker' | wc -l)" != '0' ]] && {
			sks='\033[1;32mON'
			echo -e "\033[1;33mPORTAS\033[1;37m: \033[1;32m$(netstat -nplt | grep 'docker' | awk {'print $4'} | cut -d: -f2 | xargs)"
		} || {
			sks='\033[1;31mOFF'
		}
        [[ "$(netstat -tlpn | grep 'docker' | wc -l)" != '0' ]] && {
				chiselsts="\033[1;32m⚡⚡ "
			} || {
				chiselsts="\033[1;31m⚡⚡ "
			}
		echo ""
		echo -e "\033[1;31m[\033[1;36m1\033[1;31m] \033[1;37m⚡⚡ \033[1;33mATIVAR CHISEL $chiselsts \033[0m"
		echo -e "\033[1;31m[\033[1;36m2\033[1;31m] \033[1;37m⚡⚡ \033[1;33mREINICIAR CHISEL\033[0m"
		echo -e "\033[1;31m[\033[1;36m0\033[1;31m] \033[1;37m⚡⚡ \033[1;33mVOLTAR\033[0m"
		echo ""
		echo -ne "\033[1;32mRaj, escolhe uma carta \033[1;33m?\033[1;37m "
		read resposta
		if [[ "$resposta" = '1' ]]; then
			if netstat -nltp | grep 'docker' 1>/dev/null 2>/dev/null; then
				clear
				echo -e "\E[41;1;37m             CHISEL              \E[0m"
				echo ""
				fun_chiseloff() {
					docker stop chisel
                    docker rm chisel
					docker.io stop chisel
                    docker.io rm chisel

				}
				echo -e "\033[1;32mDESACTIVANDO CHISEL\033[1;33m"
				echo ""
				fun_bar 'fun_chiseloff'
				echo ""
				echo -e "\033[1;32mCHISEL DESACTIVADO CON EXITO!\033[1;33m"
				sleep 3
				fun_chisel
			else
                clear
                fun_installdocker() {
                    _pacotes=("docker" "docker.io")
                    for _prog in ${_pacotes[@]}; do
                    apt install $_prog -y
                    done
                }
                echo -e "\n${YELLOW}ESTEJA CIENTE QUE ESSE METODO É INSTAVEL\nPODE OU NÃO FUNCIONAR NA SUA MAQUINA\nFIQUE CIENTE DOS RISCOS ! ${SCOLOR}\n"
                echo -ne "${GREEN}DESEJA CONTINUAR A INSTALACAO ? ${YELLOW}[s/n]:${SCOLOR} "
                read resp
                [[ "$resp" != @(s|sim|S|SIM) ]] && {
                    echo -e "\n${RED}Retornando...${SCOLOR}"
                    sleep 2
                    conexao
                }
                echo -e "\n\033[1;32mSOPORTE A Ubuntu 16+ \033[1;33m"
                echo -e "\n\033[1;32mINSTALANDO O CHISEL !\033[1;33m"
				echo ""
				fun_bar 'fun_installdocker'
				clear
				echo -e "\E[44;1;37m             CHISEL              \E[0m"
				echo ""
				echo -ne "\033[1;32mCUAL PORTA DESEA ULTILIZAR \033[1;33m?\033[1;37m: "
				read porta
				[[ -z "$porta" ]] && {
					echo ""
					echo -e "\033[1;31mPUERTO INVALIDO!"
					sleep 3
					clear
					fun_chisel
				}
				verif_ptrs $porta
                clear
                echo -ne "\033[1;32mNOMBRE DE USUARIO:\033[1;37m ";read username
                [[ -z $username ]] && {
                    echo -e "\n${cor1}NO INGRESO NOMBRE DE USUARIO!${scor}\n"
                    fun_chisel
                }
                [[ ${username} != ?(+|-)+([a-zA-Z0-9]) ]] && {
                    echo -e "\n${cor1}SU NOMBRE DE USUARIO ES INCORRECTO!${scor}"
                    echo -e "${cor1}NO USE ESPACIOS, NI CARACTERES ESPECIALES!${scor}\n"
                    fun_chisel
                }
                sizemin=$(echo ${#username})
                [[ $sizemin -lt 2 ]] && {
                    echo -e "\n${cor1}Você digitou um nome de usuário muito curto${scor}"
                    echo -e "${cor1}use no mínimo dois caracteres!${scor}\n"
                    fun_chisel
                }
                sizemax=$(echo ${#username})
                [[ $sizemax -gt 10 ]] && {
                    echo -e "\n${cor1}Você digitou um nome de usuário muito grande"
                    echo -e "${cor1}use no máximo 10 caracteres!${scor}\n"
                    fun_chisel
                }
                echo -ne "\033[1;32mCONTRASEÑA:\033[1;37m ";read password
                [[ -z $password ]] && {
                    echo -e "\n${cor1}NO SE INGRESO CONTRASEÑA!${scor}\n"
                    fun_chisel 
                }
                sizepass=$(echo ${#password})
                [[ $sizepass -lt 4 ]] && {
                    echo -e "\n${cor1}CONTRASEÑA MUY CORTA, USE MINIMO 4 CARACTERES${scor}\n"
                    fun_chisel        
                }
                echo -e "\n\033[1;32mCONFIGURANDO CHISEL !\033[0m"
				echo ""
                fun_inichisel() {
                    docker run --name chisel -p $porta:$porta -d --restart always jpillora/chisel server -p $porta --socks5 --key supersecret --auth "$username:$password"
                    docker.io run --name chisel -p $porta:$porta -d --restart always jpillora/chisel server -p $porta --socks5 --key supersecret --auth "$username:$password"
                }
                fun_bar 'fun_inichisel'
                clear
                echo -e "\n\033[1;32mCHISEL INSTALADO EXITOSAMENTE !\033[1;31m PORTA: \033[1;33m${porta}\033[0m"
				sleep 3
				clear
				fun_chisel
            fi
        elif [[ "$resposta" = '2' ]]; then
            clear
            echo -e "\n\033[1;32mREINICIANDO CHISEL !\033[1;33m"
			echo ""
            fun_attchisel() {
                docker restart chisel
                docker.io restart chisel
            }
            fun_attchisel
            clear
            echo -e "\n\033[1;32mCHISEL REINICIANDO EXITOSAMENTE !\033[1;33m"
            sleep 1
            fun_chisel
        elif [[ "$resposta" = '0' ]]; then
			echo ""
			echo -e "\033[1;31mRetornando...\033[0m"
			sleep 1
			return
		else
			echo ""
			echo -e "\033[1;31mOpcao invalida !\033[0m"
			sleep 1
			fi
    }
while true; do	
#FUNCOES
cor[0]="\033[0m"
cor[1]="\033[1;34m"
cor[2]="\033[1;32m"
cor[3]="\033[1;37m"
cor[4]="\033[1;36m"
cor[5]="\033[1;33m"
cor[6]="\033[1;35m"
unset squid
unset dropbear
unset openvpn
unset stunel
unset shadow
unset telegran
unset socks
unset gettun
unset tcpbypass
unset webminn
unset ddos
unset v2ray
_portbaSE="$(netstat -tunlp)"
_ps="$(ps x)"
tojanss=`if echo -e "$_portbaSE" | grep trojan 1> /dev/null 2> /dev/null; then
echo -e "\033[1;32m[ON] "
else
echo -e "\033[1;31m[OFF]"
fi`;
[[ $(echo -e "$_portbaSE" | grep trojan) ]] && pTROJ="\033[1;32m[ON] " || pTROJ="\033[1;31m[OFF]"
pps=`if echo -e "$_portbaSE" | grep psiphond 1> /dev/null 2> /dev/null; then
echo -e "\033[1;32m[ON] "
else
echo -e "\033[1;31m[OFF]"
fi`;
v2ray=`if echo -e "$_portbaSE" | grep v2ray 1> /dev/null 2> /dev/null; then
echo -e "\033[1;32m[ON] "
else
	if echo -e "$_portbaSE" | grep x-ui 1> /dev/null 2> /dev/null; then
	echo -e "\033[1;32m[\033[0;34mUI\033[1;32m] "
	else
	echo -e "\033[1;31m[OFF]"
	fi
fi`;

xclash=`if echo -e "$_portbaSE" | grep clash 1> /dev/null 2> /dev/null; then
echo -e "\033[1;32m[ON] "
else
[[ -e /root/.config/clash/config.yaml ]] && echo -e "\033[1;32m[\033[0;34mCFA\033[1;32m]" || echo -e "\033[1;31m[OFF]"
fi`;
[[ $(echo -e "${_ps}"| grep udpServer| grep -v grep) ]] && _pidUDP="\033[0;34m[US] " || {
	[[ $(echo -e "${_ps}"| grep UDP-Custom| grep -v grep) ]] && _pidUDP="\033[1;32m[\033[0;34mUC\033[1;32m] " || {
		[[ $(echo -e "${_ps}"| grep hysteria| grep -v grep) ]] && _pidUDP="\033[1;32m[\033[0;34mHYS\033[1;32m] " 
		} || _pidUDP="\033[1;31m[OFF]"
}
slowssh=$(echo -e "${_ps}"| grep "slowdns-ssh"|grep -v grep > /dev/null && echo -e "\033[1;32m⚡⚡ " || echo -e "\033[1;31m⚡⚡ ")
slowpid=$(echo -e "${_ps}" | grep -w "dns-server" | grep -v "grep" | awk -F "pts" '{print $1}') && [[ ! -z $slowpid ]] && P1="\033[0;32m[ON] " || P1="\033[1;31m[OFF]"
[[ -e /etc/squid3/squid.conf ]] && squid="\033[0;32m[ON] " || squid="\033[1;31m[OFF]"
[[ -e /etc/squid/squid.conf ]] && squid="\033[0;32m[ON] " || squid="\033[1;31m[OFF]"
[[ $(echo -e "$_portbaSE" |grep dropbear|head -1) ]] && dropb="\033[1;32m[ON] " || dropb="\033[1;31m[OFF]"
[[ -e /etc/openvpn/server.conf ]] && openvpn="\033[0;32m[ON] " || openvpn="\033[1;31m[OFF]"
[[ $(echo -e "$_portbaSE" |grep stunnel|head -1) ]] && stunel="\033[1;32m[ON] " || stunel="\033[1;31m[OFF]"
[[ -e /etc/shadowsocks.json ]] && shadow="\033[1;32m[ON]" || shadow="\033[1;31m[OFF]"
[[ "$(echo -e "${_ps}" | grep "ultimatebot" | grep -v "grep")" != "" ]] && telegran="\033[1;32m[ON]"
[[ $(echo -e "${_ps}" | grep "PDirect.py") ]] && socks="\033[1;32m[\033[0;34mPyD\033[1;32m]" || socks="\033[1;31m[OFF]"
[[ $(echo -e "${_ps}" | grep "PDirect80") ]] && socksA="\033[1;32m[\033[0;34mRUN\033[1;32m]" || socksA="\033[1;31m[OFF]"
[[ -e /ADMcgh/edbypass ]] && tcpbypass="\033[1;32m[ON]" || tcpbypass="\033[1;31m[OFF]"
[[ -e /etc/webmin/miniserv.conf ]] && webminn="\033[1;32m[ON]" || webminn="\033[1;31m[OFF]"
[[ -e /usr/local/x-ui/bin/config.json ]] && v2ui="\033[1;32m[ON]" || v2ui="\033[1;31m[OFF]"
[[ -e /usr/local/etc/trojan/config.json ]] && troj="\033[1;32m[ON]" || troj="\033[1;31m[OFF]"
[[ -e /etc/default/sslh ]] && sslh="\033[1;32m[ON] " || sslh="\033[1;31m[OFF]"
[[ -e /usr/local/ddos/ddos.conf ]] && ddos="\033[1;32m[ON]"
ssssrr=`ps -ef |grep -v grep | grep server.py |awk '{print $2}'`
[[ ! -z "${ssssrr}" ]] && cc="\033[1;32m" || cc="\033[1;31m"
[[ -d /usr/local/shadowsocksr ]] && { 
user_info=$(cd /usr/local/shadowsocksr &> /dev/null  && python mujson_mgr.py -l )
user_t="\033[1;33m$(echo "${user_info}"|wc -l) Cts" 
} || user_t="\033[1;31m[OFF]"
[[ `grep -c "^#ADM" /etc/sysctl.conf` -eq 0 ]] && _tcpd="\033[1;31m[OFF]" || _tcpd="\033[0;31m[\033[0;32mON\033[0;31m] "
[[ "$(cat /etc/pam.d/common-password | grep drowkid | wc -l)" != '0' ]] && _fv="\033[0;31m[\033[0;32mON\033[0;31m]" || _fv="\033[1;31m[OFF]"
[[ -e /etc/.hosts.original ]] && _ADS="\033[0;31m[\033[0;32mON\033[0;31m]" || _ADS="\033[1;31m[OFF]"
[[ "$(echo -e "$_portbaSE"  | grep 'docker' | wc -l)" != '0' ]] && chiselsts="\033[1;32m[ON]" || chiselsts="\033[1;31m[OFF]"
tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2 && tput cuu1 >&2 && tput dl1 >&2
echo -e "${cor[5]} ${h0nG} INSTALACION DE PROTOCOLOS ${h0nG} "
msg -bar 
echo -e "\033[0;35m [\033[0;36m1\033[0;35m]\033[0;33m${flech} ${cor[3]}SQUID         $squid \033[0;35m [\033[0;36m11\033[0;35m]\033[0;33m${flech} ${cor[3]}PSIPHON SERVER $pps"
echo -e "\033[0;35m [\033[0;36m2\033[0;35m]\033[0;33m${flech} ${cor[3]}DROPBEAR      $dropb \033[0;35m [\033[0;36m12\033[0;35m]\033[0;33m${flech} ${cor[3]}TCP DNS        \033[0;33m(#BETA)"
echo -e "\033[0;35m [\033[0;36m3\033[0;35m]\033[0;33m${flech} ${cor[3]}OPENVPN       $openvpn \033[0;35m [\033[0;36m13\033[0;35m]\033[0;33m${flech} ${cor[3]}WEBMIN         $webminn"
echo -e "\033[0;35m [\033[0;36m4\033[0;35m]\033[0;33m${flech} ${cor[3]}SSL/TLS       $stunel \033[0;35m [\033[0;36m14\033[0;35m]\033[0;33m${flech} ${cor[3]}SlowDNS        $P1"
echo -e "\033[0;35m [\033[0;36m5\033[0;35m]\033[0;33m${flech} ${cor[3]}SHADOWSOCKS-R $shadow \033[0;35m [\033[0;36m15\033[0;35m]\033[0;33m${flech} ${cor[3]}SSL->PYTHON   ${socksA}" #\033[0;33m(#BETA)"
echo -e "\033[0;35m [\033[0;36m6\033[0;35m]\033[0;33m${flech} ${cor[3]}SHADOWSOCKS   $user_t \033[0;35m [\033[0;36m16\033[0;35m]\033[0;33m${flech} ${cor[3]}SSLH [@kalix1] $sslh"
echo -e "\033[0;35m [\033[0;36m7\033[0;35m]\033[0;33m${flech} ${cor[3]}PROXY PYTHON  $socks \033[0;35m [\033[0;36m17\033[0;35m]\033[0;33m${flech} ${cor[3]}OVER WEBSOCKET \033[0;33m(#BETA)"
echo -e "\033[0;35m [\033[0;36m8\033[0;35m]\033[0;33m${flech} ${cor[3]}V2RAY SWITCH  $v2ray \033[0;35m [\033[0;36m18\033[0;35m]\033[0;33m${flech} ${cor[3]}SOCKS5         \033[0;33m(#BETA)"
echo -e "\033[0;35m [\033[0;36m9\033[0;35m]\033[0;33m${flech} ${cor[3]}CFA ( CLASH ) $xclash\033[0;35m  [\033[0;36m19\033[0;35m]\033[0;33m${flech} ${cor[3]}Protocolos UDP  $_pidUDP"
echo -e "\033[0;35m [\033[0;36m10\033[0;35m]\033[0;33m${flech} ${cor[3]}TROJAN-GO    $pTROJ \033[0;35m [\033[0;36m20\033[0;35m]\033[0;33m${flech} ${cor[5]}FUNCIONES EN DISEO!"
msg -bar #msg -bar
echo -e "${cor[5]} ${h0nG} INSTALACION DE HERRAMIENTAS Y SERVICIOS ${h0nG} "
msg -bar
echo -e "\033[0;35m [\033[0;36m21\033[0;35m]\033[0;33m ${flech} ${cor[3]}BLOCK TORRENT        \033[0;35m [\033[0;36m22\033[0;35m]\033[0;33m ${flech} ${cor[3]}BadVPN   $_badvpn"
echo -e "\033[0;35m [\033[0;36m23\033[0;35m]\033[0;33m ${flech} ${cor[3]}TCP (BBR|Plus) $_tcpd \033[0;35m [\033[0;36m24\033[0;35m]\033[0;33m ${flech} ${cor[3]}FAILBAN  $fail_b"
echo -e "\033[0;35m [\033[0;36m25\033[0;35m]\033[0;33m ${flech} ${cor[3]}ARCHIVO ONLINE \033[0;31m[\033[0;32m${portFTP}\033[0;31m]  \033[0;35m [\033[0;36m26\033[0;35m]\033[0;33m ${flech} ${cor[3]}UP|DOWN SpeedTest " #\033[0;35m [\033[0;36m0\033[0;35m]\033[0;33m ? $(msg -bra "\e[3;33m[ SALIR ]\e[0m")"
echo -e "\033[0;35m [\033[0;36m27\033[0;35m]\033[0;33m ${flech} ${cor[3]}DETALLES DEL VPS     \033[0;35m [\033[0;36m28\033[0;35m]\033[0;33m ${flech} ${cor[3]}Block ADS $_ADS" #\033[0;35m [\033[0;36m0\033[0;35m]\033[0;33m ? $(msg -bra "\e[3;33m[ SALIR ]\e[0m")"
echo -e "\033[0;35m [\033[0;36m29\033[0;35m]\033[0;33m ${flech} ${cor[3]}DNS CUSTOM (NETFLIX) \033[0;35m [\033[0;36m30\033[0;35m]\033[0;33m ${flech} ${cor[3]}FIREWALLD CUSTOM" #\033[0;35m [\033[0;36m0\033[0;35m]\033[0;33m ? $(msg -bra "\e[3;33m[ SALIR ]\e[0m")"
echo -e "\033[0;35m [\033[0;36m31\033[0;35m]\033[0;33m ${flech} ${cor[3]}Fix PassWD VULTR ${_fv} \033[0;35m [\033[0;36m0\033[0;35m]\033[0;33m ${flech} $(msg -bra "\033[1;41m[ REGRESAR ]\e[0m")"
msg -bar 
selection=$(selectw 20)
case ${selection} in
0) break;;
1) fun_squid && read -p " Enter";;
#2) fun_dropbear && read -p " Enter";;
2)
wget -O /bin/drowkid https://gist.githubusercontent.com/vpsnetdk/8ffe14b053ff0da619afa58c2477e879/raw/a3498e77520606e1f585b8455cff569babc1c4ca/drowkid.sh &> /dev/null
chmod +rwx /bin/drowkid
drowkid --dropbear
read -p " Enter"
rm /bin/drowkid
;;
3) fun_openvpn && read -p " Enter";;
4) ssl_stunel && read -p " Enter";;
5) fun_shadowsocks && read -p " Enter";;
6) ssrmenu && read -p " Enter";;
7) iniciarsocks && read -p " Enter";;
8) v2ray-socket && read -p " Enter";;
9) instala_clash && read -p " Enter";;
10) trojan && read -p " Enter";;
11) psix && read -p " Enter";;
12) tcpd && read -p " Enter";;
13) web_min && read -p " Enter";;
14) slow-dns && read -p " Enter";;
15) source <(curl -sSL ${url[utx]}/autoconfig.sh) && read -p " Enter";;
16) #source <(curl -sSL https://raw.githubusercontent.com/emirjorge/Script-Z/master/CHUMO/Recursos/menu_inst/sslh-back3.sh) && read -p " Enter";;
wget -O /bin/drowkid https://gist.githubusercontent.com/vpsnetdk/8ffe14b053ff0da619afa58c2477e879/raw/a3498e77520606e1f585b8455cff569babc1c4ca/drowkid.sh &> /dev/null
chmod +rwx /bin/drowkid
drowkid --sslh
read -p " Enter"
rm /bin/drowkid
;;
17) source <(curl -sSL ${url[utx]}/ws-java.sh) && read -p " Enter";;
18) source <(curl -sSL ${url[utx]}/socks5.sh) && read -p " Enter";;
19) _funUDP && read -p " Enter";;
20) source <(curl -sSL ${url[utx]}/h_beta.sh) && read -p " Enter";;
#21)fun_chisel && read -p " Enter";;
21) source <(curl -sL ${url[utx]}/blockT.sh) && enter ;; # https://raw.githubusercontent.com/emirjorge/Script-Z/master/CHUMO/Recursos/blockT.sh) && read -p " Enter";;
22) funBadVPN && read -p " Enter";;
23) funTCP && read -p " Enter";;
24) funFAILBAN && read -p " Enter";;
25) funARQONLINE && read -p " Enter";;
26) funSPEED && read -p " Enter";;
27) funDETSYS && read -p " Enter";;
28) BlockADS && read -p " Enter";;
29) wget -q -O /tmp/dnsNN.sh ${url[utx]}/dnsNN.sh &> /dev/null ; chmod +x /tmp/dnsNN.sh;bash /tmp/dnsNN.sh && read -p " Enter";;
31) BlockADS && read -p " Enter";;
30) fun_bar 'fun_ports' && read -p " Enter";;
esac
done
#Reinicia ADM
