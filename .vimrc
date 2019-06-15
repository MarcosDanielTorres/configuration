set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'

"#Plugin 'ervandew/supertab'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Auto-Completion Plugin.
Plugin 'Valloric/YouCompleteMe'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

set ruler
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set hlsearch
highlight Comment ctermfg=green

set t_ut=
set background=dark
colorscheme hackerman

au BufNewFile,BufRead *.java call JavaAbbreviations()
function JavaAbbreviations()
  ab psvm public static void main(String[] args){
  \<CR>
  \<CR>}
endfunction


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"











