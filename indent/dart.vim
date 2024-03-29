if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal cindent
setlocal cinoptions+=j1,J1,(2s,u2s,U1,m1,+2s

setlocal indentexpr=DartIndent()

let b:undo_indent = 'setl cin< cino<'

if exists("*DartIndent")
  finish
endif

function! DartIndent()
  " Default to cindent in most cases
  let indentTo = cindent(v:lnum)

  let previousLine = getline(prevnonblank(v:lnum - 1))
  let currentLine = getline(v:lnum)

  " Don't indent after an annotation
  if previousLine =~# '^\s*@.*$'
    let indentTo = indent(v:lnum - 1)
  endif

  " Indent after opening List literal
  if previousLine =~# '\[$' && !(currentLine =~# '^\s*\]')
    let indentTo = indent(v:lnum - 1) + &shiftwidth
  endif

  return indentTo
endfunction





if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'dart') == -1

setlocal cindent
setlocal cinoptions-=(2s,u2s
setlocal cinoptions+=(1s,u1s

setlocal indentexpr=DartIndentFlutter()

if exists("*DartIndentFlutter")
  finish
endif

function! DartIndentFlutter()
  " Default to cindent in most cases
  let indentTo = cindent(v:lnum)

  let prevLnum = prevnonblank(v:lnum - 1)
  let previousLine = getline(prevLnum)
  let currentLine = getline(v:lnum)

  " Don't indent after an annotation
  if previousLine =~# '^\s*@.*$' " prevline is not @something
    let indentTo = indent(prevLnum)
  endif

  " Do not indent );
  if currentLine =~# '^\s*[)\]\}]' " curline stats with ) or ] or }
    let indentTo = indent(prevLnum) - &shiftwidth
  elseif previousLine =~# '^\s*[)\}][,;]\?$' && !(currentLine =~# '^\s*[\]\}]')
    " prevline is ) or } with or without a , or ;
    " and curline is not a ] or }
    let indentTo = indent(prevLnum)
  endif

  " Indent after opening List/parenthesis literal
  if previousLine =~# '[\[\(]$' " prevline ends with [ or (
    if !(currentLine =~# '^\s*[\])]') " curline is not ] or )
      let indentTo = indent(prevLnum) + &shiftwidth
    else
      let indentTo = indent(prevLnum)
    endif
  endif

  return indentTo
endfunction

endif
