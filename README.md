# 🕶️ ARCH-STRIKE – The Pentesting Environment You Didn't Know You Needed

> "Stay anonymous. Stay dangerous."

---

## ⚡ What is this?

This is not your grandpa's dotfiles.
This is ARCH-STRIKE – a fully automated, cyberpunk‑styled Arch Linux environment built for:

- 🎯 Penetration testing
- 🧩 CTF competitions (HTB, TryHackMe, PicoCTF)
- 💻 Daily driving with smooth Hyprland eye candy
- 🔥 Flexing on your friends with terminal vibes

Everything is powered by Hyprland (Wayland) + BlackArch tools + a truckload of Nerd Fonts.

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

## 🧠 Tools I actually know & work with

> *"Theory is nice, but I've touched every single one of these."*

### 🔍 Recon & Enumeration
`nmap` • `arp-scan` • `tcpdump` • `wireshark-cli` • `sherlock`

### 💥 Exploitation & Fuzzing
`metasploit` • `ffuf` • `wfuzz` • `sqlmap` • `beef` • `hydra`

### 🔐 Password attacks
`john` • `aircrack-ng` • `hydra`

### 🖥️ Web & services
`nginx` • `redis` • `fcgiwrap`

### 🧱 Virtualization & sandboxing
`qemu-full` • `virt-manager` • `libvirt` • `swtpm`

### 🐚 My daily drivers (not pentest, but essential)
`hyprland` • `kitty` • `yazi` • `btop` • `fastfetch` • `nvim`

---

## 📌 How I use them

| Tool | What I do with it |
|------|-------------------|
| `nmap` | Network discovery & OS fingerprinting |
| `metasploit` | Exploit dev & payload delivery |
| `john` / `hydra` | Password cracking & brute force |
| `sqlmap` | Automatic SQL injection |
| `ffuf` / `wfuzz` | Web fuzzing & directory busting |
| `qemu` + `virt-manager` | Isolated lab environments for malware analysis |
| `beef` | Browser exploitation hooks |

> 💡 *This list grows every week. I'm constantly adding new tools to my workflow.*

## 🧠 Tools I actually know & work with

> *"Theory is nice, but I've touched every single one of these."*

### 🔍 Recon & Enumeration
`nmap` • `arp-scan` • `tcpdump` • `wireshark-cli` • `sherlock`

### 💥 Exploitation & Fuzzing
`metasploit` • `ffuf` • `wfuzz` • `sqlmap` • `beef` • `hydra`

### 🔐 Password attacks
`john` • `aircrack-ng` • `hydra`

### 🖥️ Web & services
`nginx` • `redis` • `fcgiwrap`

### 🧱 Virtualization & sandboxing
`qemu-full` • `virt-manager` • `libvirt` • `swtpm`

### 🐚 My daily drivers (not pentest, but essential)
`hyprland` • `kitty` • `yazi` • `btop` • `fastfetch` • `nvim`

---

## 📌 How I use them

| Tool | What I do with it |
|------|-------------------|
| `nmap` | Network discovery & OS fingerprinting |
| `metasploit` | Exploit dev & payload delivery |
| `john` / `hydra` | Password cracking & brute force |
| `sqlmap` | Automatic SQL injection |
| `ffuf` / `wfuzz` | Web fuzzing & directory busting |
| `qemu` + `virt-manager` | Isolated lab environments for malware analysis |
| `beef` | Browser exploitation hooks |

> 💡 *This list grows every week. I'm constantly adding new tools to my workflow.*

## 🧠 Tools I actually know & work with

> *"Theory is nice, but I've touched every single one of these."*

### 🔍 Recon & Enumeration
`nmap` • `arp-scan` • `tcpdump` • `wireshark-cli` • `sherlock`

### 💥 Exploitation & Fuzzing
`metasploit` • `ffuf` • `wfuzz` • `sqlmap` • `beef` • `hydra`

### 🔐 Password attacks
`john` • `aircrack-ng` • `hydra`

### 🖥️ Web & services
`nginx` • `redis` • `fcgiwrap`

### 🧱 Virtualization & sandboxing
`qemu-full` • `virt-manager` • `libvirt` • `swtpm`

### 🐚 My daily drivers (not pentest, but essential)
`hyprland` • `kitty` • `yazi` • `btop` • `fastfetch` • `nvim`

---

## 📌 How I use them

| Tool | What I do with it |
|------|-------------------|
| `nmap` | Network discovery & OS fingerprinting |
| `metasploit` | Exploit dev & payload delivery |
| `john` / `hydra` | Password cracking & brute force |
| `sqlmap` | Automatic SQL injection |
| `ffuf` / `wfuzz` | Web fuzzing & directory busting |
| `qemu` + `virt-manager` | Isolated lab environments for malware analysis |
| `beef` | Browser exploitation hooks |

> 💡 *This list grows every week. I'm constantly adding new tools to my workflow.*

### 🧰 Core system + Hyprland stack
- hyprland, hyprlock, uwsm, xdg-desktop-portal-hyprland
- waybar, wofi, dunst, swww, grim, slurp, swappy
- kitty, yazi, zathura, thunar, firefox
- btop, cava, fastfetch, htop, radeontop
- brightnessctl, polkit-kde-agent, libvirt

### 🔥 Fonts (all Nerd Fonts – you monster)
- otf-* and ttf-* – JetBrains Mono, FiraCode, Hack, Meslo, Cascadia Code, Iosevka, Ubuntu, Victor Mono, and about 50 more.

### 🕵️ Pentest tools (optional – via BlackArch)
- nmap, tcpdump, wireshark-cli, arp-scan
- metasploit, ffuf, wfuzz, sherlock
- john, aircrack-ng, beef, sqlmap, hydra
- qemu-full, virt-manager, swtpm

---

## 🧠 Tools I actually know & work with

> *"Theory is nice, but I've touched every single one of these."*

### 🔍 Recon & Enumeration
`nmap` • `arp-scan` • `tcpdump` • `wireshark-cli` • `sherlock`

### 💥 Exploitation & Fuzzing
`metasploit` • `ffuf` • `wfuzz` • `sqlmap` • `beef` • `hydra`

### 🔐 Password attacks
`john` • `aircrack-ng` • `hydra`

### 🖥️ Web & services
`nginx` • `redis` • `fcgiwrap`

### 🧱 Virtualization & sandboxing
`qemu-full` • `virt-manager` • `libvirt` • `swtpm`

### 🐚 My daily drivers (not pentest, but essential)
`hyprland` • `kitty` • `yazi` • `btop` • `fastfetch` • `nvim`

---

## 📌 How I use them

| Tool | What I do with it |
|------|-------------------|
| `nmap` | Network discovery & OS fingerprinting |
| `metasploit` | Exploit dev & payload delivery |
| `john` / `hydra` | Password cracking & brute force |
| `sqlmap` | Automatic SQL injection |
| `ffuf` / `wfuzz` | Web fuzzing & directory busting |
| `qemu` + `virt-manager` | Isolated lab environments for malware analysis |
| `beef` | Browser exploitation hooks |

> 💡 *This list grows every week. I'm constantly adding new tools to my workflow.*

## 🎮 Post‑installation

1. Reboot when the script asks you.
2. Log into Hyprland (SDDM should look like SilentSDDM).
3. If you see GRUB looking like Cyberpunk 2077 – you made it.

---

## 🧠 Manual tweaks you might want

- Edit ~/.config/hypr/hyprland.conf to adjust keybinds, monitors, animations.
- Edit ~/.config/waybar/config if you want a different status bar layout.
- Your pentest tools live in BlackArch – run sudo pacman -S blackarch-<category> to get more.

---

## 🛠️ File structure

```bash
arch_config/
├── install.sh                 # Main installer
├── packages.txt               # Base + Hyprland + fonts
├── pentest-packages.txt       # BlackArch tools (optional)
├── .config/                   # Your configs (copied to ~/.config/)
├── CyberGRUB-2077/            # Optional GRUB theme
└── SilentSDDM/                # Optional SDDM theme
```
---

## ❓ FAQ

Q: Why so many fonts?
A: Because terminal emulators deserve to look like a hacker movie.

Q: Can I run this on an existing Arch install?
A: Yes, but back up your dotfiles first. The script overwrites ~/.config/.

Q: BlackArch mirror is slow / down?
A: The script tries 10+ mirrors automatically. If all fail – check your internet.

Q: I don't want pentest tools.
A: Just answer n when it asks "Install pentest OS?".

Q: I want MORE tools.
A: Edit `pentest-packages.txt` or run `sudo pacman -S blackarch-<toolname>`.

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
