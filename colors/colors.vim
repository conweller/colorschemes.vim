" Setup: {{{
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name = 'colors'
" }}}
" Functions {{{
function! s:hi(group,  fg, bg, style)
  exec "hi " . a:group . " ctermfg=" . a:fg . " ctermbg=" . a:bg . " cterm="
        \ . a:style
endfunction
" }}}
" Constants: {{{
let s:none = "NONE"
let s:bold = "BOLD"
let s:bold_reverse = "BOLD,REVERSE"
let s:undercurl = "UNDERCURL"
let s:reverse = "reverse"
let s:italic = "ITALIC"
let s:underline = "UNDERLINE"
let s:bold_underline = "BOLD,UNDERLINE"
let s:bold_italic = "BOLD,ITALIC"
let s:italic_underline = "ITALIC,UNDERLINE"
let s:bold_italic_underline = "BOLD,ITALIC,UNDERLINE"
" }}}
" Colors: {{{
let s:bg = [0, 15]
let s:fg = [7, 8]
let s:red = [1, 9]
let s:green = [2, 10]
let s:yellow = [3, 11]
let s:blue = [4, 12]
let s:purple = [5, 13]
let s:cyan = [6, 14]
" }}}
" General: {{{
call s:hi("Search", s:fg[1], s:none, s:bold_reverse)
call s:hi("ModeMsg", s:fg[1], s:none, s:bold)
call s:hi("MsgArea", s:fg[1], s:none, s:none)
call s:hi("Normal", s:fg[0], s:none, s:none)
call s:hi("NormalFloat", s:fg[0], s:bg[1], s:none)
call s:hi("Cursor", s:bg[0], s:fg[0], s:none)
hi! link TermCursor Cursor
call s:hi("TermCursorNC", s:none, s:bg[1], s:none)
call s:hi("LineNr", s:bg[1], s:none, s:none)
call s:hi("FoldColumn", s:red[1], s:none, s:none)
call s:hi("SignColumn", s:none, s:none, s:none)
call s:hi("QuickFixLine", s:bg[0], s:green[1], s:bold)
call s:hi("CursorLineNr", s:bg[1], s:none, s:none)
call s:hi("CursorLine", s:none, s:bg[0], s:none)
hi! link CursorColumn CursorLine
call s:hi("VertSplit", s:bg[1], s:none, s:none)
call s:hi('MsgSeparator', s:bg[1], s:none, s:underline)
call s:hi("Folded", s:fg[1], s:none, s:italic)
call s:hi("Error", s:bg[0], s:red[0], s:bold)
call s:hi("Todo", s:fg[0], s:none, s:bold_italic_underline)
call s:hi('Visual', s:none, s:bg[1], s:none)
hi! link VisualNOS Visual

call s:hi("ErrorMsg", s:red[0], s:none, s:bold)
hi! link WarningMsg ErrorMsg

call s:hi('IncSearch',s:blue[1], s:none, s:bold_reverse)
call s:hi('Substitute',s:red[1], s:none, s:bold_reverse)
call s:hi('MoreMsg',s:bg[0], s:blue[1], s:bold_underline)

call s:hi('WildMenu', s:bg[0], s:fg[0], s:bold)
call s:hi("NonText", s:bg[1], s:none, s:none)
call s:hi("EndOfBuffer", s:bg[0], s:none, s:none)

call s:hi('Pmenu', s:fg[0], s:bg[1], s:none)
call s:hi('PmenuSel', s:bg[0], s:green[1], s:bold)
call s:hi('PmenuSbar', s:none, s:bg[0], s:none)
call s:hi('PmenuThumb', s:none, s:green[0], s:none)

call s:hi('MatchParen', s:none, s:bg[1], s:none)
if has("spell")

  if has('nvim')
    exe 'hi! SpellBad guisp='.s:red[1]
    exe 'hi! SpellCap guisp='.s:yellow[1]
    exe 'hi! SpellLocal guisp='.s:yellow[1]
    exe 'hi! SpellRare guisp='.s:yellow[1]
  endif

  call s:hi('SpellCap', s:yellow[0], s:none, s:undercurl)
  call s:hi('SpellLocal', s:yellow[0], s:none, s:undercurl)
  call s:hi('SpellRare', s:yellow[0], s:none, s:undercurl)
  call s:hi('SpellBad', s:red[0], s:none, s:undercurl)
endif
" }}}
" Syntax: {{{
hi! link luaBraces Normal
hi! link luaTable Normal
hi! link rustCommentLineDoc Comment
hi! link pythonSpaceError Comment
call s:hi('FennelSymbol', s:fg[0], s:bg[0], s:none)
hi! link FennelSpecialForm Keyword
hi! link FennelKeyword function
call s:hi('mdOperator', s:fg[1], s:none, s:none)
call s:hi('mdTodo', s:red[0], s:none, s:bold_underline)
call s:hi('mdDone', s:green[0], s:none, s:bold_underline)
call s:hi('mdStarted', s:purple[0], s:none, s:bold_underline)
call s:hi('htmlLink', s:blue[0], s:none, s:none)
call s:hi('htmlbold', s:none, s:none, s:bold)
call s:hi('htmlBoldItalic', s:none, s:none, s:bold_italic)
call s:hi('htmlItalic', s:none, s:none, s:italic)

call s:hi('Comment', s:fg[1], s:none, s:none)
call s:hi('Conceal', s:blue[1], s:none, s:none)
call s:hi('Underlined', s:none, s:none, s:underline)

call s:hi('Directory', s:blue[0], s:none, s:bold)

call s:hi('Title', s:fg[0], s:none, s:bold)

call s:hi("Keyword", s:blue[0], s:none, s:none)
hi! link Structure Keyword
hi! link Statement Keyword
hi! link Label Keyword
hi! link Conditional Keyword
hi! link Repeat Keyword
hi! link Exception Keyword

call s:hi("Question", s:purple[1], s:none, s:bold)

call s:hi("Operator", s:red[1], s:none, s:none)
hi! link Boolean Operator
hi! link SpecialKey Operator

call s:hi("Identifier", s:cyan[0], s:none, s:none)

call s:hi("String", s:green[0], s:none, s:none)
hi! link luaStringLongTag String

call s:hi("Type", s:yellow[0], s:none, s:none)
call s:hi("Function", s:cyan[0], s:none, s:none)

call s:hi("Constant", s:cyan[1], s:none, s:none)
hi! link Character Constant

call s:hi("PreProc", s:purple[0], s:none, s:none)
hi! link Macro PreProc
hi! link Include PreProc
hi! link Define PreProc
hi! link PreCondit PreProc
hi! link Special PreProc

call s:hi("StorageClass", s:cyan[1], s:none, s:none)
hi! link Typedef StorageClass
hi! link Number StorageClass
hi! link Float StorageClass
" }}}
" Terminal: {{{
if has('nvim')
  let g:terminal_color_0 = s:bg[1][1]
  let g:terminal_color_1 = s:red[0][1]
  let g:terminal_color_2 = s:green[0][1]
  let g:terminal_color_3 = s:yellow[0][1]
  let g:terminal_color_4 = s:blue[0][1]
  let g:terminal_color_5 = s:purple[0][1]
  let g:terminal_color_6 = s:cyan[0][1]
  let g:terminal_color_7 = s:fg[0][1]
  let g:terminal_color_8 = s:fg[1][1]
  let g:terminal_color_9 = s:red[1][1]
  let g:terminal_color_10 = s:green[1][1]
  let g:terminal_color_11 = s:yellow[1][1]
  let g:terminal_color_12 = s:blue[1][1]
  let g:terminal_color_13 = s:purple[1][1]
  let g:terminal_color_14 = s:cyan[1][1]
  let g:terminal_color_15 = s:bg[1][1]
endif
" }}}
" Diffs: {{{
call s:hi('DiffDelete', s:bg[0], s:red[0], s:none)
hi! link DiffRemoved DiffDelete
call s:hi('DiffAdd', s:bg[0], s:green[0], s:none)
hi! link DiffAdded DiffAdd
call s:hi('DiffChange', s:bg[0], s:cyan[1], s:none)
call s:hi('DiffText', s:bg[0], s:yellow[1], s:none)
" }}}
" LSP: {{{
call s:hi("LspDiagnosticsError", s:red[0], s:none, s:bold)
call s:hi("LspDiagnosticsWarning", s:yellow[0], s:none, s:bold)
call s:hi("LspCodeLens", s:bg[1], s:none, s:italic_underline)
hi! link LspDiagnosticsInformation LspDiagnosticsWarning
hi! link LspDiagnosticsHint LspDiagnosticsWarning
hi! link LspReferenceText LspDiagnosticsWarning
hi! link LspReferenceRead LspDiagnosticsWarning
hi! link LspReferenceWrite LspDiagnosticsWarning

call s:hi("LspDiagnosticsErrorSign", s:red[0], s:none, s:bold)
call s:hi("LspDiagnosticsWarningSign", s:yellow[0], s:none, s:bold)
hi! link LspDiagnosticsInformationSign LspDiagnosticsWarningSign
hi! link LspDiagnosticsHintSign LspDiagnosticsWarningSign


call s:hi ('LspDiagnosticsUnderlineHint', s:none, s:none, s:underline)
hi link LspDiagnosticsUnderlineError LspDiagnosticsUnderlineHint
hi link LspDiagnosticsUnderlineWarning LspDiagnosticsUnderlineHint
hi link LspDiagnosticsUnderlineInformation LspDiagnosticsUnderlineHint

hi! link CocCodeLens NonText
hi! link CocErrorSign LspDiagnosticsError
hi! link CocWarningSign LspDiagnosticsWarning
hi! link CocInfoSign LspDiagnosticsWarning
hi! link CocHintSign LspDiagnosticsWarning

hi! link CocErrorHighlight LspDiagnosticsUnderlineError
hi! link CocWarningHighlight LspDiagnosticsUnderlineWarning
hi! link CocInfoHighlight LspDiagnosticsUnderlineWarning
hi! link CocHintHighlight LspDiagnosticsUnderlineWarning

" }}}
" Findr: {{{
call s:hi("FindrBorder", s:bg[1], s:none, s:none)
hi! link FindrMatch Search
hi! link FindrSelected CursorLine
call s:hi("FindrDirPartial", s:fg[1],s:none, s:bold)
" }}}
" StatusLine: {{{

call s:hi("StatusLine", s:fg[0], s:bg[0], s:bold)
call s:hi("StatusLineNC", s:fg[1], s:bg[0], s:none)

call s:hi("TablineSel", s:fg[0], s:bg[0], s:bold)
call s:hi("Tabline", s:fg[1], s:bg[0], s:none)
call s:hi("TablineFill", s:fg[1], s:bg[0], s:none)

" }}}
" Git Gutter: {{{
call s:hi('GitGutterAdd', s:blue[1], s:none, s:none)
call s:hi('GitGutterChange', s:bg[1], s:none, s:none)
call s:hi('GitGutterDelete', s:red[1], s:none, s:none)
call s:hi('GitGutterChangeDelete', s:red[1], s:none, s:none)
" }}}
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
