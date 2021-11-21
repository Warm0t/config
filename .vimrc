" ~/.vimrc
set encoding=utf-8 fileencodings=

syntax on

set number

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set autoindent
set smartindent
set expandtab
set backspace=indent,eol,start
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
:nnoremap <leader>d :q<Cr>
:nnoremap <leader>w <C-w>
:nnoremap <leader>f :e 
:nnoremap <leader>n :vs<Cr><C-w>l:Explore<Cr>

inoremap jj <Esc>
inoremap JJ <Esc>

inoremap <F2> if ()<Cr>{<Cr>}<Esc>kk$i
inoremap <F3> for (size_t i = 0; i < lim; i++)<Cr>{<Cr>}<Esc>kk$i
inoremap <F4> while ()<Cr>{<Cr>}<Esc>kk$i

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»·,trail:·


" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
