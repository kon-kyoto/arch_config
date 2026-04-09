# ==================== ПРОКСИ ДЛЯ FISH ====================
set -g SINGBOX_BIN "/usr/bin/sing-box"
set -g SINGBOX_PID_FILE "/tmp/sing-box.pid"
set -g DEFAULT_CONFIG "$HOME/.config/VPN/config.json"
set -g DNS_SERVER "1.1.1.1"
set -gx ENABLE_DEPRECATED_TUN_ADDRESS_X "true"  # 👈 КЛЮЧЕВАЯ ПЕРЕМЕННАЯ

# Включить прокси с указанием конфига
function proxy_on
    # Определяем конфиг
    set config_path $DEFAULT_CONFIG
    
    if test (count $argv) -gt 0
        set config_path $argv[1]
        echo "📁 Используем конфиг: $config_path"
    else
        echo "📁 Используем конфиг по умолчанию"
    end
    
    # Проверяем конфиг
    if not test -f $config_path
        echo "❌ Ошибка: Конфиг не найден: $config_path"
        echo "   Доступные конфиги:"
        find ~/.config/VPN -name "*.json" 2>/dev/null
        return 1
    end
    
    # Останавливаем предыдущий
    proxy_off 2>/dev/null
    
    # Устанавливаем переменную для совместимости
    set -gx ENABLE_DEPRECATED_TUN_ADDRESS_X "true"
    echo "🔧 Установлена переменная: ENABLE_DEPRECATED_TUN_ADDRESS_X=true"
    
    # Запускаем sing-box
    echo "🚀 Запускаем sing-box..."
    sudo env ENABLE_DEPRECATED_TUN_ADDRESS_X=true $SINGBOX_BIN run -c $config_path > /tmp/sing-box.log 2>&1 &
    echo $last_pid > $SINGBOX_PID_FILE
    
    sleep 3
    
    # Настраиваем DNS
    echo "🌐 Настраиваем DNS на $DNS_SERVER..."
    echo "nameserver $DNS_SERVER" | sudo tee /etc/resolv.conf > /dev/null
    
    # Проверяем запуск
    if ps -p (cat $SINGBOX_PID_FILE) > /dev/null 2>&1
        echo "✅ Прокси запущен"
        echo "   Конфиг: "(basename $config_path)
        echo "   Переменная ENABLE_DEPRECATED_TUN_ADDRESS_X=true установлена"
        echo "   Проверка: curl ifconfig.me"
    else
        echo "❌ Ошибка запуска"
        tail -5 /tmp/sing-box.log
        return 1
    end
end

# Выключить прокси
function proxy_off
    echo "🛑 Останавливаем прокси..."
    
    # Убиваем sing-box
    if test -f $SINGBOX_PID_FILE
        sudo kill (cat $SINGBOX_PID_FILE) 2>/dev/null
        rm -f $SINGBOX_PID_FILE
    end
    
    # Убиваем все sing-box процессы
    sudo pkill -9 sing-box 2>/dev/null
    
    # Убираем переменную
    set -e ENABLE_DEPRECATED_TUN_ADDRESS_X
    echo "🔧 Переменная ENABLE_DEPRECATED_TUN_ADDRESS_X удалена"
    
    # Восстанавливаем DNS
    echo "🔙 Восстанавливаем DNS..."
    echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
    
    echo "✅ Прокси остановлен"
end

# Проверить переменные
function proxy_env
    echo "=== 🌍 ПЕРЕМЕННЫЕ ОКРУЖЕНИЯ ==="
    echo "ENABLE_DEPRECATED_TUN_ADDRESS_X = $ENABLE_DEPRECATED_TUN_ADDRESS_X"
    env | grep -i proxy
end

# Список доступных конфигов
function proxy_list
    echo "📂 Доступные конфиги:"
    set i 1
    for config in (find ~/.config/VPN -name "*.json" 2>/dev/null)
        echo "  $i) "(basename $config)
        set i (math $i + 1)
    end
    
    echo ""
    echo "🎮 КОМАНДЫ:"
    echo "  proxy_on                     # запустить с конфигом по умолчанию"
    echo "  proxy_on ~/путь/конфиг.json  # запустить с указанным конфигом"
    echo "  proxy_env                    # показать переменные окружения"
end

# Статус
function proxy_status
    echo "=== 📊 СТАТУС ПРОКСИ ==="
    
    if test -f $SINGBOX_PID_FILE
        set pid (cat $SINGBOX_PID_FILE)
        if ps -p $pid > /dev/null 2>&1
            echo "Sing-box: 🟢 ЗАПУЩЕН (PID: $pid)"
        else
            echo "Sing-box: 🔴 НЕ ЗАПУЩЕН"
        end
    else
        echo "Sing-box: 🔴 НЕ ЗАПУЩЕН"
    end
    
    echo ""
    echo "Переменные:"
    echo "  ENABLE_DEPRECATED_TUN_ADDRESS_X = $ENABLE_DEPRECATED_TUN_ADDRESS_X"
    
    echo ""
    echo "Открытые порты:"
    ss -tulpn 2>/dev/null | grep -E ':2080|:2081' || echo "  Прокси-порты не слушаются"
end

# Алиасы
alias pon='proxy_on'
alias poff='proxy_off'
alias plist='proxy_list'
alias pstat='proxy_status'
alias penv='proxy_env'
alias pon1='proxy_on ~/.config/VPN/config.json'
alias pon2='proxy_on ~/.config/VPN/config2.json 2>/dev/null || echo "Конфиг config2.json не найден"'
