# 🖥️ Hyprland — Quick Reference

## 🚀 Autostart Programs

| Program | Purpose |
|---------|---------|
| `waybar` | Top status bar |
| `awww-daemon` | Wallpaper animation daemon |

> 📌 Set via `exec-once` in `hyprland.conf`

---

## ⌨️ Hotkeys

| Combo | Action |
|-------|--------|
| `SUPER + Q` | Open terminal (Kitty) |
| `SUPER + C` | Close active window |
| `SUPER + E` | Open file manager (Thunar) |
| `SUPER + B` | Open browser (Firefox) |
| `SUPER + V` | Toggle floating window |
| `SUPER + R` | Open app launcher (Wofi) |
| `SUPER + P` | Pseudo-tiling (Dwindle) |
| `SUPER + U` | Toggle split |
| `SUPER + G` | Lock screen (hyprlock) |
| `SUPER + S` | Toggle special workspace (scratchpad) |
| `SUPER + SHIFT + S` | Move window to scratchpad |
| `SUPER + H/L/K/J` | Move focus (left/right/up/down) |
| `SUPER + [1-9,0]` | Switch to workspace 1–10 |
| `SUPER + SHIFT + [1-9,0]` | Move window to workspace |
| `SUPER + SHIFT + R` | Reload Hyprland |
| `SUPER + SHIFT + E` | Exit Hyprland |
| `SUPER + LMB` | Move window |
| `SUPER + RMB` | Resize window |
| `PRINT` | Region screenshot (hyprshot) |

### 🔊 Media Keys

| Key | Action |
|-----|--------|
| `XF86AudioRaiseVolume` | Volume +5% |
| `XF86AudioLowerVolume` | Volume –5% |
| `XF86AudioMute` | Mute/unmute audio |
| `XF86AudioMicMute` | Mute/unmute mic |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86AudioPlay/Pause` | Play/Pause |
| `F4` | Brightness –5% |
| `F5` | Brightness +5% |

---

## 🧩 Workspaces

- **Regular**: `1` – `10`
- **Special (scratchpad)**: `magic` (`SUPER + S`)

---

## 🎨 Appearance

| Setting | Value |
|---------|-------|
| Gaps | `in: 5`, `out: 20` |
| Rounding | `10` |
| Active border | gradient `#33ccff → #00ff99` |
| Inactive border | `#595959` |
| Shadows | enabled |
| Blur | enabled (size=3, passes=1) |
| Animations | enabled |

---

## ⌨️ Keyboard Layout

- **Layouts**: `us, ru`
- **Toggle**: `Alt + Shift` (both sides)
- **Monitoring**: `keyboard-monitor.sh` updates `/tmp/keyboard_layout` and sends `RTMIN+8` signal to Waybar

> In `hyprlock.conf`, `$LAYOUT` displays the current layout

---

## 🔒 Screen Lock (hyprlock)

| Element | Description |
|---------|-------------|
| Background | `~/.config/wallpapers/lain.png` + blur |
| Greeting | "Тебе тут не рады..." (You're not welcome here) |
| Clock | DSEG7 Classic font, size 100 |
| Password field | With error indication |
| Layout | Displayed at bottom (`$LAYOUT`) |

---

## 📁 Important Files

| Path | Purpose |
|------|---------|
| `~/.config/hypr/hyprland.conf` | Main Hyprland config |
| `~/.config/hypr/hyprlock.conf` | Lock screen config |
| `~/.config/hypr/scripts/keyboard-monitor.sh` | Layout monitoring script |
| `/tmp/keyboard_layout` | Current layout cache |
| `~/.config/waybar/scripts/keyboard-layout.sh` | Layout retrieval script |

