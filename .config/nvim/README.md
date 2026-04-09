# Neovim Configuration for C/C++ Development

## 🚀 Установленные плагины

| Плагин | Описание |
|--------|----------|
| **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** | Тема Tokyo Night с прозрачностью |
| **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** | Файловый менеджер |
| **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** | Поиск файлов и текста |
| **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** | Иконки для файлов |
| **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** | Утилиты для Lua |
| **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** | Подсветка синтаксиса |
| **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** | LSP поддержка |
| **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** | Автодополнение |
| **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** | Сниппеты |
| **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** | Отладчик |
| **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** | Интерфейс отладчика |
| **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** | Комментирование кода |
| **[debugprint.nvim](https://github.com/andrewferrier/debugprint.nvim)** | Быстрая вставка отладочной печати |

## ⌨️ Горячие клавиши

### Общие
| Клавиша | Действие |
|---------|----------|
| `<C-k>` | Выход из режима вставки |
| `<leader>s` | Сохранить файл |
| `<leader>q` | Закрыть окно |
| `<leader>e` | Открыть/закрыть файловый менеджер |
| `<leader>f` | Поиск файлов (Telescope) |

### LSP (для C/C++ файлов)
| Клавиша | Действие |
|---------|----------|
| `gd` | Перейти к определению |
| `K` | Показать документацию |
| `<leader>rn` | Переименовать символ |
| `gr` | Найти все использования |

### Отладка
| Клавиша | Действие |
|---------|----------|
| `<F5>` | Запустить/продолжить отладку |
| `<F9>` | Поставить/убрать точку останова |
| `<F10>` | Шаг с обходом (step over) |
| `<F11>` | Шаг с заходом (step into) |
| `<leader>du` | Открыть/закрыть интерфейс отладчика |

### Компиляция и запуск
| Клавиша | Действие |
|---------|----------|
| `<F6>` | Запустить make |
| `<F7>` | Скомпилировать и запустить текущий файл |

### Автодополнение
| Клавиша | Действие |
|---------|----------|
| `<C-Space>` | Ручной вызов автодополнения |
| `<Tab>` | Выбрать следующий вариант |
| `<S-Tab>` | Выбрать предыдущий вариант |
| `<CR>` | Подтвердить выбор |

### DebugPrint
| Клавиша | Действие |
|---------|----------|
| `g?p` | Вставить отладочный print |
| `g?v` | Вставить print с переменной под курсором |

## 🎨 Особенности
- Прозрачный фон
- Номера строк и относительные номера
- Поддержка C/C++ разработки
- Интеграция с LSP (clangd)
- Визуальный отладчик

## 📦 Требования
- Neovim >= 0.9.0
- Установленный clangd (`sudo pacman -S clang`)
- Установленный gdb (`sudo pacman -S gdb`)

## 🔧 Установка плагинов
При первом запуске плагины установятся автоматически через `lazy.nvim`.

---
*Конфигурация создана для комфортной разработки на C/C++*
