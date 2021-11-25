-- By default title is off. Needed for detecting window as neovim instance (sworkstyle)
vim.cmd 'set title'

local Plug = vim.fn['plug#']
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local map = vim.api.nvim_set_keymap
local var = vim.api.nvim_set_var

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'chunkhang/vim-mbsync'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'gabrielelana/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'mattn/emmet-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'sirtaj/vim-openscad'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wogong/msmtp.vim'
Plug 'petobens/poet-v'
Plug('cespare/vim-toml', {branch = 'main'})
Plug('mg979/vim-visual-multi', {branch = 'master'})
Plug('ms-jpq/chadtree', {branch = 'chad', ['do'] = 'python3 -m chadtree deps'})
Plug('ms-jpq/coq_nvim', {branch = 'coq'})
Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})

vim.call('plug#end')

-- Global settings
o.swapfile = false
o.updatecount = 0
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = false
o.showtabline = 2
o.showmode = false
o.smarttab = true
o.backup = false
o.fsync = true

-- Window settings
wo.wrap = false
wo.number = true

-- Buffer settings
bo.expandtab = true
bo.cindent = true
bo.autoindent = true
bo.smartindent = true
bo.shiftwidth = 2
bo.tabstop = 2

-- Airline settings
vim.g['airline#extensions#tabline#enabled'] = true
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'
vim.g['airline#extensions#tabline#buffer_nr_show'] = true

vim.g['airline_symbols'] = {
  colnr = ':',
  linenr = ' ',
  maxlinenr = ''
}

vim.g['airline_powerline_fonts'] = false
vim.g['airline_theme'] = 'gruvbox_material'

-- Theme configuration
vim.g['gruvbox_material_background'] = 'hard'
vim.g['gruvbox_material_enable_italic'] = false
vim.g['gruvbox_material_disable_italic_comment'] = true
vim.g['gruvbox_material_enable_bold'] = true

-- Netrw configuration
vim.g['netrw_banner'] = 0
vim.g['netrw_liststyle'] = 3
vim.g['netrw_browse_split'] = 4
vim.g['netrw_altv'] = 1
vim.g['netrw_winsize'] = 25

-- Editorconfig/Fugitive
vim.g['EditorConfig_exclude_patterns'] = {'fugitive://.*', 'scp://.*'}

-- CHADTree configuration
local chadtree_settings = {
  xdg=true
}
var('chadtree_settings', chadtree_settings)

-- General keymappings
map('n', '<Leader>w', ':bw<CR>', {noremap=true})
map('n', '<C-^>', ':bn<CR>', {noremap=true})
map('n', '<C-s>', ':update', {noremap=true})
map('n', '<Leader>l', ':set list!<CR>', {noremap=true})
map('n', '<Leader>v', ':CHADopen<CR>', {noremap=true})

-- COQ settings
local coq_settings = {
  auto_start='shut-up',
  xdg=true
}
var('coq_settings', coq_settings)

-- Completion/LSP
local lsp = require 'lspconfig'
local coq = require 'coq'
lsp.pylsp.setup{}
lsp.pylsp.setup(coq.lsp_ensure_capabilities())

-- Poetry support
vim.g['poetv_executables'] = {'poetry'}

-- Apply Theme
vim.cmd 'colo gruvbox-material'
