clear
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " \e[1;97m             CREATE TRIALL SSH OVPN ACCOUNT       \e[0m"
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
LOGIN=Trial-SSH`</dev/urandom tr -dc 0-9 | head -c3`
PASSWD=1Jam
EXPIRED=1
useradd -e `date -d "$EXPIRED days" +"%H"` -s /bin/false -M $LOGIN
exp="$(chage -l $LOGIN | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$PASSWD\n$PASSWD\n"|passwd $LOGIN &> /dev/null

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${LOGIN}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${LOGIN}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${LOGIN}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${LOGIN} " >>/etc/ssh/.ssh.db

cat > /var/www/html/ssh-$LOGIN.txt <<-END
_______________________________________________________
           Thank You For Using Our Services
                 SSH OVPN Account 
        Autoscript Lite By Xlord
_____________________script v.2_________________________
      System Request:Debian 9+/Ubuntu 18.04+/20+
      Author: XlordHost
      Dscription: SSH Menu Management
      email: gapunyaemail@gmail.com
      telegram: https://t.me/xlordvpn
      installer script :
_______________________________________________________
              Format SSH OVPN Account
_______________________________________________________

Username         : $LOGIN
Password         : $PASSWD
Expired          : $exp
__________________________________
IP               : $IP
Host             : $domain
Host Slowdns     : ${NS}
Pub Key          : ${PUB}
Location         : $CITY
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH WS      : 80
Port SSH SSL WS  : 443
Port SSL/TLS     : 443
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 443, 1194
Port OVPN UDP    : 2200
Proxy Squid 1    : 3128
Proxy Squid 2    : 8000
Proxy Squid 3    : 8080
BadVPN UDP       : 7100, 7300, 7300
__________________________________
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
__________________________________
OpenVPN WS SSL : http://$domain:81/ws-ssl.ovpn
OpenVPN SSL : http://$domain:81/ssl.ovpn
OpenVPN TCP : http://$domain:81/tcp.ovpn
OpenVPN UDP : http://$domain:81/udp.ovpn
__________________________________

END
TEXT="
<code>───────────────────────────</code>
<code>      SSH OVPN Account     </code>
<code>───────────────────────────</code>
<code>Username         : $LOGIN</code>
<code>Password         : $PASSWD</code>
<code>Expired          : $exp</code>
<code>───────────────────────────</code>
<code>IP               : $IP</code>
<code>Host             : $domain</code>
<code>Host Slowdns     : ${NS}</code>
<code>Pub Key          : ${PUB}</code>
<code>Location         : $CITY</code>
<code>Port OpenSSH     : 443, 80, 22</code>
<code>Port Dropbear    : 443, 109</code>
<code>Port Dropbear WS : 443, 109</code>
<code>Port DNS         : 443, 53, 22</code> 
<code>Port SSH WS      : 80 </code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 443</code>
<code>Port OVPN WS SSL : 443</code>
<code>Port OVPN SSL    : 443</code>
<code>Port OVPN TCP    : 443, 1194</code>
<code>Port OVPN UDP    : 2200</code>
<code>Proxy Squid      : 3128</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>───────────────────────────</code>
<code>Payload WSS      : </code><code>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────────────</code>
<code>OpenVPN WS SSL   : </code>http://$domain:81/ws-ssl.ovpn
<code>OpenVPN SSL      : </code>http://$domain:81/ssl.ovpn
<code>OpenVPN TCP      : </code>http://$domain:81/tcp.ovpn
<code>OpenVPN UDP      : </code>http://$domain:81/udp.ovpn
<code>───────────────────────────</code>
<code>Save Link Account: </code>http://$domain:81/ssh-$LOGIN.txt
<code>───────────────────────────</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL
clear
echo -e "\e[33m———————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m       XLORD TUNNELING            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $LOGIN" | tee -a /etc/log-create-user.log
echo -e "Password    : $PASSWD" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m           INFORMASI SERVER      \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "IP          : $IP" | tee -a /etc/log-create-user.log
echo -e "Domain        : $domain" | tee -a /etc/log-create-user.log
echo -e "Nameserver  : $sldomain" | tee -a /etc/log-create-user.log
echo -e "PubKey      : $slkey" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenSSH     : 22" | tee -a /etc/log-create-user.log
echo -e "SSH-WS      : 80" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS  : 443" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     : 447 , 777" | tee -a /etc/log-create-user.log
echo -e "SlowDNS     : 53,5300,443" 
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "SSH-80      : $domain:80@$LOGIN:$PASSWD"
echo -e "SSH-443     : $domain:443@$LOGIN:$PASSWD"
echo -e "SSH-UDP     : 1-65535" | tee -a /etc/log-create-user.log
echo -e "SETING-UDP  : $domain:1-65535@$LOGIN:$PASSWD"
#echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
#echo -e "OpenVPN Config : http://$IP:81/" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On     : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload WSS" | tee -a /etc/log-create-user.log
echo -e "
GET wss://$domain [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "Payload WS" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "\e[33m————————————————————————————————\033[0m" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
