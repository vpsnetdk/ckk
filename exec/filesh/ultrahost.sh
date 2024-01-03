#!/usr/bin/env sh

                        unset soporte slogan
            soporte=@drowkid01 && slogan="✧ | ᴅʀᴏᴡᴋɪᴅ | ✧"

declare -A sdir=( [banner]="banner" [fpy]="filepy" [fsh]="filesh" [v]="version" [drw]="main" [tmp]=tmp )
declare -A sfile=( [exec]=${sdir[fsh]}/cabecalho.sh [f2b]=${sdir[fsh]}/fai2ban.sh [frm]=${sdir[fsh]}/ferramentas.sh [minst]=${sdir[fsh]}/menu_inst.sh [pyl]=${sdir[fsh]}/payloads [ss]=${sdir[fsh]}/shadowsocks.sh [uht]=${sdir[fsh]}/ultrahost.sh [usr]=${sdir[fsh]}/usercodes.sh [PDirect]=${sdir[fpy]}/PDirect.py [PGet]=${sdir[fpy]}/PGet.py [POpen]=${sdir[fpy]}/POpen.py [PPriv]=${sdir[fpy]}/PPriv.py [PPub]=${sdir[fpy]}/PPub.py [ress]=${sdir[banner]}/message.txt [banner]=${sdir[banner]}/name [main]=main.sh [version]=${sdir[v]}/v-new.log [msg]=${sdir[tmp]}/msg )
declare -A url=( [py]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filepy" [sh]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filesh" [main]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/main.sh" [msg]="https://gist.githubusercontent.com/vpsnetdk/a47403148a3f10fbbf645089597f5af7/raw/e902f8fd9a273912379a5b0ea0eb3a6e34f00a91/msg" [utx]="https://raw.githubusercontent.com/vpsnetdk/files-ckk/main" )

subdom () {
SUBDOM="$1"
[[ "$SUBDOM" = "" ]] && return
randomize="$RANDOM"
    for sites in `cat $log`; do
    [[ $(echo ${DNS[@]}|grep $sites) = "" ]] && DNS+=($sites)
    [[ $(echo ${DNS[@]}|grep $sites) != "" ]] && cat $log|grep -v "$sites" > $log
    done
    while true; do
    [[ "$(pidof lynx | wc -w)" -lt "20" ]] && break
    done
    (
    HOST[$randomize]="$SUBDOM"
    curl -sSL "${HOST[$randomize]}"|grep -Eoi '<a [^>]+>'|grep -Eo 'href="[^\"]+"'|grep -Eo '(http|https)://[a-zA-Z0-9./*]+'|sort -u|awk -F "://" '{print $2}' >> $log
    ) > /dev/null 2>&1 &
}

iniciar () {
SUB_DOM=$1
limite=$2
[[ ${SUB_DOM} = "" ]] && read -p "Site Alvo: " SUB_DOM
[[ ${limite} = "" ]] && limite="300"
#CRIA LOG
log="./loog" && touch $log
#INICIA PRIMEIRA BUSCA
_DOM=$(curl -sSL "$SUB_DOM"|grep -Eoi '<a [^>]+>'|grep -Eo 'href="[^\"]+"'|grep -Eo '(http|https)://[a-zA-Z0-9./*]+'|sort -u|awk -F "://" '{print $2}')
  for _DOMS in `echo $_DOM`; do
 [[ $(echo ${DNS[@]}|grep ${_DOMS}) = "" ]] && DNS+=(${_DOMS})
  done
#INICIA THREADS
i=0
while true; do
DOMAIN=$(echo "${DNS[$i]}")
[[ $DOMAIN = "" ]] && break
 if [[ $(echo -e "${PESQ[@]}"|grep "$DOMAIN") = "" ]]; then
  subdom "$DOMAIN"
  echo -e "\033[1;31m(Scan\033[1;32m $((${#PESQ[@]}+1))\033[1;31m de \033[1;32m${#DNS[@]}\033[1;31m) - Escaneando ---> \033[1;36mhttp://$DOMAIN\033[1;37m"
  PESQ+=($DOMAIN)
 fi
[[ "$(echo ${#DNS[@]})" -gt "$limite" ]] && break
i=$(($i+1))
sleep 1s
done
rm $log
echo -e "\033[1;31m====================================\n\033[1;32mScan Finalizado!, Iniciando Coleta de IPs\033[1;31m\n====================================\033[0m"
[[ -e $HOME/subresult ]] && rm $HOME/subresult
[[ ! -e $HOME/subresult ]] && touch $HOME/subresult

for result in $(echo "${DNS[@]}"); do
(
rand="$RANDOM"
dns[rand]="$result"
scan[rand]=$(echo ${result}|cut -d'/' -f1)
IP[rand]=$(nslookup "${scan[rand]}"|grep -Eo 'Address: [0-9.]+'|grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'|tail -1) > /dev/null 2>&1
echo -e "====================================\nDNS: ${dns[rand]}\nIP: ${IP[rand]}\n====================================" >> $HOME/subresult
unset IP
) &
done
while true; do
[[ $(pidof nslookup|wc -w) -lt "1" ]] && break
done
RSLT=$(($(cat $HOME/subresult|wc -l)/4)) && echo -e "\033[1;31m====================================\n\033[1;32m$RSLT Hosts Capturados\n\033[1;31m====================================\033[0m"
echo -ne "Desea Imprimir los Resultados? [S/N]: "; read yn
   [[ $yn = @(s|S|y|Y) ]] && {
   echo -ne "\033[1;32m"
   cat $HOME/subresult|grep -v =
   echo -e "\033[1;31m====================================\033[0m"
   }
return 0
}

#INICIA SCRIPT
echo -e "\033[1;31m====================================\033[0m"
echo -e "\033[1;33m INICIALIZANDO PROCEDIMENTOS (SCAN)"
echo -e "\033[1;31m====================================\033[0m"
iniciar $1 $2
[[ $? = "0" ]] &&
echo -e "\033[1;32mRegistro Generado en : $HOME/subresult\033[0m" &&
echo -e "\033[1;31m====================================\033[0m"
