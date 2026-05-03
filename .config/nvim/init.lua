-- ========== ОСНОВНЫЕ НАСТРОЙКИ ==========
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

-- ========== УСТАНОВКА LAZY.NVIM ==========
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ========== ЗАГРУЗКА ПЛАГИНОВ ==========
require("lazy").setup({
  -- ТЕМА
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
      })
      vim.cmd("colorscheme tokyonight-night")
    end
  },

  -- TREESITTER (подсветка синтаксиса)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      -- Убираем vim.defer_fn и заменяем на правильную загрузку
      local ok, treesitter = pcall(require, "nvim-treesitter.configs")
      if ok then
        treesitter.setup({
          ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "make", "bash", "python" },
          highlight = {
            enable = true,
            disable = { "txt", "text", "markdown" },
          },
          indent = {
            enable = true,
            disable = { "txt", "text" },
          },
        })
      end
    end,
  },

  -- ФАЙЛОВЫЙ МЕНЕДЖЕР
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "NvimTreeToggle",
    config = function()
      require("nvim-tree").setup({
        view = { width = 35, side = "left" },
        renderer = { group_empty = true, highlight_git = true },
      })
    end,
  },

  -- ПОИСК
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = { height = 0.9, width = 0.9 },
        }
      })
    end,
  },

  -- ИКОНКИ И УТИЛИТЫ
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
})

-- ========== НАСТРОЙКИ ПРОЗРАЧНОСТИ ==========
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3b4261" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#565f89" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

-- Прозрачность для плагинов
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    pcall(function()
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    end)
  end,
})

-- ========== ОСНОВНЫЕ ГОРЯЧИЕ КЛАВИШИ ==========
vim.keymap.set("i", "<C-k>", "<Esc>")
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Снять подсветку поиска" })
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", { desc = "Сохранить файл" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Закрыть окно" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Файловый менеджер" })
vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<CR>", { desc = "Поиск файлов" })

-- ========== НАВИГАЦИЯ ПО ТАБАМ (Alt + ...) ==========
vim.keymap.set("n", "<A-t>", ":tabnew<CR>", { desc = "Создать новый таб" })
vim.keymap.set("n", "<A-q>", ":tabprevious<CR>", { desc = "Предыдущий таб" })
vim.keymap.set("n", "<A-e>", ":tabnext<CR>", { desc = "Следующий таб" })
vim.keymap.set("n", "<A-z>", ":tabclose<CR>", { desc = "Закрыть текущий таб" })

print("BOOM!")
