#!/data/data/com.termux/files/usr/bin/bash

# WHİSK DOSYA TRANSFER v1.0
# İmza: WHİSK

reset='\033[0m'
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
cyan='\033[1;36m'

banner() {
clear
echo -e "${cyan}
╔════════════════════════════════════════════════╗
║                                                ║
║   WW   WW  HH   HH  IIIII  SSSS   KKKKK       ║
║   WW   WW  HH   HH   III  SS      KKKKK       ║
║   WW W WW  HHHHHHH   III   SSSS   KKKKK       ║
║   WWWWWWW  HH   HH   III      SS  KKKKK       ║
║   WW   WW  HH   HH  IIIII  SSSS   KKKKK       ║
║                                                ║
║              DOSYA TRANSFER                    ║
║              İMZA: WHİSK                       ║
║                                                ║
╚════════════════════════════════════════════════╝
${reset}"
echo ""
}

menu() {
echo -e "${yellow}1) Hedef IP’ye dosya GÖNDER${reset}"
echo -e "${yellow}2) Hedef IP’den dosya AL (hedefte nc dinliyor olmalı)${reset}"
echo -e "${red}3) Çıkış${reset}"
echo ""
echo -n "Seçim: "
read secim
}

gonder() {
echo -n "Hedef IP: "
read hedef
echo -n "Gönderilecek dosya yolu: "
read dosya
if [ -f "$dosya" ]; then
    echo -n "Hedef port (varsayılan 4444): "
    read port
    port=${port:-4444}
    echo -e "${green}Dosya gönderiliyor...${reset}"
    nc -v $hedef $port < "$dosya"
    echo -e "${green}Gönderim tamamlandı.${reset}"
else
    echo -e "${red}Dosya bulunamadı!${reset}"
fi
echo ""
echo -e "${yellow}[WHİSK] Enter’a bas...${reset}"
read
}

al() {
echo -n "Hedef IP: "
read hedef
echo -n "Hedef port (varsayılan 4444): "
read port
port=${port:-4444}
echo -n "Kaydedilecek dosya adı: "
read dosya_adi
echo -e "${green}Dosya alınıyor...${reset}"
nc -v $hedef $port > "$dosya_adi"
echo -e "${green}Dosya '$dosya_adi' olarak kaydedildi.${reset}"
echo ""
echo -e "${yellow}[WHİSK] Enter’a bas...${reset}"
read
}

while true; do
banner
menu
case $secim in
1) gonder ;;
2) al ;;
3) echo -e "${red}WHİSK kapatılıyor...${reset}"; exit 0 ;;
*) echo -e "${red}Geçersiz seçim!${reset}"; sleep 1 ;;
esac
done
