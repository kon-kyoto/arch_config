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
  -- 1. ТЕМА
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
  
  -- 2. ФАЙЛОВЫЙ МЕНЕДЖЕР
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  
  -- 3. ПОИСК
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  
  -- 4. ИКОНКИ
  { "nvim-tree/nvim-web-devicons", lazy = true },
  
  -- 5. УТИЛИТЫ
  { "nvim-lua/plenary.nvim", lazy = true },
  
  -- 6. TREESITTER (только установка)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

})

-- ========== НАСТРОЙКИ ПОСЛЕ ЗАГРУЗКИ ==========
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- Настройка темы
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    
    -- Настройка nvim-tree
    local ok, tree = pcall(require, "nvim-tree")
    if ok then
      tree.setup({
        view = { width = 35, side = "left" },
        renderer = { group_empty = true, highlight_git = true },
      })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    end
    
    -- Настройка telescope
    local ok2, telescope = pcall(require, "telescope")
    if ok2 then
      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = { height = 0.9, width = 0.9 },
        }
      })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    end
    
    
      -- Настройка treesitter
    local ok3, ts = pcall(require, "nvim-treesitter.configs")
    if ok3 then
      ts.setup({
        ensure_installed = { "c", "cpp", "make" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end

    -- Настройка автодополнения
    local ok4, cmp = pcall(require, "cmp")
    if ok4 then
      cmp.setup({
        snippet = {
          expand = function(args)
            local ok5, luasnip = pcall(require, "luasnip")
            if ok5 then luasnip.lsp_expand(args.body) end
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end
    
    -- Настройка отладки
    local ok6, dap = pcall(require, "dap")
    if ok6 then
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
      }
      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
        },
      }
    end
    
    -- Настройка dap-ui
    local ok7, dapui = pcall(require, "dapui")
    if ok7 then
      dapui.setup()
    end
    
    -- Настройка комментирования
    local ok8, comment = pcall(require, "Comment")
    if ok8 then
      comment.setup()
    end
  end,
})

-- ========== НАСТРОЙКИ ПРОЗРАЧНОСТИ ==========
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3b4261" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#565f89" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  end
})

-- ========== НАСТРОЙКИ LSP (НОВЫЙ API) ==========
-- Регистрируем конфигурацию clangd
vim.lsp.config.clangd = {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp" },
  root_markers = { "compile_commands.json", ".git" },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
}

-- Автоматический запуск для C/C++ файлов
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.lsp.start(vim.lsp.config.clangd)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = true })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = true })
  end,
})

vim.keymap.set("i", "<C-k>", "<Esc>")
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>")

-- Отладка

-- Сборка
-- Сборка C/C++ файлов с правильным отображением ошибок в quickfix
vim.keymap.set("n", "<leader><CR>", function()
  local filetype = vim.bo.filetype
  if filetype ~= "c" and filetype ~= "cpp" then
    print("❌ Это не C/C++ файл")
    return
  end
  
  local filename = vim.fn.expand("%:t")
  local fileroot = vim.fn.expand("%:r")
  local output = fileroot .. ".exe"
  local compiler = filetype == "cpp" and "g++" or "gcc"
  
  -- Сохраняем текущий файл перед компиляцией
  vim.cmd("write")
  
  -- Простая команда компиляции без специальных флагов формата
  local compile_cmd = string.format("clang-format -i %s && %s -Wall -Wextra -o %s %s", filename, compiler, output, filename)
  
  -- Используем makeprg для автоматического парсинга ошибок
  -- Устанавливаем формат ошибок для gcc
  vim.o.errorformat = '%f:%l:%c: %trror: %m,%f:%l:%c: %tarning: %m,%f:%l:%c: %m,%f:%l: %trror: %m,%f:%l: %tarning: %m,%f:%l: %m'
  
  local old_makeprg = vim.o.makeprg
  vim.o.makeprg = compile_cmd
  
  -- Запускаем make и автоматически заполняем quickfix
  vim.cmd("silent make!")
  vim.cmd("redraw!")
  
  -- Восстанавливаем makeprg
  vim.o.makeprg = old_makeprg
  
  -- Открываем quickfix окно
  vim.cmd("copen")
  
  -- Проверяем, есть ли ошибки
  local qflist = vim.fn.getqflist()
  if #qflist == 0 then
    vim.cmd("ccl") -- закрываем quickfix если нет ошибок
    print("✅ Компиляция успешна: " .. output)
  else
    print("❌ Найдены ошибки компиляции")
  end
end, { desc = "Скомпилировать C/C++ файл" })

print("✅ Конфигурация загружена! Установка плагинов...")

