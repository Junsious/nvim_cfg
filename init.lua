vim.opt.number = true
vim.opt.relativenumber = true


vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.opt.mouse = "a"


vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.opt.wildmenu = true


vim.cmd('syntax on')
vim.cmd('set termguicolors')
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter' 
    use 'nvim-lualine/lualine.nvim' 
    use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig' 
end)
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{} 
lspconfig.gopls.setup{} 
lspconfig.rust_analyzer.setup{} 
lspconfig.clangd.setup{} 
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true }) 
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true }) 
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<CR>', { noremap = true }) 

