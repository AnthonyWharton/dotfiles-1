execute pathogen#infect()
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

call plug#begin('~/.vim/vim-plug-plugins')
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'junegunn/vim-peekaboo'
call plug#end()

set autoindent
set shiftwidth=8
set tabstop=8
set noexpandtab
set number
set background=dark
set termguicolors
colorscheme breezy

"Syntax checking
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_tex_checkers=['chktex']

"Color code colorisation
let g:colorizer_auto_color = 1
let g:colorizer_colornames = 0
"If it's not an error we don't care
let g:syntastic_quiet_messages = {
    \ "!level":  "errors",
    \ "type":    "style"}

"Hack to allow Alt key use
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

"Nav
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-k>     :wincmd k<CR>
nmap <silent> <A-j>     :wincmd j<CR>
nmap <silent> <A-h>     :wincmd h<CR>
nmap <silent> <A-l>     :wincmd l<CR>
nmap <silent>  <A-]>    gt
nmap <silent>  <A-]>    gT
imap <silent>  <A-[>    <C-o>gT
imap <silent>  <A-[>    <C-o>gT

"Tree
"let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree  " Autostart NERDTree
autocmd VimEnter * wincmd p  " And then focus on file
autocmd BufWinEnter * NERDTreeMirror
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Clipboard from system
set clipboard=unnamedplus

"Latex 
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_continuous = 1

"Commenting
filetype plugin on
nmap <silent> <C-_>    gcc
imap <silent> <C-_>    <C-o>gcc
vmap <silent> <C-_>    gc

"Don't like wrap by default
set nowrap

"Mourse control
set mouse=a

"Mark the 80 char column
" set colorcolumn=80
let &colorcolumn=join(range(81,999),",")

"Fix for auto indentation of semicolons
set cinoptions+=L0
set cinoptions+=g0

" Search
set smartcase            " Ignore case if all lower case, else search is case sensitive
set hlsearch             " Highlight searched terms
set incsearch            " Show highlighted terms as you search

"Peekaboo for paste
let g:peekaboo_window = 'vert bel 30new'

"Don't question full reloads
:set autoread
au FocusGained,BufEnter * :silent! !

"Fix python tabbing
autocmd FileType python setlocal noexpandtab tabstop=8 shiftwidth=8

"Completion via YCM from the AUR
let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" let g:ycm_show_diagnostics_ui = 0
" Check on save
autocmd BufWritePost * YcmForceCompileAndDiagnostics


" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
