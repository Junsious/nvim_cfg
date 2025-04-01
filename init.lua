-- Устанавливаем номер строк
vim.opt.number = true
vim.opt.relativenumber = true

-- Устанавливаем 4 пробела вместо табуляции
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Включаем поддержку мыши
vim.opt.mouse = "a"

-- Улучшаем поиск
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Включаем автозавершение команд
vim.opt.wildmenu = true

-- Включаем подсветку синтаксиса
vim.cmd('syntax on')
vim.cmd('set termguicolors')

-- Подключаем packer
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Сам packer
    use 'nvim-treesitter/nvim-treesitter' -- Улучшенная подсветка кода
    use 'nvim-tree/nvim-web-devicons' -- Иконки
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim' -- Отображение отступов
    use 'nvim-lualine/lualine.nvim' -- Красивый статусбар
    use 'nvim-telescope/telescope.nvim' -- Поиск файлов и строк
    use 'neovim/nvim-lspconfig' -- Настройки LSP (поддержка языков)
    use 'hrsh7th/nvim-cmp' -- Автодополнение
    use 'hrsh7th/cmp-nvim-lsp' -- Источник LSP для автодополнения
    use 'vim-scripts/fasm.vim' -- Поддержка синтаксиса FASM
    use 'akinsho/bufferline.nvim' -- Вкладки сверху
    use 'norcalli/nvim-colorizer.lua' -- Подсветка HEX цветов
    use 'numToStr/Comment.nvim' -- Комментирование кода
    use 'sainnhe/everforest'-- Тема оформления
end)

-- Тема --

vim.cmd[[colorscheme everforest]]
vim.o.background = "dark" 

-- Настройка LSP
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{} -- Поддержка Python
lspconfig.gopls.setup{} -- Поддержка Go
lspconfig.rust_analyzer.setup{} -- Поддержка Rust
lspconfig.bashls.setup{} -- Поддержка Bash
lspconfig.clangd.setup{} -- Поддержка C/C++
