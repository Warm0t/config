" ~/.vimrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

packadd termdebug

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=
syntax on

set number

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set cc=80

let mapleader = "\<Space>"
:nnoremap <Space> <nop>
:nnoremap <leader>v :vs<Cr>
:nnoremap <leader>h :sp<Cr>
:nnoremap <leader>t :Termdebug debug<Cr>
:nnoremap <leader>m :!make
:nnoremap <leader>s :wa<Cr>

inoremap <F2> if ()<Cr>{<Cr>}<Esc>kk$i
inoremap <F3> for (size_t i = 0; i < lim; i++)<Cr>{<Cr>}<Esc>kk$i
inoremap <F4> while ()<Cr>{<Cr>}<Esc>kk$i

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»·,trail:·,eol:£


" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
