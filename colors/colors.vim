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
  exec "hi " . a:group . " guifg=" . a:fg . " guibg=" . a:bg . " gui="
        \ . a:style
endfunction
" }}}
" Constants: {{{
let s:none = "NONE"
let s:nocombine = "NOCOMBINE"
let s:bold = "BOLD"
let s:bold_nocombine = "BOLD,NOCOMBINE"
let s:bold_reverse = "BOLD,REVERSE"
let s:undercurl = "UNDERCURL"
let s:reverse = "REVERSE"
let s:italic = "ITALIC"
let s:italic_reverse = "ITALIC,REVERSE"
let s:underline = "UNDERLINE"
let s:bold_underline = "BOLD,UNDERLINE"
let s:bold_italic = "BOLD,ITALIC"
let s:italic_underline = "ITALIC,UNDERLINE"
let s:bold_italic_underline = "BOLD,ITALIC,UNDERLINE"
" }}}
" Colors: {{{
let s:background = "#F8F4F0"
let s:bg = ["#F3EDE5", "#E7DFD5", "#D2C3B0", "#9C907E"]
let s:fg = ["#000000", "#544C42", "#887B6B"]
let s:red = ["#cb0000", "#F1C1B0", "#F9DBCF"]
let s:green = ["#008f1a", "#B4E5AE", "#C9EFC5"]
let s:yellow = ["#BC891D", "#E0DD73", "#EBE99F"]
let s:blue = ["#006bc7", "#BADAF8", "#DFEBF9"]
let s:purple = ["#8657a5", "#ebd9ff", "#F3E8FF"]
let s:cyan = ["#008886", "#A2D7D9", "#C0E4E6"]
" }}}
" General: {{{
call s:hi("Search", s:cyan[0], s:cyan[2], s:bold_underline)
exe "hi! Search guisp=".s:cyan[1]
hi! link Substitute IncSearch
call s:hi("ModeMsg", s:fg[2], s:none, s:bold)
call s:hi("Normal", s:fg[0], s:none, s:none)
call s:hi("NormalFloat", s:fg[0], s:background, s:none)
call s:hi("Cursor", s:background, s:fg[0], s:none)
call s:hi("TermCursor", s:background, s:fg[0], s:none)
call s:hi("TermCursorNC", s:fg[0], s:none, s:underline)
call s:hi("LineNr", s:bg[2], s:none, s:none)
call s:hi("FoldColumn", s:red[0], s:none, s:none)
call s:hi("ColorColumn", s:none, s:bg[0], s:none)
call s:hi("SignColumn", s:none, s:none, s:none)
call s:hi("QuickFixLine", s:none, s:blue[2], s:bold_underline)
exe "hi! QuickFixLine guisp=".s:blue[1]
call s:hi("CursorLineNr", s:bg[2], s:background, s:none)
call s:hi("CursorLine", s:none, s:bg[0], s:underline)
exe "hi! CursorLineNr guisp=".s:bg[1]
exe "hi! CursorLine guisp=".s:bg[1]
hi! link CursorColumn CursorLine
call s:hi("VertSplit", s:bg[2], s:background, s:none)
call s:hi("Folded", s:bg[2], s:none, s:italic)
call s:hi("Error", s:background, s:red[0], s:bold)
call s:hi("Todo", s:red[0], s:red[1], s:bold)
call s:hi('Visual', s:none, s:blue[2], s:none)
hi! link VisualNOS Visual

call s:hi("ErrorMsg", s:red[0], s:none, s:bold)
hi! link WarningMsg ErrorMsg

call s:hi('IncSearch', s:yellow[0], s:yellow[2], s:bold_underline)
exe 'hi! IncSearch guisp='.s:yellow[1]
call s:hi('MoreMsg',s:background, s:blue[0], s:bold_underline)

call s:hi('WildMenu', s:fg[0], s:bg[2], s:bold)
call s:hi("NonText", s:bg[2], s:none, s:none)
call s:hi("EndOfBuffer", s:bg[1], s:none, s:none)

call s:hi('Pmenu', s:cyan[0], s:cyan[2], s:none)
call s:hi('PmenuSel', s:cyan[0], s:cyan[1], s:bold)
call s:hi('PmenuSbar', s:none, s:none, s:none)
call s:hi('PmenuThumb', s:none, s:cyan[0], s:none)

call s:hi('MatchParen', s:blue[0], s:blue[1], s:bold)
if has("spell")

  if has('nvim')
    exe 'hi! SpellBad guisp='.s:red[0]
    exe 'hi! SpellCap guisp='.s:yellow[0]
    exe 'hi! SpellLocal guisp='.s:yellow[0]
    exe 'hi! SpellRare guisp='.s:yellow[0]
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
hi! link FennelParen Comment
hi! link FennelSpecialForm Keyword
hi! link FennelSymbol Normal
hi! link FennelKeyword function
call s:hi('mdOperator', s:fg[0], s:none, s:none)
hi! link CocMarkdownLink mdLink
call s:hi('mdDefinition', s:none, s:none, s:bold)
call s:hi('mdMath', s:cyan[0], s:none, s:none)
call s:hi('htmlLink', s:blue[0], s:none, s:none)
call s:hi('htmlbold', s:none, s:none, s:bold)
call s:hi('htmlBoldItalic', s:none, s:none, s:bold_italic)
call s:hi('htmlItalic', s:none, s:none, s:italic)

call s:hi('Comment', s:bg[3], s:none, s:none)
call s:hi('Conceal', s:fg[1], s:none, s:none)
call s:hi('Underlined', s:none, s:none, s:underline)

call s:hi('Directory', s:blue[0], s:none, s:bold)

call s:hi('Title', s:none, s:none, s:bold)
call s:hi('htmlH1', s:blue[0], s:none, s:bold)
call s:hi('htmlH2', s:purple[0], s:none, s:bold)
call s:hi('htmlH3', s:red[0], s:none, s:bold)
call s:hi('htmlH4', s:yellow[0], s:none, s:bold)
call s:hi('htmlH5', s:green[0], s:none, s:bold)
call s:hi('htmlH6', s:cyan[0], s:none, s:bold)
" hi! link mdHeaderSymbol htmlH1

call s:hi("Keyword", s:blue[0], s:none, s:none)
hi! link Structure Keyword
hi! link Label Keyword
hi! link Conditional Keyword
hi! link Repeat Keyword
hi! link Exception Keyword

call s:hi("Statement", s:blue[0], s:none, s:none)

call s:hi("Question", s:purple[0], s:none, s:bold)

call s:hi("Operator", s:red[0], s:none, s:none)
hi! link Boolean Operator
hi! link SpecialKey Operator
hi! link Delimiter Operator

call s:hi("Identifier", s:cyan[0], s:none, s:none)

call s:hi("String", s:green[0], s:none, s:none)
hi! link luaStringLongTag String

call s:hi("Type", s:fg[1], s:none, s:none)
call s:hi("Function", s:cyan[0], s:none, s:none)

call s:hi("Constant", s:yellow[0], s:none, s:none)
hi! link Character Constant
hi! link Number Constant
hi! link Float Constant

call s:hi("PreProc", s:purple[0], s:none, s:none)
hi! link Macro PreProc
hi! link Include PreProc
hi! link Define PreProc
hi! link PreCondit PreProc
hi! link Special PreProc

call s:hi("StorageClass", s:red[0], s:none, s:none)
hi! link Typedef StorageClass
" }}}
" Terminal: {{{
hi! link Terminal Normal
if has('nvim')
  let g:terminal_color_0 = s:bg[0]
  let g:terminal_color_1 = s:red[0]
  let g:terminal_color_2 = s:green[0]
  let g:terminal_color_3 = s:yellow[0]
  let g:terminal_color_4 = s:blue[0]
  let g:terminal_color_5 = s:purple[0]
  let g:terminal_color_6 = s:cyan[0]
  let g:terminal_color_7 = s:fg[0]
  let g:terminal_color_8 = s:bg[3]
  let g:terminal_color_9 = s:red[0]
  let g:terminal_color_10 = s:green[0]
  let g:terminal_color_11 = s:yellow[0]
  let g:terminal_color_12 = s:blue[0]
  let g:terminal_color_13 = s:purple[0]
  let g:terminal_color_14 = s:cyan[0]
  let g:terminal_color_15 = s:bg[2]
endif
" }}}
" Diffs: {{{
call s:hi('DiffDelete', s:red[0], s:red[2], s:none)
hi! link DiffRemoved DiffDelete
call s:hi('DiffAdd', s:green[0], s:green[2], s:none)
hi! link DiffAdded DiffAdd
call s:hi('DiffChange', s:fg[1], s:bg[0], s:none)
call s:hi('DiffText', s:purple[0], s:purple[2], s:none)
" }}}
" LSP: {{{
call s:hi("LspCodeLens", s:bg[2], s:bg[0], s:italic)
call s:hi("LspDiagnosticsDefaultError", s:red[0], s:none, s:bold)
call s:hi("LspDiagnosticsDefaultWarning", s:yellow[0], s:none, s:bold)
call s:hi("LspDiagnosticsDefaultHint", s:purple[0], s:none, s:bold)
call s:hi("LspDiagnosticsDefaultInformation", s:cyan[0], s:none, s:bold)
" }}}
" IndentBlankLine: {{{
call s:hi("IndentBlanklineChar", s:bg[2], s:none, s:none)
call s:hi("IndentBlanklineSpaceChar", s:bg[2], s:none, s:none)
call s:hi("IndentBlanklineSpaceCharBlankline", s:bg[2], s:none, s:none)
" }}}
" Findr: {{{
hi! link FindrBorder VertSplit
hi! link FindrMatch Search
hi! link FindrSelected CursorLine
call s:hi("FindrDirPartial", s:green[0], s:none, s:bold)
hi! link FindrDir Directory
" }}}
" StatusLine: {{{

call s:hi("MsgArea", s:fg[1], s:none, s:none)
call s:hi("StatusLine", s:bg[2], s:background, s:bold)
call s:hi("StatusLineNC", s:bg[2], s:background, s:none)
call s:hi("StatusLineOuter", s:fg[1], s:bg[1], s:bold)
call s:hi("StatusLineInner", s:fg[2], s:bg[1], s:none)
hi! link StatusLineTermNC StatusLineNC
hi! link StatusLineTerm StatusLine
call s:hi("MsgSeparator", s:none, s:bg[0], s:none)
call s:hi("StatusLineInactive", s:fg[2], s:bg[1], s:none)

call s:hi("StatusLineNormal",   s:fg[1],     s:bg[1], s:bold)
call s:hi("StatusLineVisual",   s:purple[0], s:bg[1], s:bold)
call s:hi("StatusLineReplace",  s:red[0],    s:bg[1], s:bold)
call s:hi("StatusLineTerminal", s:green[0],  s:bg[1], s:bold)
call s:hi("StatusLineCommand",  s:cyan[0],   s:bg[1], s:bold)
call s:hi("StatusLineInsert",   s:blue[0],   s:bg[1], s:bold)

call s:hi("TablineSel", s:fg[1], s:bg[1], s:bold)
call s:hi("Tabline", s:fg[2], s:bg[1], s:none)
call s:hi("TablineFill", s:background, s:bg[1], s:none)

" }}}
" Telsecope: {{{
call s:hi("TelescopeBorder", s:bg[2], s:none, s:none)
call s:hi("TelescopeSelection", s:none, s:blue[2], s:underline)
exe "hi! TelescopeSelection guisp=".s:blue[1]
hi! link TelescopeMatching Search
call s:hi("TelescopeMultiSelection", s:bg[3], s:bg[0], s:underline)
exe "hi! TelescopeMultiSelection guisp=".s:bg[1]
call s:hi("TelescopeSelectionCaret", s:blue[0], s:blue[2], s:bold_underline)
exe "hi! TelescopeSelectionCaret guisp=".s:blue[1]
call s:hi("TelescopePromptPrefix", s:blue[0], s:background, s:bold)
" }}}
" Which-Key: {{{
call s:hi("WhichKeyFloat", s:none, s:background, s:none)
" }}}
" Org : {{{
call s:hi("OrgDONE", s:green[0], s:green[1], s:bold)
call s:hi("OrgDONE_builtin", s:green[0], s:green[1], s:bold)
hi! link OrgTODO Todo
" }}}
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
