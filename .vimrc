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
