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

set tabstop=4
set number
set background=dark
set termguicolors
colorscheme breezy
let g:syntastic_haskell_checkers = ['hlint']
let g:colorizer_auto_color = 1
let g:colorizer_colornames = 0

"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
