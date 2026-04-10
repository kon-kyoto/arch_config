#!/bin/bash

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

echo -e "${GREEN}${BOLD}"
echo "    █████╗ ██████╗  ██████╗██╗  ██╗     ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗"
echo "    ██╔══██╗██╔══██╗██╔════╝██║  ██║     ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║"
echo "    ███████║██████╔╝██║     ███████║     ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║"
echo "    ██╔══██║██╔══██╗██║     ██╔══██║██   ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║"
echo "    ██║  ██║██║  ██║╚██████╗██║  ██║╚█████╔╝██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗"
echo "    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝"
echo -e "${WHITE}${BOLD}"
echo "    ⚡ Arch Linux installation initialized ⚡"
echo -e "${NC}"

PACKAGE_LIST="packages.txt"
BLACK_PACKAGE_LIST="pentest-packages.txt"
STRAP="strap.sh"
CONFIG=".config"

# Проверка основного файла с пакетами
if [[ ! -f "$PACKAGE_LIST" ]]; then
    echo -e "${RED}Error: $PACKAGE_LIST not found!${NC}"
    exit 1
fi

# Копирование конфигов
if [[ -d "$CONFIG" ]]; then
    mkdir -p "$HOME/.config"
    cp -r "$CONFIG"/* "$HOME/.config/" 2>/dev/null
    echo -e "${GREEN}✓ Configuration files copied to $HOME/.config/${NC}"
else
    echo -e "${YELLOW}Warning: $CONFIG not found, skipping...${NC}"
fi

# Функция для скачивания strap.sh
download_strap() {
    echo -e "${YELLOW}Downloading strap.sh from BlackArch mirrors...${NC}"
    
    # Список зеркал с strap.sh (в порядке приоритета)
    local mirrors=(
        "https://repository.su/blackarch/strap.sh"
        "https://ftp.halifax.rwth-aachen.de/blackarch/strap.sh"
        "https://blackarch.unixpeople.org/strap.sh"
        "https://www.mirrorservice.org/sites/blackarch.org/strap.sh"
        "http://mirror.yandex.ru/mirrors/blackarch/strap.sh"
        "https://mirrors.tuna.tsinghua.edu.cn/blackarch/strap.sh"
        "https://mirrors.ustc.edu.cn/blackarch/strap.sh"
        "http://mirror.0xem.ma/blackarch/strap.sh"
        "https://mirror.serverion.com/blackarch/strap.sh"
        "https://blackarch.org/strap.sh"  # Оригинал в конце
    )
    
    # Проверяем наличие инструментов для загрузки
    local downloader=""
    if command -v curl &>/dev/null; then
        downloader="curl -k -s -o"
    elif command -v wget &>/dev/null; then
        downloader="wget --no-check-certificate -q -O"
    else
        echo -e "${YELLOW}Installing curl...${NC}"
        sudo pacman -S --needed --noconfirm curl
        downloader="curl -k -s -o"
    fi
    
    # Пробуем каждое зеркало
    local mirror_url=""
    for mirror in "${mirrors[@]}"; do
        echo -ne "${BLUE}Testing: $mirror ... ${NC}"
        
        # Проверяем доступность зеркала (быстрый тест)
        if [[ "$downloader" == curl* ]]; then
            if curl -k -s --connect-timeout 5 --max-time 10 -o /dev/null -w "%{http_code}" "$mirror" | grep -q "200\|302"; then
                echo -e "${GREEN}OK${NC}"
                mirror_url="$mirror"
                break
            else
                echo -e "${RED}FAIL${NC}"
            fi
        else
            if wget --no-check-certificate --timeout=5 --tries=1 -q --spider "$mirror" 2>/dev/null; then
                echo -e "${GREEN}OK${NC}"
                mirror_url="$mirror"
                break
            else
                echo -e "${RED}FAIL${NC}"
            fi
        fi
    done
    
    # Если зеркало найдено, скачиваем
    if [[ -n "$mirror_url" ]]; then
        echo -e "${YELLOW}Downloading from: $mirror_url${NC}"
        if $downloader "$STRAP" "$mirror_url"; then
            chmod +x "$STRAP"
            echo -e "${GREEN}✓ strap.sh downloaded successfully${NC}"
            return 0
        else
            echo -e "${RED}✗ Failed to download strap.sh${NC}"
            return 1
        fi
    else
        echo -e "${RED}✗ No working mirrors found!${NC}"
        return 1
    fi
}

# Функция установки с прогресс-баром
install_with_progress() {
    local file="$1"
    local installer="$2"
    local total=$(grep -v '^$' "$file" | grep -v '^#' | wc -l)
    local current=0
    local failed=0
    
    echo -e "${GREEN}Installing $total packages...${NC}"
    
    while IFS= read -r package; do
        [[ -z "$package" || "$package" =~ ^# ]] && continue
        ((current++))
        percent=$((current * 100 / total))
        echo -ne "${BLUE}[$percent%]${NC} Installing $package... \r"
        
        if [[ "$installer" == "paru" ]]; then
            if paru -S --needed --noconfirm "$package" > /dev/null 2>&1; then
                echo -e "${GREEN}[$percent%] ✓ $package installed${NC}"
            else
                echo -e "${RED}[$percent%] ✗ Failed: $package${NC}"
                ((failed++))
            fi
        else
            if sudo pacman -S --needed --noconfirm "$package" > /dev/null 2>&1; then
                echo -e "${GREEN}[$percent%] ✓ $package installed${NC}"
            else
                echo -e "${RED}[$percent%] ✗ Failed: $package${NC}"
                ((failed++))
            fi
        fi
    done < "$file"
    
    echo -e "${YELLOW}Installation completed with $failed failures${NC}"
    return 0  # Всегда возвращаем успех, чтобы скрипт продолжался
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
install_with_progress "$PACKAGE_LIST" "paru"

# Темы
echo -e "\n${BLUE}=== Installing themes ===${NC}"
if [[ -d "CyberGRUB-2077" && -f "CyberGRUB-2077/install.sh" ]]; then
    (cd CyberGRUB-2077 && sudo bash install.sh > /dev/null 2>&1 && echo -e "${GREEN}✓ CyberGRUB installed${NC}")
else
    echo -e "${YELLOW}⚠ CyberGRUB-2077 not found, skipping${NC}"
fi

if [[ -d "SilentSDDM" && -f "SilentSDDM/install.sh" ]]; then
    (cd SilentSDDM && sudo bash install.sh > /dev/null 2>&1 && echo -e "${GREEN}✓ SDDM theme installed${NC}")
else
    echo -e "${YELLOW}⚠ SilentSDDM not found, skipping${NC}"
fi

# Pentest
read -p "Install pentest OS? [y/N]: " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo -e "\n${BLUE}=== Setting up BlackArch for pentest ===${NC}"
    
    # Скачиваем strap.sh если нет
    if [[ ! -f "$STRAP" ]]; then
        download_strap
    fi
    
    # Устанавливаем BlackArch репозиторий
    if [[ -f "$STRAP" ]] && ! grep -q "blackarch" /etc/pacman.conf 2>/dev/null; then
        echo -e "${YELLOW}Installing BlackArch repository...${NC}"
        sudo bash "$STRAP" > /dev/null 2>&1
        echo -e "${GREEN}✓ BlackArch repository installed${NC}"
        sudo pacman -Sy > /dev/null 2>&1
    fi
    
    # Устанавливаем пакеты для пентеста
    if [[ -f "$BLACK_PACKAGE_LIST" ]]; then
        echo -e "\n${BLUE}=== Installing pentest packages ===${NC}"
        install_with_progress "$BLACK_PACKAGE_LIST" "paru"
    else
        echo -e "${RED}Error: $BLACK_PACKAGE_LIST not found!${NC}"
    fi

    sudo systemctl enable --now libvirtd
    sudo usermod -aG libvirt $USER
fi

echo -e "${GREEN}${BOLD}"
echo "    ██╗  ██╗ █████╗  ██████╗██╗  ██╗    ████████╗██╗  ██╗███████╗"
echo "    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝    ╚══██╔══╝██║  ██║██╔════╝"
echo "    ███████║███████║██║     █████╔╝        ██║   ███████║█████╗  "
echo "    ██╔══██║██╔══██║██║     ██╔═██╗        ██║   ██╔══██║██╔══╝  "
echo "    ██║  ██║██║  ██║╚██████╗██║  ██╗       ██║   ██║  ██║███████╗"
echo "    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝       ╚═╝   ╚═╝  ╚═╝╚══════╝"
echo "    ██████╗ ██╗      █████╗ ███╗   ██╗███████╗████████╗"
echo "    ██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝╚══██╔══╝"
echo "    ██████╔╝██║     ███████║██╔██╗ ██║█████╗     ██║   "
echo "    ██╔═══╝ ██║     ██╔══██║██║╚██╗██║██╔══╝     ██║   "
echo "    ██║     ███████╗██║  ██║██║ ╚████║███████╗   ██║   "
echo "    ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   "
echo -e "${YELLOW}${BOLD}"
echo "    ⚡ Stay anonymous. Stay dangerous. ⚡"
echo -e "${NC}"

read -p "Do you want reboot OS now? [y/N]" choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
	reboot
fi
