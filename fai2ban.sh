#!/usr/bin/env sh

                                unset soporte slogan
                    soporte=@drowkid01 && slogan="✧ | ᴅʀᴏᴡᴋɪᴅ | ✧"

declare -A sdir=( [banner]="banner" [fpy]="filepy" [fsh]="filesh" [v]="version" [drw]="main" [tmp]=tmp )
declare -A sfile=( [exec]=${sdir[fsh]}/cabecalho.sh [f2b]=${sdir[fsh]}/fai2ban.sh [frm]=${sdir[fsh]}/ferramentas.sh [minst]=${sdir[fsh]}/menu_inst.sh [pyl]=${sdir[fsh]}/payloads [ss]=${sdir[fsh]}/shadowsocks.sh [uht]=${sdir[fsh]}/ultrahost.sh [usr]=${sdir[fsh]}/usercodes.sh [PDirect]=${sdir[fpy]}/PDirect.py [PGet]=${sdir[fpy]}/PGet.py [POpen]=${sdir[fpy]}/POpen.py [PPriv]=${sdir[fpy]}/PPriv.py [PPub]=${sdir[fpy]}/PPub.py [ress]=${sdir[banner]}/message.txt [banner]=${sdir[banner]}/name [main]=${sdir[tmp]}/main.sh [version]=${sdir[v]}/v-new.log [msg]=${sdir[tmp]}/msg )
declare -A url=( [py]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filepy" [sh]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/filesh" [main]="https://raw.githubusercontent.com/vpsnetdk/ckk/main/exec/main.sh" [msg]="https://gist.githubusercontent.com/vpsnetdk/a47403148a3f10fbbf645089597f5af7/raw/e902f8fd9a273912379a5b0ea0eb3a6e34f00a91/msg" [utx]="https://raw.githubusercontent.com/vpsnetdk/files-ckk/main" )

source ${sfile[msg]}
source ${sfile[main]}


failtwoban=$(dpkg -l | grep fail2ban | grep ii)
apache=$(dpkg -l | grep apache2 | grep ii)
squid=$(dpkg -l | grep squid | grep ii)
dropbear=$(dpkg -l | grep dropbear | grep ii)
openssh=$(dpkg -l | grep openssh | grep ii)
if [ "$openssh" != "" ]; then
s1="ssh"
fi
if [ "$squid" != "" ]; then
s2="squid"
fi
if [ "$dropbear" != "" ]; then
s3="dropbear"
fi
if [ "$apache" != "" ]; then
s4="apache"
fi
echo -e "${cor[1]} =================================== ${cor[0]}"


fail2ban_function () {
if [ "$failtwoban" != "" ]; then
echo -e "${cor[4]} ${txt[143]}"
echo -e "${cor[2]} |1| >${cor[3]} ${txt[144]}"
echo -e "${cor[2]} |2| >${cor[3]} ${txt[145]}"
echo -e "${cor[1]} =================================== ${cor[0]}"
read -p " [1|2]: " lo_og
if [ "$lo_og" = "2" ]; then
cat /var/log/fail2ban.log
fi
if [ "$lo_og" = "1" ]; then
echo -e "${cor[1]} =================================== \033[1;37m"
fun_bar "apt-get remove fail2ban -y"
fi
echo -e "${cor[1]} =================================== ${cor[0]}"
return
fi

echo -e "${cor[5]} ${txt[146]}"
echo -e "${cor[5]} ${txt[147]}"
echo -e "${cor[5]} ${txt[148]}"
echo -e "${cor[5]} ${txt[149]}"
echo -e "${cor[5]} ${txt[150]}"
echo -e "${cor[5]} ${txt[151]}"
echo -e "${cor[5]} ${txt[152]}"
echo -e "${cor[1]} =================================== \033[1;37m"
read -p " [S/N]: " fail2ban
if [[ "$fail2ban" = "s" || "$fail2ban" = "S" ]]; then
echo -e "${cor[1]} =================================== \033[1;37m"
fun_bar "apt-get install fail2ban -y"
cd $HOME
wget -O fail2ban https://github.com/ChumoGH/chumogh-gmail.com/raw/master/fail2ban-0.9.4.tar.gz -o /dev/null
tar -xf $HOME/fail2ban
cd $HOME/fail2ban-0.9.4
fun_bar "./setup.py install"
echo '[INCLUDES]
before = paths-debian.conf
[DEFAULT]
ignoreip = 127.0.0.1/8
# ignorecommand = /path/to/command <ip>
ignorecommand =
bantime  = 1036800
findtime  = 3600
maxretry = 5
backend = auto
usedns = warn
logencoding = auto
enabled = false
filter = %(__name__)s
destemail = root@localhost
sender = root@localhost
mta = sendmail
protocol = tcp
chain = INPUT
port = 0:65535
fail2ban_agent = Fail2Ban/%(fail2ban_version)s
banaction = iptables-multiport
banaction_allports = iptables-allports
action_ = %(banaction)s[name=%(__name__)s, bantime="%(bantime)s", port="%(port)s", protocol="%(protocol)s", chain="%(chain)s"]
action_mw = %(banaction)s[name=%(__name__)s, bantime="%(bantime)s", port="%(port)s", protocol="%(protocol)s", chain="%(chain)s"]
            %(mta)s-whois[name=%(__name__)s, sender="%(sender)s", dest="%(destemail)s", protocol="%(protocol)s", chain="%(chain)s"]
action_mwl = %(banaction)s[name=%(__name__)s, bantime="%(bantime)s", port="%(port)s", protocol="%(protocol)s", chain="%(chain)s"]
             %(mta)s-whois-lines[name=%(__name__)s, sender="%(sender)s", dest="%(destemail)s", logpath=%(logpath)s, chain="%(chain)s"]
action_xarf = %(banaction)s[name=%(__name__)s, bantime="%(bantime)s", port="%(port)s", protocol="%(protocol)s", chain="%(chain)s"]
             xarf-login-attack[service=%(__name__)s, sender="%(sender)s", logpath=%(logpath)s, port="%(port)s"]
action_cf_mwl = cloudflare[cfuser="%(cfemail)s", cftoken="%(cfapikey)s"]
                %(mta)s-whois-lines[name=%(__name__)s, sender="%(sender)s", dest="%(destemail)s", logpath=%(logpath)s, chain="%(chain)s"]
action_blocklist_de  = blocklist_de[email="%(sender)s", service=%(filter)s, apikey="%(blocklist_de_apikey)s", agent="%(fail2ban_agent)s"]
action_badips = badips.py[category="%(__name__)s", banaction="%(banaction)s", agent="%(fail2ban_agent)s"]
action_badips_report = badips[category="%(__name__)s", agent="%(fail2ban_agent)s"]
action = %(action_)s' > /etc/fail2ban/jail.local
echo -e "${cor[1]} =================================== ${cor[0]}"
echo -e "${cor[5]} ${txt[153]}"
echo -e "${cor[5]} ${txt[154]}"
if [ "$s1" != "" ]; then
echo -ne " $s1"
fi
if [ "$s2" != "" ]; then
echo -ne " $s2"
fi
if [ "$s3" != "" ]; then
echo -ne " $s3"
fi
if [ "$s4" != "" ]; then
echo -ne " $s4"
fi
echo -e ""
echo -e "${cor[1]} =================================== ${cor[0]}"
echo -e "${cor[5]} ${txt[155]}"
read -p " [S/N]: " sim_nao
if [[ "$sim_nao" = "s" || "$sim_nao" = "S" ]]; then
if [ "$s1" != "" ]; then
echo '[sshd]
enabled = true
port    = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s
[sshd-ddos]
enabled = true
port    = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s' >> /etc/fail2ban/jail.local
else
echo '[sshd]
port    = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s
[sshd-ddos]
port    = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s' >> /etc/fail2ban/jail.local
fi
if [ "$s2" != "" ]; then
echo '[squid]
enabled = true
port     =  80,443,3128,8080
logpath = /var/log/squid/access.log' >> /etc/fail2ban/jail.local
else
echo '[squid]
port     =  80,443,3128,8080
logpath = /var/log/squid/access.log' >> /etc/fail2ban/jail.local
fi
if [ "$s3" != "" ]; then
echo '[dropbear]
enabled = true
port     = ssh
logpath  = %(dropbear_log)s
backend  = %(dropbear_backend)s' >> /etc/fail2ban/jail.local
else
echo '[dropbear]
port     = ssh
logpath  = %(dropbear_log)s
backend  = %(dropbear_backend)s' >> /etc/fail2ban/jail.local
fi
if [ "$s4" != "" ]; then
echo '[apache-auth]
enabled = true
port     = http,https
logpath  = %(apache_error_log)s' >> /etc/fail2ban/jail.local
else
echo '[apache-auth]
port     = http,https
logpath  = %(apache_error_log)s' >> /etc/fail2ban/jail.local
fi
echo '[selinux-ssh]
port     = ssh
logpath  = %(auditd_log)s
[apache-badbots]
port     = http,https
logpath  = %(apache_access_log)s
bantime  = 172800
maxretry = 1
[apache-noscript]
port     = http,https
logpath  = %(apache_error_log)s
[apache-overflows]
port     = http,https
logpath  = %(apache_error_log)s
maxretry = 2
[apache-nohome]
port     = http,https
logpath  = %(apache_error_log)s
maxretry = 2
[apache-botsearch]
port     = http,https
logpath  = %(apache_error_log)s
maxretry = 2
[apache-fakegooglebot]
port     = http,https
logpath  = %(apache_access_log)s
maxretry = 1
ignorecommand = %(ignorecommands_dir)s/apache-fakegooglebot <ip>
[apache-modsecurity]
port     = http,https
logpath  = %(apache_error_log)s
maxretry = 2
[apache-shellshock]
port    = http,https
logpath = %(apache_error_log)s
maxretry = 1
[openhab-auth]
filter = openhab
action = iptables-allports[name=NoAuthFailures]
logpath = /opt/openhab/logs/request.log
[nginx-http-auth]
port    = http,https
logpath = %(nginx_error_log)s
[nginx-limit-req]
port    = http,https
logpath = %(nginx_error_log)s
[nginx-botsearch]
port     = http,https
logpath  = %(nginx_error_log)s
maxretry = 2
[php-url-fopen]
port    = http,https
logpath = %(nginx_access_log)s
          %(apache_access_log)s
[suhosin]
port    = http,https
logpath = %(suhosin_log)s
[lighttpd-auth]
port    = http,https
logpath = %(lighttpd_error_log)s
[roundcube-auth]
port     = http,https
logpath  = %(roundcube_errors_log)s
[openwebmail]
port     = http,https
logpath  = /var/log/openwebmail.log
[horde]
port     = http,https
logpath  = /var/log/horde/horde.log
[groupoffice]
port     = http,https
logpath  = /home/groupoffice/log/info.log
[sogo-auth]
port     = http,https
logpath  = /var/log/sogo/sogo.log
[tine20]
logpath  = /var/log/tine20/tine20.log
port     = http,https
[drupal-auth]
port     = http,https
logpath  = %(syslog_daemon)s
backend  = %(syslog_backend)s
[guacamole]
port     = http,https
logpath  = /var/log/tomcat*/catalina.out
[monit]
#Ban clients brute-forcing the monit gui login
port = 2812
logpath  = /var/log/monit
[webmin-auth]
port    = 10000
logpath = %(syslog_authpriv)s
backend = %(syslog_backend)s
[froxlor-auth]
port    = http,https
logpath  = %(syslog_authpriv)s
backend  = %(syslog_backend)s
[3proxy]
port    = 3128
logpath = /var/log/3proxy.log
[proftpd]
port     = ftp,ftp-data,ftps,ftps-data
logpath  = %(proftpd_log)s
backend  = %(proftpd_backend)s
[pure-ftpd]
port     = ftp,ftp-data,ftps,ftps-data
logpath  = %(pureftpd_log)s
backend  = %(pureftpd_backend)s
[gssftpd]
port     = ftp,ftp-data,ftps,ftps-data
logpath  = %(syslog_daemon)s
backend  = %(syslog_backend)s
[wuftpd]
port     = ftp,ftp-data,ftps,ftps-data
logpath  = %(wuftpd_log)s
backend  = %(wuftpd_backend)s
[vsftpd]
port     = ftp,ftp-data,ftps,ftps-data
logpath  = %(vsftpd_log)s
[assp]
port     = smtp,465,submission
logpath  = /root/path/to/assp/logs/maillog.txt
[courier-smtp]
port     = smtp,465,submission
logpath  = %(syslog_mail)s
backend  = %(syslog_backend)s
[postfix]
port     = smtp,465,submission
logpath  = %(postfix_log)s
backend  = %(postfix_backend)s
[postfix-rbl]
port     = smtp,465,submission
logpath  = %(postfix_log)s
backend  = %(postfix_backend)s
maxretry = 1
[sendmail-auth]
port    = submission,465,smtp
logpath = %(syslog_mail)s
backend = %(syslog_backend)s
[sendmail-reject]
port     = smtp,465,submission
logpath  = %(syslog_mail)s
backend  = %(syslog_backend)s
[qmail-rbl]
filter  = qmail
port    = smtp,465,submission
logpath = /service/qmail/log/main/current
[dovecot]
port    = pop3,pop3s,imap,imaps,submission,465,sieve
logpath = %(dovecot_log)s
backend = %(dovecot_backend)s
[sieve]
port   = smtp,465,submission
logpath = %(dovecot_log)s
backend = %(dovecot_backend)s
[solid-pop3d]
port    = pop3,pop3s
logpath = %(solidpop3d_log)s
[exim]
port   = smtp,465,submission
logpath = %(exim_main_log)s
[exim-spam]
port   = smtp,465,submission
logpath = %(exim_main_log)s
[kerio]
port    = imap,smtp,imaps,465
logpath = /opt/kerio/mailserver/store/logs/security.log
[courier-auth]
port     = smtp,465,submission,imap3,imaps,pop3,pop3s
logpath  = %(syslog_mail)s
backend  = %(syslog_backend)s
[postfix-sasl]
port     = smtp,465,submission,imap3,imaps,pop3,pop3s
logpath  = %(postfix_log)s
backend  = %(postfix_backend)s
[perdition]
port   = imap3,imaps,pop3,pop3s
logpath = %(syslog_mail)s
backend = %(syslog_backend)s
[squirrelmail]
port = smtp,465,submission,imap2,imap3,imaps,pop3,pop3s,http,https,socks
logpath = /var/lib/squirrelmail/prefs/squirrelmail_access_log
[cyrus-imap]
port   = imap3,imaps
logpath = %(syslog_mail)s
backend = %(syslog_backend)s
[uwimap-auth]
port   = imap3,imaps
logpath = %(syslog_mail)s
backend = %(syslog_backend)s
[named-refused]
port     = domain,953
logpath  = /var/log/named/security.log
[nsd]
port     = 53
action   = %(banaction)s[name=%(__name__)s-tcp, port="%(port)s", protocol="tcp", chain="%(chain)s", actname=%(banaction)s-tcp]
           %(banaction)s[name=%(__name__)s-udp, port="%(port)s", protocol="udp", chain="%(chain)s", actname=%(banaction)s-udp]
logpath = /var/log/nsd.log
[asterisk]
port     = 5060,5061
action   = %(banaction)s[name=%(__name__)s-tcp, port="%(port)s", protocol="tcp", chain="%(chain)s", actname=%(banaction)s-tcp]
           %(banaction)s[name=%(__name__)s-udp, port="%(port)s", protocol="udp", chain="%(chain)s", actname=%(banaction)s-udp]
           %(mta)s-whois[name=%(__name__)s, dest="%(destemail)s"]
logpath  = /var/log/asterisk/messages
maxretry = 10
[freeswitch]
port     = 5060,5061
action   = %(banaction)s[name=%(__name__)s-tcp, port="%(port)s", protocol="tcp", chain="%(chain)s", actname=%(banaction)s-tcp]
           %(banaction)s[name=%(__name__)s-udp, port="%(port)s", protocol="udp", chain="%(chain)s", actname=%(banaction)s-udp]
           %(mta)s-whois[name=%(__name__)s, dest="%(destemail)s"]
logpath  = /var/log/freeswitch.log
maxretry = 10
[mysqld-auth]
port     = 3306
logpath  = %(mysql_log)s
backend  = %(mysql_backend)s
[recidive]
logpath  = /var/log/fail2ban.log
banaction = %(banaction_allports)s
bantime  = 604800  ; 1 week
findtime = 86400   ; 1 day
[pam-generic]
banaction = %(banaction_allports)s
logpath  = %(syslog_authpriv)s
backend  = %(syslog_backend)s
[xinetd-fail]
banaction = iptables-multiport-log
logpath   = %(syslog_daemon)s
backend   = %(syslog_backend)s
maxretry  = 2
[stunnel]
logpath = /var/log/stunnel4/stunnel.log
[ejabberd-auth]
port    = 5222
logpath = /var/log/ejabberd/ejabberd.log
[counter-strike]
logpath = /opt/cstrike/logs/L[0-9]*.log
# Firewall: http://www.cstrike-planet.com/faq/6
tcpport = 27030,27031,27032,27033,27034,27035,27036,27037,27038,27039
udpport = 1200,27000,27001,27002,27003,27004,27005,27006,27007,27008,27009,27010,27011,27012,27013,27014,27015
action  = %(banaction)s[name=%(__name__)s-tcp, port="%(tcpport)s", protocol="tcp", chain="%(chain)s", actname=%(banaction)s-tcp]
           %(banaction)s[name=%(__name__)s-udp, port="%(udpport)s", protocol="udp", chain="%(chain)s", actname=%(banaction)s-udp]
[nagios]
logpath  = %(syslog_daemon)s     ; nrpe.cfg may define a different log_facility
backend  = %(syslog_backend)s
maxretry = 1
[directadmin]
logpath = /var/log/directadmin/login.log
port = 2222
[portsentry]
logpath  = /var/lib/portsentry/portsentry.history
maxretry = 1
[pass2allow-ftp]
# this pass2allow example allows FTP traffic after successful HTTP authentication
port         = ftp,ftp-data,ftps,ftps-data
# knocking_url variable must be overridden to some secret value in filter.d/apache-pass.local
filter       = apache-pass
# access log of the website with HTTP auth
logpath      = %(apache_access_log)s
blocktype    = RETURN
returntype   = DROP
bantime      = 3600
maxretry     = 1
findtime     = 1
[murmur]
port     = 64738
action   = %(banaction)s[name=%(__name__)s-tcp, port="%(port)s", protocol=tcp, chain="%(chain)s", actname=%(banaction)s-tcp]
           %(banaction)s[name=%(__name__)s-udp, port="%(port)s", protocol=udp, chain="%(chain)s", actname=%(banaction)s-udp]
logpath  = /var/log/mumble-server/mumble-server.log
[screensharingd]
logpath  = /var/log/system.log
logencoding = utf-8
[haproxy-http-auth]
logpath  = /var/log/haproxy.log' >> /etc/fail2ban/jail.local
service fail2ban restart > /dev/null 2>&1
echo -e "${cor[5]} ${txt[156]}"
 fi
fi
echo -e "${cor[1]} =================================== ${cor[0]}"
return
}

fail2ban_function
[[ -e $HOME/fail2ban ]] && rm $HOME/fail2ban
[[ -d $HOME/fail2ban-0.9.4 ]] && rm -rf $HOME/fail2ban-0.9.4
