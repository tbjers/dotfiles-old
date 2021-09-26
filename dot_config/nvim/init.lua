-- By default title is off. Needed for detecting window as neovim instance (sworkstyle)
vim.cmd 'set title'

local Plug = vim.fn['plug#']
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local map = vim.api.nvim_set_keymap

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug('cespare/vim-toml', {branch = 'main'})
Plug 'elzr/vim-json'
Plug 'gabrielelana/vim-markdown'
Plug 'sirtaj/vim-openscad'
Plug 'leafgarland/typescript-vim'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'digitaltoad/vim-pug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'

vim.call('plug#end')

-- Global settings
o.swapfile = false
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = false
o.showtabline = 2
o.showmode = false
o.smarttab = true

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
vim.g['airline_powerline_fonts'] = true
vim.g['airline_theme'] = 'gruvbox_material'

-- Theme configuration
vim.g['gruvbox_material_background'] = 'medium'
vim.g['gruvbox_material_enable_italic'] = true
vim.g['gruvbox_material_disable_italic_comment'] = true
vim.g['gruvbox_material_enable_bold'] = true

-- NERDTree Configuration
map('n', '<Leader>n', ':NERDTreeMirror<CR>:NERDTreeFocus<CR>', {noremap=true})
map('n', '<C-n>', ':NERDTree<CR>', {noremap=true})
map('n', '<C-t>', ':NERDTreeToggle<CR>', {noremap=true})
map('n', '<C-f>', ':NERDTreeFind<CR>', {noremap=true})
vim.g['NERDTreeGitStatusUseNerdFonts'] = 1 -- you should install nerdfonts by yourself. default: 0
vim.g['NERDTreeQuitOnOpen'] = 1

-- NERDTree stuff not supported by LUA, yet...
vim.cmd 'source ~/.config/nvim/NERDTree.vim'

-- Netrw configuration
vim.g['netrw_banner'] = 0
vim.g['netrw_liststyle'] = 3
vim.g['netrw_browse_split'] = 4
vim.g['netrw_altv'] = 1
vim.g['netrw_winsize'] = 25

-- Editorconfig/Fugitive
vim.g['EditorConfig_exclude_patterns'] = {'fugitive://.*', 'scp://.*'}

-- General keymappings
map('n', '<Leader>w', ':bw<CR>', {noremap=true})
map('n', '<C-^>', ':bn<CR>', {noremap=true})
map('n', '<C-s>', ':update', {noremap=true})
map('n', '<Leader>l', ':set list!<CR>', {noremap})

-- Apply Theme
vim.cmd 'colo gruvbox-material'
