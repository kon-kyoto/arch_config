#!/bin/bash

set -e

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Проверка на root
if [[ $EUID -eq 0 ]]; then
    echo -e "${RED}Error: Don't run as root! Run as normal user.${NC}"
    exit 1
fi

echo "==========================================="
echo "   Install b/arch linux start right now"
echo "==========================================="

PACKAGE_LIST="packages.txt"
BLACK_PACKAGE_LIST="pentest-packages.txt"
STRAP="strap.sh"
CONFIG=".config"

# Проверка основного файла с пакетами
if [[ ! -f "$PACKAGE_LIST" ]]; then
    echo -e "${RED}Error: $PACKAGE_LIST not found!${NC}"
    exit 1
fi
if [[ ! -d "$CONFIG" ]]; then
	echo -e "${RED}Error: $CONFIG not found!${NC}"
	exit 1
fi

cp -r "$CONFIG"/* "$HOME/.config/"
echo -e "${GREEN}✓ Configuration files copied to $HOME/.config/${NC}"

# Функция для скачивания strap.sh
download_strap() {
    echo -e "${YELLOW}Downloading strap.sh from BlackArch...${NC}"
    
    if command -v curl &>/dev/null; then
        curl -k -o "$STRAP" https://blackarch.org/strap.sh
    elif command -v wget &>/dev/null; then
        wget --no-check-certificate -O "$STRAP" https://blackarch.org/strap.sh
    else
        echo -e "${YELLOW}Installing curl...${NC}"
        sudo pacman -S --needed --noconfirm curl
        curl -k -o "$STRAP" https://blackarch.org/strap.sh
    fi
    
    if [[ -f "$STRAP" ]]; then
        chmod +x "$STRAP"
        echo -e "${GREEN}✓ strap.sh downloaded successfully${NC}"
        return 0
    else
        echo -e "${RED}✗ Failed to download strap.sh${NC}"
        return 1
    fi
}

# Функция установки с прогресс-баром
install_with_progress() {
    local file="$1"
    local installer="$2"
    local total=$(grep -v '^$' "$file" | grep -v '^#' | wc -l)
    local current=0
    
    echo -e "${GREEN}Installing $total packages...${NC}"
    
    while IFS= read -r package; do
        [[ -z "$package" || "$package" =~ ^# ]] && continue
        ((current++))
        percent=$((current * 100 / total))
        echo -ne "${BLUE}[$percent%]${NC} Installing $package... \r"
        
        if [[ "$installer" == "paru" ]]; then
            if paru -S --needed --noconfirm --quiet "$package" 2>&1 > /dev/null; then
                echo -e "${GREEN}[$percent%] ✓ $package installed${NC}"
            else
                echo -e "${RED}[$percent%] ✗ Failed: $package${NC}"
            fi
        else
            if sudo pacman -S --needed --noconfirm --quiet "$package" 2>&1 > /dev/null; then
                echo -e "${GREEN}[$percent%] ✓ $package installed${NC}"
            else
                echo -e "${RED}[$percent%] ✗ Failed: $package${NC}"
            fi
        fi
    done < "$file"
}

# Установка AUR хелперов
if ! command -v yay &>/dev/null; then
    echo -e "${YELLOW}Installing yay...${NC}"
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git
    (cd yay && makepkg -si --noconfirm --noprogressbar) > /dev/null 2>&1
    rm -rf yay
fi

if ! command -v paru &>/dev/null; then
    echo -e "${YELLOW}Installing paru...${NC}"
    git clone https://aur.archlinux.org/paru.git
    (cd paru && makepkg -si --noconfirm --noprogressbar) > /dev/null 2>&1
    rm -rf paru
fi

# Основная установка
echo -e "\n${BLUE}=== Installing main packages ===${NC}"
install_with_progress "$PACKAGE_LIST" "pacman"

# Темы
echo -e "\n${BLUE}=== Installing themes ===${NC}"
[[ -d "CyberGRUB-2077" ]] && (cd CyberGRUB-2077 && sudo bash install.sh > /dev/null 2>&1 && echo -e "${GREEN}✓ CyberGRUB installed${NC}")
[[ -d "SilentSDDM" ]] && (cd SilentSDDM && sudo bash install.sh > /dev/null 2>&1 && echo -e "${GREEN}✓ SDDM theme installed${NC}")

# Pentest
read -p "Install pentest OS? [y/N]: " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo -e "\n${BLUE}=== Setting up BlackArch for pentest ===${NC}"
    
    # Скачиваем strap.sh если нет
    if [[ ! -f "$STRAP" ]]; then
        download_strap
    fi
    
    # Устанавливаем BlackArch репозиторий
    if ! grep -q "blackarch" /etc/pacman.conf 2>/dev/null; then
        echo -e "${YELLOW}Installing BlackArch repository...${NC}"
        sudo bash "$STRAP" > /dev/null 2>&1
        echo -e "${GREEN}✓ BlackArch repository installed${NC}"
        sudo pacman -Sy > /dev/null 2>&1
    fi
    
    # Устанавливаем пакеты для пентеста
    echo -e "\n${BLUE}=== Installing pentest packages ===${NC}"
    install_with_progress "$BLACK_PACKAGE_LIST" "pacman"
fi

echo -e "\n${GREEN}===================================${NC}"
echo -e "${GREEN}    Use it and hack the planet${NC}"
echo -e "${GREEN}===================================${NC}"
