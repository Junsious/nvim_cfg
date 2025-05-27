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
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig'
    use 'vim-scripts/fasm.vim'
    use 'akinsho/bufferline.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs'
    use 'sainnhe/everforest'
end)

vim.o.background = "dark"
vim.cmd[[colorscheme everforest]]

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "python", "go", "rust", "bash" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('Comment').setup()
require('nvim-autopairs').setup{}

local lspconfig = require('lspconfig')

lspconfig.pyright.setup{}
lspconfig.gopls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.bashls.setup{}
lspconfig.clangd.setup{}

require'colorizer'.setup()

require('nvim-tree').setup {
  view = {
    width = 30,
    side = 'left',
    adaptive_size = false,
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = {'.git', 'node_modules', '.cache'},
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.cmd([[
  augroup NvimTreeAutoOpen
    autocmd!
    autocmd VimEnter * lua OpenNvimTreeIfDirOrEmpty()
  augroup END
]])

function OpenNvimTreeIfDirOrEmpty()
  local api = require('nvim-tree.api')
  local fn = vim.fn

  local file = fn.expand('%:p')
  local is_empty_buffer = (fn.line('$') == 1 and fn.getline(1) == '')

  if is_empty_buffer or fn.isdirectory(file) == 1 then
    api.tree.open()
  end
end

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
