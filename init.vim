call plug#begin()

" install fzf (:Rg and :Files)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" install nvim-tree requirements
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Tabs and buffers in top bar
Plug 'pacha/vem-tabline'

" LSP
" Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Afterglow theme
Plug 'danilo-augusto/vim-afterglow'

" fugitive
Plug 'tpope/vim-fugitive'

" helm chart highlighter
Plug 'towolf/vim-helm'

" golang plugin

" Neovim golang plugin
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'

" lspinstaller (and more)
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

call plug#end()

runtime! plugin/rplugin.vim
silent! VimEnter * UpdateRemotePlugins

source $HOME/.config/nvim/nvim-tree.vim

" SETTINGS SECTION "
" General Settings "
set hidden  " switch buffers without saving
set mouse=a
set statusline+=%F\ %l\:%c
" Color Scheme
colorscheme afterglow

" turn hybrid line numbers on
set number relativenumber

" tabline stuff
nmap <leader>h <Plug>vem_move_buffer_left-
nmap <leader>l <Plug>vem_move_buffer_right-
nmap <C-P> <Plug>vem_prev_buffer-
nmap <C-N> <Plug>vem_next_buffer-

let g:vem_tabline_show_number = 'buffnr'

" use spaces instead of tab by default
set expandtab

" Proper indentation for yaml files
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab

" GoFormat with LSP
autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)

" lsp / mason setup

" LUA CONFIG SECTION "
lua <<EOF
require('go-config')
require('mason-config')
require('ruff-lsp-config')
EOF
