" Setup: {{{
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name = "yellow"
" }}}
" Functions {{{
function! s:hi(group,  fg, bg, style)
  exec "hi " . a:group . " gui=" . a:style[1]  . " guifg=" . a:fg[1] . " guibg="
        \ . a:bg[1] . " ctermfg=" . a:fg[0] . " ctermbg=" . a:bg[0] . " cterm="
        \ . a:style[0]
endfunction
" }}}
" Constants: {{{
let s:none = ["NONE", "NONE"]
let s:bold = ["BOLD", "BOLD"]
let s:undercurl = ["UNDERCURL", "UNDERCURL"]
let s:reverse = ["reverse", "reverse"]
let s:italic = ["ITALIC", "ITALIC"]
let s:underline = ["UNDERLINE", "UNDERLINE"]
let s:bold_underline = ["BOLD,UNDERLINE", "BOLD,UNDERLINE"]
let s:bold_italic = ["BOLD,ITALIC", "BOLD,ITALIC"]
let s:italic_underline = ["ITALIC,UNDERLINE", "ITALIC,UNDERLINE"]
let s:bold_italic_underline = ["BOLD,ITALIC,UNDERLINE", "BOLD,ITALIC,UNDERLINE"]
" }}}
" Colors: {{{
let s:bg = [
      \ [ '231', '#EEEBDA'],
      \ [ '255', '#E9E3C7'],
      \ [ '254', '#DDD6B6'],
      \ [ '253', '#D5CFB0'],
      \ [ '251', '#C6BF9E'],
      \ ]
let s:fg = [
      \ [ '16',  '#292305'],
      \ [ '241', '#423f2e'],
      \ [ '244', '#55513b'],
      \ [ '245', '#756f51'],
      \ [ '248', '#9c946c'],
      \ ]
let s:red = [
      \ ['124', '#af0000'],
      \ ['160', '#d70000'],
      \ ]
let s:green = [
      \ ['29', '#00875f'],
      \ ['36', '#00af87'],
      \ ]
let s:yellow = [
      \ ['136', '#af8700'],
      \ ['142', '#afaf00'],
      \ ]
let s:blue = [
      \ ['25', '#005faf'],
      \ ['68', '#5f87d7'],
      \ ]
let s:purple = [
      \ ['54', '#5f0087'],
      \ ['91', '#8700af'],
      \ ]
let s:cyan = [
      \ ['31', '#0087af'],
      \ ['30', '#008787'],
      \ ]
" }}}
" General: {{{
call s:hi("Search", s:none, s:bg[3], s:none)
call s:hi("ModeMsg", s:fg[0], s:none, s:bold)
call s:hi("Normal", s:fg[0], s:bg[0], s:none)
call s:hi("NormalFloat", s:fg[0], s:bg[2], s:none)
call s:hi("Cursor", s:bg[0], s:fg[0], s:none)
hi! link TermCursor Cursor
call s:hi("TermCursorNC", s:none, s:bg[1], s:none)
call s:hi("LineNr", s:bg[4], s:none, s:none)
call s:hi("FoldColumn", s:red[1], s:none, s:none)
call s:hi("SignColumn", s:none, s:none, s:none)
call s:hi("QuickFixLine", s:bg[0], s:green[1], s:bold)
call s:hi("CursorLineNr", s:bg[4], s:bg[0], s:none)
call s:hi("CursorLine", s:none, s:bg[1], s:none)
hi! link CursorColumn CursorLine
call s:hi("VertSplit", s:bg[3], s:none, s:none)
call s:hi('MsgSeparator', s:bg[3], s:none, s:underline)
call s:hi("Folded", s:fg[4], s:bg[1], s:none)
call s:hi("Error", s:bg[0], s:red[0], s:bold)
call s:hi("Todo", s:fg[0], s:none, s:bold_italic_underline)
call s:hi('Visual', s:bg[0], s:blue[1], s:none)
hi! link VisualNOS Visual

call s:hi("ErrorMsg", s:red[0], s:none, s:bold)
hi! link WarningMsg ErrorMsg

call s:hi('IncSearch',s:bg[0], s:green[1], s:bold_underline)
call s:hi('Substitute',s:bg[0], s:red[1], s:bold_underline)
call s:hi('MoreMsg',s:bg[0], s:blue[1], s:bold_underline)

call s:hi('WildMenu', s:bg[0], s:fg[0], s:bold)
call s:hi("NonText", s:bg[4], s:none, s:none)
call s:hi("EndOfBuffer", s:bg[2], s:none, s:none)

call s:hi('Pmenu', s:fg[0], s:bg[2], s:none)
call s:hi('PmenuSel', s:bg[0], s:fg[0], s:bold)
call s:hi('PmenuSbar', s:none, s:bg[4], s:none)
call s:hi('PmenuThumb', s:none, s:fg[1], s:none)

call s:hi('MatchParen', s:none, s:bg[3], s:none)
if has("spell")

  if has('nvim')
    exe 'hi! SpellBad guisp='.s:red[0][1]
    exe 'hi! SpellCap guisp='.s:yellow[0][1]
    exe 'hi! SpellLocal guisp='.s:yellow[0][1]
    exe 'hi! SpellRare guisp='.s:yellow[0][1]
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
call s:hi('mdGridBar', s:fg[4], s:none, s:none)
call s:hi('htmlLink', s:blue[0], s:none, s:none)
call s:hi('htmlbold', s:none, s:none, s:bold)
call s:hi('htmlBoldItalic', s:none, s:none, s:bold_italic)
call s:hi('htmlItalic', s:none, s:none, s:italic)

call s:hi('Comment', s:fg[4], s:none, s:italic)
call s:hi('Conceal', s:blue[1], s:none, s:none)
call s:hi('Underlined', s:none, s:none, s:underline)

call s:hi('Directory', s:blue[0], s:none, s:bold)

call s:hi('Title', s:fg[0], s:none, s:bold)

call s:hi("Keyword", s:fg[0], s:none, s:bold)
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

call s:hi("Identifier", s:red[0], s:none, s:none)

call s:hi("String", s:green[0], s:none, s:none)
hi! link luaStringLongTag String



call s:hi("Type", s:blue[0], s:none, s:none)
hi! link Function Type

call s:hi("Constant", s:cyan[0], s:none, s:none)
hi! link Character Constant

call s:hi("PreProc", s:blue[0], s:none, s:none)
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
  let g:terminal_color_8 = s:fg[4][1]
  let g:terminal_color_9 = s:red[1][1]
  let g:terminal_color_10 = s:green[1][1]
  let g:terminal_color_11 = s:yellow[1][1]
  let g:terminal_color_12 = s:blue[1][1]
  let g:terminal_color_13 = s:purple[1][1]
  let g:terminal_color_14 = s:cyan[1][1]
  let g:terminal_color_15 = s:bg[3][1]
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
hi! link LspDiagnosticsInformation LspDiagnosticsWarning
hi! link LspDiagnosticsHint LspDiagnosticsWarning
hi! link LspReferenceText LspDiagnosticsWarning
hi! link LspReferenceRead LspDiagnosticsWarning
hi! link LspReferenceWrite LspDiagnosticsWarning

call s:hi("LspDiagnosticsErrorSign", s:red[0], s:none, s:bold)
call s:hi("LspDiagnosticsWarningSign", s:yellow[0], s:none, s:bold)
hi! link LspDiagnosticsInformationSign LspDiagnosticsWarningSign
hi! link LspDiagnosticsHintSign LspDiagnosticsWarningSign


exe 'hi! LspDiagnosticsUnderlineError guisp='
      \.s:red[0][1]
      \.' gui=undercurl cterm=undercurl'
exe 'hi! LspDiagnosticsUnderlineWarning guisp='
      \.s:yellow[0][1]
      \.' gui=undercurl cterm=undercurl'
exe 'hi! LspDiagnosticsUnderlineInformation guisp='
      \.s:yellow[0][1]
      \.' gui=undercurl cterm=undercurl'
exe 'hi! LspDiagnosticsUnderlineHint guisp='
      \.s:yellow[0][1]
      \.' gui=undercurl cterm=undercurl'

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
call s:hi("FindrBorder", s:bg[3], s:none, s:none)
hi! link FindrMatch Search
hi! link FindrSelected CursorLine
call s:hi("FindrDirPartial", s:fg[2],s:none, s:bold)
" }}}
" StatusLine: {{{

call s:hi("StatusLine", s:bg[3], s:bg[0], s:bold_underline)
call s:hi("StatusLineNC", s:bg[3], s:bg[0], s:underline)
call s:hi("TablineSel", s:fg[0], s:bg[0], s:bold_underline)
call s:hi("Tabline", s:fg[4], s:bg[0], s:underline)
call s:hi("TablineFill", s:fg[4], s:bg[0], s:underline)
exe 'hi! TablineSel guisp='.s:bg[3][1]
exe 'hi! Tabline guisp='.s:bg[3][1]
exe 'hi! TablineFill guisp='.s:bg[3][1]

" }}}
" LimeLight: {{{
let g:limelight_conceal_guifg = s:fg[4][1]
let g:limelight_conceal_ctermfg = s:fg[4][0]
" }}}
" Sneak: {{{
call s:hi("Sneak", s:fg[0], s:none, s:bold_underline)
" }}}
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
