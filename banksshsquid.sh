#!/bin/bash

tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "VPS อัตโนมัติ รุ่น ไอ้เหี้ยไอ้สัส" ; tput sgr0
tput setaf 3 ; tput bold ; echo "" ; echo "Este script irá:" ; echo ""
echo "● การติดตั้งกำหนดค่าพร็อกซี่ปลาหมึกบนพอร์ต, 80, 3128, 8080 e 8000"; echo "เพื่อไห้อนุญาตเซิฟเวอร์ของคุณและทั้งหมด "tput sgr0
echo "● OpenSSH Openvpn pritunl Dropbear, echo พอร์ตเริ่มต้น 22 143 e 109  :tput sgr0
echo "● ติดตั้ง ชุด สคริปต์  สำหรับ ใช้งาน ในอุปกรณ์ นี้ sistema para " ; tput sgr0

echoecho ""
tputtput setaf 3 ; tput bold ; read -n 1 -s -p "กด ปุ่ม ใดๆ เพื่อ ดำเนินการต่อ ..." ; echo "" ; echo "" ; tput sgr0
tput setaf 2 ; tput bold ; echo "	Termos de Uso" ; tput sgr0
echo ""


echo "เมื่อใช้  'VPS' คุณ ยอมรับ ใน ข้อกำหนด นี้  uso:"
echo ""
echo "1. คุณสามารถ:"
echo "a. ติดตั้งและใช้ 'VPS'บน อุปกรณ์ ของคุณ ' no(s) seu(s) servidor(es)."
echo "b. สร้าง จัดการ และ ลบผู้ใช้ จำนวนไม่ จำกัด ใน    ชุด สคริป นี้  ."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "กดปุ่ม เพื่อ ดำเนิน การต่อ qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
echo "2. คุณสามารถ:"
echo "a. Editar, modificar, compartilhar ou redistribuir (gratuitamente ou comercialmente)"
echo "esse conjunto de scripts sem autorização do desenvolvedor."
echo "b. Modificar ou editar o conjunto de scripts para fazer você parecer o desenvolvedor dos scripts."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "กดปุ่มใดก็ได้เพื่อดำเนินการต่อ..." ; echo "" ; echo "" ; tput sgr0
IP=$(wget -qO- ipv4.icanhazip.com)
read -p "Para continuar confirme o IP deste servidor: " -e -i $IP ipdovps
if [ -z "$ipdovps" ]
then
echo ""
tput setaf 7 ; tput setab 1 ; tput bold ; echo "" ; echo "" ; echo " Você não digitou o IP deste servidor. Tente novamente. " ; echo "" ; echo "" ; tput sgr0
	exit 1
fi
if [ -f "/root/usuarios.db" ]
then
tput setaf 6 ; tput bold ;	echo ""
	echo "Uma base de dados de usuários ('usuarios.db') foi encontrada!"
	echo "Deseja mantê-la (preservando o limite de conexões simultâneas dos usuários)"
	echo "ou criar uma nova base de dados?"
	tput setaf 6 ; tput bold ;	echo ""
	echo "[1] รักษาฐานข้อมูลปัจจุบัน"
	echo "[2] สร้างฐานข้อมูลใหม่"
	echo "" ; tput sgr0
	read -p "Opção?: " -e -i 1 optiondb
else
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
echo ""
read -p "Deseja ativar a compressão SSH dropbear (pode aumentar o consumo de RAM)? [s/n]) " -e -i n sshcompression
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Aguarde a configuração automática" ; echo "" ; tput sgr0
sleep 3
apt-get update -y
apt-get upgrade -y
echo ""
fi
           if [ -d "/default/dropbear/" ] install dropbear 
	   cd
apt-get -y install dropbear
           sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
           sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=109"/g' /etc/default/dropbear
           sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS=" -p 110 -p 109"/g' /etc/default/dropbear
           echo "/bin/false" >> /etc/shells
           echo "/usr/sbin/nologin" >> /etc/shells
	   if
	   if [-f "/etc/init.d/dropbear"]
	   then
           service dropbear eload > /dev/null
           /etc/init.d/dropbear restart > /dev/null
fi
rm /bin/criarusuario /bin/expcleaner /bin/sshlimiter /bin/addhost /bin/listar /bin/sshmonitor /bin/ajuda > /dev/null
rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh > /dev/null
apt-get install squid3 bc screen nano unzip dos2unix wget -y
killall apache2
apt-get purge apache2 -y
if [ -f "/usr/sbin/ufw" ] ; then
	ufw allow 143/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8000/tcp ; ufw allow 8080/tcp
fi
if [ -d "/etc/squid3/" ]
then	
        wget https://.githubusercontent.com/Panuwatbank/sshd/master/squiduser1 -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://raw.githubusercontent.com/Panuwatbank/sshd/master/squiduser -O /tmp/sqd3
        cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid3/squid.conf
	wget https://raw.githubusercontent.com/Panuwatbank/wgt-bank/master/payload -O /etc/squid3/payload
	wget https://raw.githubusercontent.com/Panuwatbank/user-bank/master/squid2.txt -O /tmp/sqd3
	wget https://raw.githubusercontent.com/Panuwatbank/wgt-bank/master/payload -O /etc/squid3/payload
	echo " " >> /etc/squid3/payload
	grep -v "^Port 143" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 143" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	wget https://raw.githubusercontent.com/dhtm15/script/master/alterarsenha -O /bin/alterarsenha
        chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/dhtm15/script/master/criarusuario -O /bin/criarusuario
        chmod +x /bin/criarusuario
        wget https://raw.githubusercontent.com/dhtm15/script/master/mudardata -O /bin/mudardataa
        chmod +x /bin/mudardata
        wget https://raw.githubusercontent.com/dhtm15/script/master/remover -O /bin/remover
        chmod +x /bin/remover
        wget https://raw.githubusercontent.com/dhtm15/script/master/ajuda -O /bin/ajuda
        chmod +x /bin/ajuda
        wget https://raw.githubusercontent.com/dhtm15/script/master/statusvpn -O /bin/statusvpn
        chmod +x /bin/statusvpn
	
       if [-f "/etc/init.d/squid3" ]
	then
		service squid3 reload > /dev/null
	else
		/etc/init.d/squid3 reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
if [ -d "/etc/squid/" ]
then
	wget https://.githubusercontent.com/Panuwatbank/sshd/master/squiduser1 -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://raw.githubusercontent.com/Panuwatbank/sshd/master/squiduser -O /tmp/sqd3
        cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid/squid.conf
	wget https://raw.githubusercontent.com/Panuwatbank/wgt-bank/master/payload -O /etc/squid3/payload
	wget https://raw.githubusercontent.com/Panuwatbank/user-bank/master/squid2.txt -O /tmp/sqd3
	wget https://raw.githubusercontent.com/Panuwatbank/wgt-bank/master/payload -O /etc/squid/payload
	echo " " >> /etc/squid/payload
	grep -v "^Port 143" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 143" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	wget https://raw.githubusercontent.com/dhtm15/script/master/alterarsenha -O /bin/alterarsenha
        chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/dhtm15/script/master/criarusuario -O /bin/criarusuario
        chmod +x /bin/criarusuario
        wget https://raw.githubusercontent.com/dhtm15/script/master/mudardata -O /bin/mudardataa
        chmod +x /bin/mudardata
        wget https://raw.githubusercontent.com/dhtm15/script/master/remover -O /bin/remover
        chmod +x /bin/remover
        wget https://raw.githubusercontent.com/dhtm15/script/master/ajuda -O /bin/ajuda
        chmod +x /bin/ajuda
        wget https://raw.githubusercontent.com/dhtm15/script/master/statusvpn -O /bin/statusvpn
        chmod +x /bin/statusvpn
	if [ ! -f "/etc/init.d/squid" ]
	then
		service squid reload > /dev/null
	else
		/etc/init.d/squid reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo "พร็อกซี่ ปลาหมึก ติดตั้ง บน พอร์ต : 80, 3128, 8080 e 8000" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "OpenSSH 22 143 dropbear ใช้งาน บน พอร์ต  109 " ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "คำสั่งใช้งาน หากต้องการดูคำสั่ง: ajuda"; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "อ่านเอกสาร เพื่อหลีกเลี่ยง ข้อสงสัย และปัญหา! "; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "สคริปต์ เพิ่มชื่อผู้ใช้งาน:criarusuario" ; tput sgr0
echo ""
if [[ "$optiondb" = '2' ]]; then
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
if [[ "$sshcompression" = 's' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
	echo "Compression yes" >> /etc/ssh/sshd_config
fi
if [[ "$sshcompression" = 'n' ]]; then
	rep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
fi
exit1
