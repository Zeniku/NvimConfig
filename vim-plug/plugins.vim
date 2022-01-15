" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Ui stuff
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'lunarvim/darkplus.nvim'
    " Lsp
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'
    "Auto complete
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    " Snippets
    Plug 'L3MON4D3/LuaSnip'
    " other Stuff
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'

    Plug 'folke/which-key.nvim'
call plug#end()

let NERDTreeShowHidden=1
