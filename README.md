# 🕷️ ARCH-STRIKE – The Pentesting Environment You Didn't Know You Needed

> "Stay anonymous. Stay dangerous."

---

## ⚡ What is this?

This is not your grandpa's dotfiles.
This is ARCH-STRIKE – a fully automated, cyberpunk‑styled Arch Linux environment built for:

- 🎯 Penetration testing
- 🧩 CTF competitions (HTB, TryHackMe, PicoCTF)
- 💻 Daily driving with smooth Hyprland eye candy
- 🔥 Flexing on your friends with terminal vibes

Everything is powered by Hyprland (Wayland) + BlackArch tools + carefully selected Nerd Fonts.

---

## 🚀 One‑shot installation (the only way)

```bash
git clone https://github.com/kon-kyoto/arch_config.git
cd arch_config
chmod +x install.sh
./install.sh
```

What it does:
- ✅ Installs yay + paru (AUR helpers)
- ✅ Installs every package from packages.txt (Hyprland, Waybar, kitty, fonts, dev tools, etc.)
- ✅ Copies your .config folder into ~/.config/
- ✅ Optionally installs CyberGRUB‑2077 and SilentSDDM themes
- ✅ Optionally adds BlackArch repo and installs pentest-packages.txt (nmap, metasploit, john, beef, sqlmap, etc.)
- ✅ Enables libvirtd for your VM needs

> ⚠️ DO NOT RUN AS ROOT – the script will refuse to run. Run as a normal user with sudo privileges.

---

## 📦 Package overview

### 🧰 Core system + Hyprland stack
- hyprland, hyprlock, uwsm, xdg-desktop-portal-hyprland
- waybar, wofi, dunst, swww, grim, slurp, swappy
- kitty, yazi, zathura, thunar, firefox
- btop, cava, fastfetch, htop, radeontop
- brightnessctl, polkit-kde-agent, libvirt

### 🔥 Fonts (carefully curated, not a monster anymore)
| Font | Purpose |
|------|---------|
| `ttf-jetbrains-mono-nerd` | Main daily driver (great ligatures) |
| `ttf-iosevka-nerd` | Styling for hyprlock / waybar / kitty |
| `otf-dseg7-classic` | Digital clock font in hyprlock |
| `ttf-ubuntu-nerd` | Fallback font |

> 📦 **Before:** ~70 fonts / ~500 MB  
> 📦 **After:** 4 fonts / ~30 MB  
> Nothing breaks – system fallback handles everything else.

### 🕵️ Pentest tools (optional – via BlackArch)
- nmap, tcpdump, wireshark-cli, arp-scan
- metasploit, ffuf, wfuzz, sherlock
- john, aircrack-ng, beef, sqlmap, hydra
- qemu-full, virt-manager, swtpm

---

## 🧩 Waybar Features

| Module | Icon | Action on click |
|--------|------|-----------------|
| Power Profile | 󰾆 / 󰾅 / 󰓅 | Toggle power saving/balanced/performance |
| Bluetooth | 󰂯 / 󰂲 | Shows connection status |
| Theme Switcher | 🎨 | Change wallpaper (random/next/list) |
| Clipboard | 📋 | Open cliphist menu |

---

## 🎨 Wofi Styling

| File | Purpose |
|------|---------|
| `style.css` | Main Tokyo Night themed menu |
| `powermenu.css` | Power options (reboot/shutdown/logout) |
| `gruvbox.css` | Alternative Gruvbox theme |

---

## 🔧 Neovim Configuration

### Key Features
- Tokyo Night theme with transparency
- LSP support (clangd for C/C++)
- DAP debugging (gdb integration)
- Telescope for fuzzy finding
- NvimTree file manager

### Hotkeys
| Key | Action |
|-----|--------|
| `<leader> + e` | Toggle file manager |
| `<leader> + p` | Find files |
| `Alt + t` | New tab |
| `Alt + q/e` | Previous/next tab |
| `Alt + z` | Close tab |
| `gd` | Go to definition |
| `F5` | Start debugging |

> 💡 `<leader>` = spacebar

---

## 🐱 Kitty Terminal

### Features
- Tokyo Night Storm color scheme
- 0.9 background opacity with blur
- Iosevka Nerd Font (size 11)
- Powerline-style tabs
- Wayland native

### Hotkeys
| Key | Action |
|-----|--------|
| `Ctrl + Shift + C/V` | Copy/Paste |
| `Ctrl + Shift + T` | New tab |
| `Ctrl + Tab` | Next tab |
| `Ctrl + Shift + U/I` | Opacity +/- |
| `Ctrl + Plus/Minus` | Font size |

---

## 🖥️ Hyprland

### Keybind Quick Reference
| Key | Action |
|-----|--------|
| `SUPER + Q` | Terminal (Kitty) |
| `SUPER + E` | File manager (Thunar) |
| `SUPER + B` | Browser (Firefox) |
| `SUPER + R` | App launcher (Wofi) |
| `SUPER + G` | Lock screen |
| `SUPER + H/L/K/J` | Move focus |
| `SUPER + [1-9,0]` | Switch workspace |
| `SUPER + SHIFT + R` | Reload Hyprland |
| `PRINT` | Region screenshot |

### Keyboard Layout
- Layouts: `us, ru`
- Toggle: `Alt + Shift`
- Layout indicator in waybar and hyprlock

---

## 🎯 Tools I actually know & work with

> *"Theory is nice, but I've touched every single one of these."*

### 🔍 Recon & Enumeration
`nmap` • `arp-scan` • `tcpdump` • `wireshark-cli` • `sherlock`

### 💥 Exploitation & Fuzzing
`metasploit` • `ffuf` • `wfuzz` • `sqlmap` • `beef` • `hydra`

### 🔐 Password attacks
`john` • `aircrack-ng` • `hydra`

### 🕸️ Web & services
`nginx` • `redis` • `fcgiwrap`

### 🧱 Virtualization & sandboxing
`qemu-full` • `virt-manager` • `libvirt` • `swtpm`

### 🐚 My daily drivers (not pentest, but essential)
`hyprland` • `kitty` • `yazi` • `btop` • `fastfetch` • `nvim`

---

## 📂 File structure

```bash
arch_config/
├── install.sh                 # Main installer
├── packages.txt               # Base + Hyprland + fonts (optimized)
├── pentest-packages.txt       # BlackArch tools (optional)
├── .config/                   # Your configs (copied to ~/.config/)
│   ├── hypr/                  # Hyprland & hyprlock configs
│   ├── waybar/                # Status bar + scripts
│   ├── kitty/                 # Terminal config
│   ├── nvim/                  # Neovim config
│   ├── wofi/                  # Launcher styles
│   └── ...
├── CyberGRUB-2077/            # Optional GRUB theme
└── SilentSDDM/                # Optional SDDM theme
```

---

## 🎮 Post‑installation

1. Reboot when the script asks you.
2. Log into Hyprland (SDDM should look like SilentSDDM).
3. If you see GRUB looking like Cyberpunk 2077 – you made it.

---

## 🔧 Manual tweaks you might want

- Edit `~/.config/hypr/hyprland.conf` to adjust keybinds, monitors, animations.
- Edit `~/.config/waybar/config` if you want a different status bar layout.
- Edit `~/.config/kitty/kitty.conf` to change font size or opacity.
- Your pentest tools live in BlackArch – run `sudo pacman -S blackarch-<category>` to get more.

---

## ❓ FAQ

**Q: Why so few fonts now?**
A: Previously there were 70+ fonts (~500 MB). Now only 4 essential fonts (~30 MB). Nothing breaks – system fallback handles everything, and installation is much faster.

**Q: Can I run this on an existing Arch install?**
A: Yes, but back up your dotfiles first. The script overwrites `~/.config/`.

**Q: BlackArch mirror is slow / down?**
A: The script tries 10+ mirrors automatically. If all fail – check your internet.

**Q: I don't want pentest tools.**
A: Just answer `n` when it asks "Install pentest OS?".

**Q: I want MORE tools.**
A: Edit `pentest-packages.txt` or run `sudo pacman -S blackarch-<toolname>`.

**Q: Alt+ shortcuts don't work in Neovim?**
A: Make sure your terminal passes Alt keys. Kitty works out of the box.

---

## 🧪 Tested on

- Arch Linux (fresh minimal install, 2025+)
- x86_64 only (sorry ARM… for now)

---

## 📜 License

Do what you want. Just don't blame me if you pwn your own box.

---

## 👾 Final words

Keep breaking things. Responsibly.

— Your friendly neighborhood Arch enjoyer 🐉
