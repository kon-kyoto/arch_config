# 🐱 Kitty Terminal — Configuration Reference

## 🎨 Color Scheme (Tokyo Night Storm)

| Type | Color |
|------|-------|
| Foreground | `#d5d6db` |
| Background | `#1a1b26` |
| Selection FG | `#1a1b26` |
| Selection BG | `#c0caf5` |
| Cursor | `#c0caf5` |
| Active Border | `#7aa2f7` |
| Inactive Border | `#3b4261` |

### Terminal Colors (16-color palette)

| Color | Normal | Bright |
|-------|--------|--------|
| Black | `#1a1b26` | `#3b4261` |
| Red | `#f7768e` | `#ff7b93` |
| Green | `#9ece6a` | `#a6d777` |
| Yellow | `#e0af68` | `#e9b877` |
| Blue | `#7aa2f7` | `#85adff` |
| Magenta | `#bb9af7` | `#c5a5ff` |
| Cyan | `#7dcfff` | `#87d9ff` |
| White | `#d5d6db` | `#ffffff` |

---

## ✨ Appearance & Transparency

| Setting | Value |
|---------|-------|
| Background opacity | `0.9` |
| Background blur | `5` |
| Background tint | `0.5` |
| Dim opacity (inactive) | `0.4` |
| Inactive text alpha | `0.8` |
| Selection alpha | `0.7` |
| Tab bar alpha | `0.9` |

---

## 🔤 Fonts

| Setting | Value |
|---------|-------|
| Font family | `Iosevka Nerd Font` |
| Font size | `11` |
| Ligatures | enabled |
| Line height | `100%` |
| Column width | `100%` |

### Font Features Enabled
`+cv01 +cv02 +cv05 +cv06 +cv09 +cv14 +cv16 +cv18 +cv19 +cv20 +cv21 +cv22 +cv24 +cv25 +cv26 +cv27 +cv28 +cv29 +cv30 +cv31 +cv32 +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08 +zero`

---

## 🪟 Window Settings

| Setting | Value |
|---------|-------|
| Window decorations | `titlebar-only` |
| Padding | `10` |
| Initial size | `1200×700` |
| Placement | center |
| Remember size | yes |
| Confirm close | no |

---

## 📑 Tab Bar (Powerline Style)

| Setting | Value |
|---------|-------|
| Style | `powerline` (round) |
| Position | top |
| Margin height | `0.4` |

### Tab Colors

| Element | Foreground | Background |
|---------|------------|------------|
| Active tab | `#1a1b26` | `#7aa2f7` |
| Inactive tab | `#a9b1d6` | `#3b4261` |
| Tab bar | – | `#1a1b26` |

---

## 🖱️ Cursor

| Setting | Value |
|---------|-------|
| Shape | `beam` |
| Beam thickness | `2.0` |
| Blink interval | `0.5s` |
| Stop blinking after | `15.0s` |
| Color | `#c0caf5` |
| Text color | `#1a1b26` |

---

## ⌨️ Kitty Hotkeys

### Font Size
| Shortcut | Action |
|----------|--------|
| `Ctrl + Plus` | Increase font size (+0.5) |
| `Ctrl + Minus` | Decrease font size (-0.5) |
| `Ctrl + 0` | Reset to 13.5 |

### Clipboard
| Shortcut | Action |
|----------|--------|
| `Ctrl + Shift + C` | Copy to clipboard |
| `Ctrl + Shift + V` | Paste from clipboard |

### Window & Tab Management
| Shortcut | Action |
|----------|--------|
| `Ctrl + Shift + Q` | Close window |
| `Ctrl + Shift + T` | New tab |
| `Ctrl + Shift + Enter` | New window |
| `Ctrl + Tab` | Next tab |
| `Ctrl + Shift + Tab` | Previous tab |

### Scrolling
| Shortcut | Action |
|----------|--------|
| `Ctrl + Shift + Up` | Scroll line up |
| `Ctrl + Shift + Down` | Scroll line down |

### Opacity Control
| Shortcut | Action |
|----------|--------|
| `Ctrl + Shift + U` | Increase opacity (+0.05) |
| `Ctrl + Shift + I` | Decrease opacity (-0.05) |
| `Ctrl + Shift + O` | Reset opacity to 0.9 |

### Other
| Shortcut | Action |
|----------|--------|
| `Ctrl + Shift + R` | Reload config |

---

## ⚙️ Performance Settings

| Setting | Value |
|---------|-------|
| Repaint delay | `8–10ms` |
| Input delay | `2–3ms` |
| Sync to monitor | yes |
| Scrollback lines | `25000` |
| Wheel scroll multiplier | `6.0` |

---

## 🖱️ Mouse & URL Handling

| Setting | Value |
|---------|-------|
| Hide cursor after | `2.0s` |
| URL color | `#7aa2f7` |
| URL style | `double` (curly in transparency.conf) |
| Detect URLs | yes |
| Copy on select | clipboard |
| Focus follows mouse | no |

---

## 🐧 Wayland/Hyprland Settings

| Setting | Value |
|---------|-------|
| Display server | `wayland` |
| Titlebar color | `#1a1b26` |

---

## 📁 Configuration Files

| Path | Purpose |
|------|---------|
| `~/.config/kitty/kitty.conf` | Main configuration |
| `~/.config/kitty/colors.conf` | Color scheme |
| `~/.config/kitty/transparency.conf` | Transparency & visual effects |

---

## 🔧 Quick Tips

- **Increase contrast**: Red colors are saturated for better visibility
- **Dimmed inactive windows**: `dim_opacity 0.4` helps focus on active terminal
- **Smooth font resizing**: Uses `+0.5` increments instead of default
- **Nerd Font icons**: Symbol map included for icon fonts
