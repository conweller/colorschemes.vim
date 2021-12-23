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
if &bg == 'light'
  let s:background = "#FFFFFF"
  let s:bg = ["#F2F2F2", "#EAEAEA", "#DFDFDF", "#C0C0C0"]
  let s:fg = ["#000000", "#383838", "#4D4D4D", "#535353"]
  let s:red = ["#981200", "#FF8C61", "#FFE7DE"]
  let s:green = ["#305900", "#53CD43", "#CDFFC7"]
  let s:yellow = ["#674200", "#D8C400", "#F4F3A4"]
  let s:blue = ["#003E73", "#78B3F1", "#D7EAFD"]
  let s:purple = ["#690069", "#C18BFF", "#F2E7FF"]
  let s:cyan = ["#004F4E", "#3CCDD4", "#D2F6F8"]
else
  let s:background = "#000000"
  let s:bg = ["#1A1A1A", "#242424", "#2E2E2E", "#424242"]
  let s:fg = ["#FFFFFF", "#BFBFBF", "#AAAAAA", "#A5A5A5"]
  let s:red = ["#FF8665", "#A03000", "#3A1000"]
  let s:green = ["#00C537", "#0D6700", "#041E00"]
  let s:yellow = ["#D9B000", "#6B5600", "#251D00"]
  let s:blue = ["#6CB8FA", "#284CB2", "#192443"]
  let s:purple = ["#DB8EFF", "#613792", "#250052"]
  let s:cyan = ["#00E0DD", "#005F61", "#002C2D"]
endif
" }}}
" General: {{{
call s:hi("Search", s:fg[0], s:cyan[1], s:bold)
call s:hi('IncSearch', s:fg[0], s:yellow[1], s:bold)
call s:hi('TextYankPost', s:fg[0], s:yellow[1], s:bold)
hi! link Substitute IncSearch
call s:hi("ModeMsg", s:fg[0], s:none, s:bold)
call s:hi("Normal", s:fg[0], s:background, s:none)
call s:hi("NormalFloat", s:fg[0], s:bg[1], s:none)
call s:hi("Cursor", s:background, s:fg[0], s:none)
call s:hi("TermCursor", s:background, s:fg[0], s:none)
call s:hi("TermCursorNC", s:none, s:bg[1], s:none)
call s:hi("FoldColumn", s:bg[2], s:none, s:none)
call s:hi("ColorColumn", s:none, s:bg[0], s:none)
call s:hi("SignColumn", s:none, s:none, s:none)
call s:hi("QuickFixLine", s:fg[0], s:blue[1], s:none)
call s:hi("LineNr", s:fg[3], s:none, s:none)
call s:hi("CursorLineNr", s:fg[0], s:background, s:bold)
call s:hi("CursorLine", s:none, s:bg[0], s:none)
hi! link CursorColumn CursorLine
call s:hi("VertSplit", s:bg[3], s:none, s:none)
call s:hi("FloatBorder", s:bg[3], s:background, s:none)
call s:hi("Folded", s:fg[2], s:none, s:italic)
call s:hi("Todo", s:fg[0], s:red[1], s:bold)
call s:hi('Visual', s:blue[0], s:blue[2], s:none)
hi! link VisualNOS Visual

call s:hi("Error", s:red[0], s:none, s:bold)
hi! link ErrorMsg Error
hi! link NvimInternalError Error
hi! link WarningMsg ErrorMsg

call s:hi('MoreMsg', s:background, s:blue[0], s:bold_underline)

call s:hi('WildMenu', s:fg[0], s:bg[2], s:bold)
call s:hi("NonText", s:bg[3], s:none, s:none)

call s:hi('Pmenu', s:fg[2], s:bg[1], s:none)
call s:hi('PmenuSel', s:background, s:fg[0], s:bold)
call s:hi('PmenuSbar', s:none, s:bg[3], s:none)
call s:hi('PmenuThumb', s:none, s:fg[2], s:none)

call s:hi('MatchParen', s:fg[0], s:blue[1], s:bold)

if has("spell")

  if has('nvim')
    exe 'hi! SpellBad guisp='.s:red[0]
    exe 'hi! SpellCap guisp='.s:blue[0]
    exe 'hi! SpellLocal guisp='.s:blue[0]
    exe 'hi! SpellRare guisp='.s:blue[0]
  endif

  call s:hi('SpellCap',   s:none, s:none, s:undercurl)
  call s:hi('SpellLocal', s:none, s:none, s:undercurl)
  call s:hi('SpellRare',  s:none, s:none, s:undercurl)
  call s:hi('SpellBad',   s:none, s:none, s:undercurl)
endif
" }}}
" Syntax: {{{
hi! link luaBraces Normal
hi! link luaTable Normal
hi! link rustCommentLineDoc Comment
hi! link PythonSpaceError Comment
hi! link FennelSpecialForm Keyword
call s:hi("schemeIdentifier", s:fg[0], s:none, s:none)
call s:hi("schemeParentheses", s:fg[0], s:none, s:none)
call s:hi("yamlDocumentStart", s:fg[0], s:none, s:none)
call s:hi("FennelSymbol", s:fg[0], s:none, s:none)
call s:hi("vimUserFunc", s:fg[0], s:none, s:none)
hi! link FennelKeyword function
call s:hi('mdDefinition', s:none, s:none, s:bold)
call s:hi('htmlLink', s:blue[0], s:none, s:underline)
call s:hi('htmlbold', s:none, s:none, s:bold)
call s:hi('htmlBoldItalic', s:none, s:none, s:bold_italic)
call s:hi('htmlItalic', s:none, s:none, s:italic)

call s:hi('Comment', s:fg[3], s:none, s:none)
call s:hi('Conceal', s:fg[2], s:none, s:none)
call s:hi('Underlined', s:none, s:none, s:underline)

call s:hi('Directory', s:blue[0], s:none, s:bold)

call s:hi('Title',                              s:none,      s:none,       s:bold)
call s:hi('htmlH1',                             s:blue[0],   s:none,       s:bold)
call s:hi('htmlH2',                             s:purple[0], s:none,       s:bold)
call s:hi('htmlH3',                             s:red[0],    s:none,       s:bold)
call s:hi('htmlH4',                             s:yellow[0], s:none,       s:bold)
call s:hi('htmlH5',                             s:green[0],  s:none,       s:bold)
call s:hi('htmlH6',                             s:cyan[0],   s:none,       s:bold)
" hi! link mdHeaderSymbol htmlH1

call s:hi("Keyword", s:blue[0], s:none, s:bold)
hi! link Structure Keyword
hi! link Label Keyword
hi! link Conditional Keyword
hi! link Repeat Keyword
hi! link Exception Keyword

call s:hi("Statement", s:blue[0], s:none, s:none)

call s:hi("Question", s:purple[0], s:none, s:bold)

call s:hi("Operator", s:red[0], s:none, s:none)
call s:hi("Boolean ", s:red[0], s:none, s:none)
hi! link SpecialKey Boolean
call s:hi("Delimiter", s:fg[0], s:none, s:none)

call s:hi("Identifier", s:cyan[0], s:none, s:none)

call s:hi("String", s:green[0], s:none, s:none)
hi! link luaStringLongTag String

call s:hi("Type", s:cyan[0], s:none, s:none)
call s:hi("Function", s:cyan[0], s:none, s:none)

call s:hi("Constant", s:fg[0], s:none, s:none)

call s:hi("Number", s:yellow[0], s:none, s:none)
hi! link Character Number
hi! link Float Number

call s:hi("PreProc", s:purple[0], s:none, s:none)
hi! link Macro PreProc
hi! link Include PreProc
hi! link Define PreProc
hi! link PreCondit PreProc
hi! link Special PreProc

call s:hi("StorageClass", s:red[0],    s:none, s:none)
hi! link Typedef StorageClass
" }}}
" Terminal: {{{
hi! link Terminal Normal

" if has('nvim')
"   let g:terminal_color_0 = s:fg[0]
"   let g:terminal_color_1 = s:red[0]
"   let g:terminal_color_2 = s:green[0]
"   let g:terminal_color_3 = s:yellow[0]
"   let g:terminal_color_4 = s:blue[0]
"   let g:terminal_color_5 = s:purple[0]
"   let g:terminal_color_6 = s:cyan[0]
"   let g:terminal_color_7 = s:bg[2]
"   let g:terminal_color_8 = s:fg[2]
"   let g:terminal_color_9 = s:red[1]
"   let g:terminal_color_10 = s:green[1]
"   let g:terminal_color_11 = s:yellow[1]
"   let g:terminal_color_12 = s:blue[1]
"   let g:terminal_color_13 = s:purple[1]
"   let g:terminal_color_14 = s:cyan[1]
"   let g:terminal_color_15 = s:bg[0]
" endif

" }}}
" Diffs: {{{
call s:hi('DiffDelete', s:red[0], s:red[2], s:none)
hi! link DiffRemoved DiffDelete
call s:hi('DiffAdd', s:green[0], s:green[2], s:none)
hi! link DiffAdded DiffAdd
call s:hi('DiffChange', s:fg[2], s:bg[1], s:none)
call s:hi('DiffText', s:yellow[0], s:yellow[2], s:none)
" " }}}
" " LSP: {{{
call s:hi("LspCodeLens", s:fg[2], s:none, s:italic)
call s:hi("DiagnosticError", s:red[0], s:none, s:bold)
call s:hi("DiagnosticWarn", s:yellow[0], s:none, s:bold)
call s:hi("DiagnosticInfo", s:cyan[0], s:none, s:bold)
call s:hi("DiagnosticHint", s:purple[0], s:none, s:bold)

call s:hi("DiagnosticVirtualTextError", s:red[0], s:none, s:none)
call s:hi("DiagnosticVirtualTextWarn", s:yellow[0], s:none, s:none)
call s:hi("DiagnosticVirtualTextInfo", s:cyan[0], s:none, s:none)
call s:hi("DiagnosticVirtualTextHint", s:purple[0], s:none, s:none)

call s:hi("DiagnosticUnderlineError", s:red[0], s:red[2], s:undercurl)
exe 'hi! DiagnosticUnderlineError guisp='.s:red[0]
call s:hi("DiagnosticUnderlineWarn", s:yellow[0], s:yellow[2], s:undercurl)
exe 'hi! DiagnosticUnderlineWarn guisp='.s:yellow[0]
call s:hi("DiagnosticUnderlineInfo", s:cyan[0], s:cyan[2], s:undercurl)
exe 'hi! DiagnosticUnderlineInfo guisp='.s:cyan[0]
call s:hi("DiagnosticUnderlineHint", s:purple[0], s:purple[2], s:undercurl)
exe 'hi! DiagnosticUnderlineHint guisp='.s:purple[0]

call s:hi("LspReferenceText", s:fg[0], s:green[2], s:none)
call s:hi("LspReferenceWrite", s:fg[0], s:green[2], s:none)
call s:hi("LspReferenceRead", s:fg[0], s:purple[2], s:none)

" }}}
" IndentBlankLine: {{{
hi! link IndentBlanklineChar NonText
hi! link IndentBlanklineSpaceChar NonText
hi! link IndentBlanklineSpaceCharBlankline NonText
" }}}
" Findr: {{{
hi! link FindrMatch Search
hi! link FindrBorder FloatBorder
hi! link FindrSelected CursorLine
call s:hi("FindrDirPartial", s:green[0], s:none, s:bold)
hi! link FindrDir Directory
" }}}
" StatusLine: {{{

call s:hi("MsgArea", s:fg[0], s:none, s:none)
call s:hi("StatusLine", s:fg[0], s:bg[2], s:bold)
call s:hi("StatusLineNC", s:fg[0], s:bg[2], s:none)
call s:hi("StatusLineSep", s:background, s:bg[2], s:none)
call s:hi("StatusLineOuter", s:fg[0], s:bg[2], s:bold)
call s:hi("StatusLineInner", s:fg[1], s:bg[2], s:none)
call s:hi("StatusLineInactive", s:fg[1], s:bg[2], s:none)

hi! link StatusLineTermNC StatusLineNC
hi! link StatusLineTerm StatusLine
call s:hi("MsgSeparator", s:fg[0], s:bg[2], s:none)

call s:hi("TablineSel", s:fg[0], s:bg[2], s:bold)
call s:hi("Tabline", s:fg[1], s:bg[2], s:none)
call s:hi("TablineFill", s:fg[1], s:bg[2], s:none)

" }}}
" Telsecope: {{{
hi! link TelescopeBorder FloatBorder
hi! link TelescopeSelection CursorLine
hi! link TelescopeMatching Search
call s:hi("TelescopeMultiSelection", s:red[0], s:red[2], s:none)
call s:hi("TelescopeSelectionCaret", s:blue[0], s:bg[0], s:bold)
call s:hi("TelescopePromptPrefix", s:blue[0], s:none, s:bold)
" }}}
" Which-Key: {{{
hi! link WhichKeyFloat Normal
" }}}
" Sneak: {{{
hi! link Sneak Search
" }}}
" Tree Sitter Context: {{{
call s:hi("TreesitterContext", s:none, s:bg[1], s:none)
" }}}
" Neorg: {{{
hi! link NeorgHeading1Title htmlH1
hi! link NeorgHeading1Prefix htmlH1
hi! link NeorgHeading2Title htmlH2
hi! link NeorgHeading2Prefix htmlH2
hi! link NeorgHeading3Title htmlH3
hi! link NeorgHeading3Prefix htmlH3
hi! link NeorgHeading4Title htmlH4
hi! link NeorgHeading4Prefix htmlH4
hi! link NeorgHeading5Title htmlH5
hi! link NeorgHeading5Prefix htmlH5
" }}}
" Org: {{{
call s:hi("OrgDone", s:fg[0], s:green[1], s:bold)
hi! link OrgTodo Todo
hi! link OrgHeadlineLevel1 htmlH1
hi! link OrgHeadlineLevel2 htmlH2
hi! link OrgHeadlineLevel3 htmlH3
hi! link OrgHeadlineLevel4 htmlH4
hi! link OrgHeadlineLevel5 htmlH5
" }}}
" CSV: {{{
call s:hi("CSVColumnHeaderOdd", s:fg[0], s:none, s:bold_underline)
call s:hi("CSVColumnHeaderEven", s:fg[0], s:none, s:bold_underline)
call s:hi("CSVColumnEven", s:green[0], s:none, s:underline)
call s:hi("CSVColumnOdd", s:blue[0], s:none, s:underline)
call s:hi("CSVDelimiter", s:bg[1], s:none, s:underline)
exe "hi! CSVColumnHeaderOdd guisp=". s:bg[1]
exe "hi! CSVColumnHeaderEven guisp=". s:bg[1]
exe "hi! CSVColumnEven guisp=". s:bg[1]
exe "hi! CSVColumnOdd guisp=". s:bg[1]
" }}}
" Gitsigns: {{{
call s:hi("GitSignsAdd", s:green[1], s:none, s:bold)
call s:hi("GitSignsDelete", s:red[1], s:none, s:bold)
call s:hi("GitSignsChange", s:bg[1], s:none, s:bold)
"
" }}}
" Cmp: {{{
call s:hi("CmpItemAbbrMatchDefault", s:fg[0], s:none, s:bold)
call s:hi("CmpItemKindDefault", s:fg[2], s:none, s:italic)
" }}}
" Lightspeed: {{{
call s:hi("LightspeedGreyWash", s:bg[3], s:none, s:none)
call s:hi("LightspeedLabel", s:fg[0], s:none, s:bold_underline)
call s:hi("LightspeedLabelOverlapped", s:green[0], s:none, s:underline)
call s:hi("LightspeedShortcut", s:fg[0], s:green[1], s:bold_underline)
call s:hi("LightspeedPendingOpArea", s:fg[0], s:green[1], s:none)
call s:hi("LightspeedOneCharMatch", s:fg[0], s:green[1], s:bold)
call s:hi("LightspeedUnlabeledMatch", s:fg[0], s:none, s:bold)
call s:hi("LightspeedMaskedChar", s:yellow[0], s:none, s:bold)
call s:hi("LightspeedLabelDistant", s:cyan[0], s:none, s:bold_underline)
call s:hi("LightspeedLabelDistantOverlapped", s:cyan[0], s:none, s:underline)
" }}}
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
