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
  let s:bg = ["#efefef", "#E0E0E0", "#C7C7C7", "#8D8D8D"]
  let s:fg = ["#000000", "#4D4D4D", "#676767"]
  let s:red = ["#BA0000", "#F6A485", "#FACCBC"]
  let s:green = ["#00671E", "#91E586", "#B8EFB2"]
  let s:yellow = ["#9A6800", "#D2C44F", "#E3E19A"]
  let s:blue = ["#004B8A", "#8ABCF1", "#CFE5FD"]
  let s:purple = ["#690094", "#D4AFFF", "#E5CEFF"]
  let s:cyan = ["#005857", "#7FD0D4", "#C0E4E6"]
else
  let s:background = "#000000"
  let s:bg = ["#1f1f1f", "#353535", "#5E5E5E", "#8E8E8E"]
  let s:fg = ["#FFFFFF", "#CECECE", "#A3A3A3"]
  let s:red = ["#FB6800", "#9F4D2A", "#511700"]
  let s:green = ["#00C537", "#1C6E10", "#11440A"]
  let s:yellow = ["#D9B000", "#866C00", "#483800"]
  let s:blue = ["#6CB8FA", "#2546A4", "#1B2B5D"]
  let s:purple = ["#D884FF", "#6F4C98", "#4A4056"]
  let s:cyan = ["#00E0DD", "#006365", "#004648"]
endif
" }}}
" General: {{{
call s:hi("Search",       s:fg[0],    s:cyan[1],    s:bold)
hi! link Substitute IncSearch
call s:hi("ModeMsg",      s:fg[0],      s:none,       s:bold)
call s:hi("Normal",       s:fg[0],      s:background, s:none)
call s:hi("NormalFloat",  s:fg[0],      s:bg[1],      s:none)
call s:hi("Cursor",       s:background, s:fg[0],      s:none)
call s:hi("TermCursor",   s:background, s:fg[0],      s:none)
call s:hi("TermCursorNC", s:none,       s:bg[1],      s:none)
call s:hi("FoldColumn",   s:red[0],     s:none,       s:none)
call s:hi("ColorColumn",  s:none,       s:bg[0],      s:none)
call s:hi("SignColumn",   s:none,       s:none,       s:none)
call s:hi("QuickFixLine", s:none,       s:blue[2],    s:none)
call s:hi("LineNr",       s:bg[3],      s:none,       s:none)
call s:hi("CursorLineNr", s:fg[0],      s:background, s:bold)
call s:hi("CursorLine",   s:none,       s:bg[0],      s:none)
hi! link CursorColumn CursorLine
call s:hi("VertSplit",    s:bg[3],      s:background,       s:none)
hi! link FloatBorder VertSplit
call s:hi("Folded",       s:fg[0],      s:none,       s:none)
call s:hi("Todo",         s:fg[0],     s:none,     s:bold_underline)
call s:hi('Visual',       s:none,       s:blue[2],    s:none)
hi! link VisualNOS Visual

call s:hi("Error",        s:red[0],     s:none,       s:bold)
hi! link ErrorMsg Error
hi! link NvimInternalError Error
hi! link WarningMsg ErrorMsg

call s:hi('IncSearch',    s:fg[0],  s:yellow[1],  s:bold)
call s:hi('MoreMsg',      s:background, s:blue[0],    s:bold_underline)

call s:hi('WildMenu',     s:fg[0],      s:bg[2],      s:bold)
call s:hi("NonText",      s:bg[2],      s:none,       s:none)
call s:hi("EndOfBuffer",  s:bg[2],      s:none,       s:none)

call s:hi('Pmenu',        s:fg[1],      s:bg[1],      s:none)
call s:hi('PmenuSel',     s:fg[0],      s:bg[2],      s:bold)
call s:hi('PmenuSbar',    s:none,       s:background, s:none)
call s:hi('PmenuThumb',   s:none,       s:fg[0],      s:none)

call s:hi('MatchParen',   s:blue[0],    s:blue[1],    s:bold_nocombine)
if has("spell")

  if has('nvim')
    exe 'hi! SpellBad guisp='.s:red[0]
    exe 'hi! SpellCap guisp='.s:yellow[0]
    exe 'hi! SpellLocal guisp='.s:yellow[0]
    exe 'hi! SpellRare guisp='.s:yellow[0]
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
hi! link pythonSpaceError Comment
hi! link FennelSpecialForm Keyword
call s:hi("schemeIdentifier", s:fg[0], s:none, s:none)
call s:hi("schemeParentheses", s:fg[0], s:none, s:none)
call s:hi("yamlDocumentStart",                       s:fg[0],     s:none,       s:none)
call s:hi("FennelSymbol",                       s:fg[0],     s:none,       s:none)
call s:hi("vimUserFunc",                        s:fg[0],     s:none,       s:none)
hi! link FennelKeyword function
hi! link CocMarkdownLink mdLink
call s:hi('mdDefinition',                       s:none,  s:none,       s:bold)
call s:hi('mdMath',                             s:cyan[0],   s:none,       s:none)
call s:hi('htmlLink',                           s:blue[0],   s:none,       s:underline)
call s:hi('htmlbold',                           s:none, s:none,       s:bold)
call s:hi('htmlBoldItalic',                     s:none,    s:none,       s:bold_italic)
call s:hi('htmlItalic',                         s:none, s:none,       s:italic)

call s:hi('Comment',                            s:bg[3],     s:none,       s:none)
call s:hi('Conceal',                            s:bg[3],     s:none,       s:none)
call s:hi('Underlined',                         s:none,      s:none,       s:underline)

call s:hi('Directory',                          s:blue[0],   s:none,       s:bold)

call s:hi('Title',                              s:none,      s:none,       s:bold)
call s:hi('htmlH1',                             s:blue[0],   s:none,       s:bold)
call s:hi('htmlH2',                             s:purple[0], s:none,       s:bold)
call s:hi('htmlH3',                             s:red[0],    s:none,       s:bold)
call s:hi('htmlH4',                             s:yellow[0], s:none,       s:bold)
call s:hi('htmlH5',                             s:green[0],  s:none,       s:bold)
call s:hi('htmlH6',                             s:cyan[0],   s:none,       s:bold)
" hi! link mdHeaderSymbol htmlH1

call s:hi("Keyword",                            s:blue[0],   s:none,       s:none)
hi! link Structure Keyword
hi! link Label Keyword
hi! link Conditional Keyword
hi! link Repeat Keyword
hi! link Exception Keyword

call s:hi("Statement",  s:blue[0],   s:none, s:none)

call s:hi("Question",   s:purple[0], s:none, s:bold)

call s:hi("Operator",   s:fg[2],    s:none, s:none)
call s:hi("Boolean ",   s:red[0],    s:none, s:none)
hi! link SpecialKey Boolean
call s:hi("Delimiter",  s:fg[0],     s:none, s:none)

call s:hi("Identifier", s:cyan[0],   s:none, s:none)

call s:hi("String",     s:green[0],  s:none, s:none)
hi! link luaStringLongTag String

call s:hi("Type",       s:cyan[0],     s:none, s:none)
call s:hi("Function",   s:cyan[0],   s:none, s:none)

call s:hi("Constant",   s:fg[0], s:none, s:none)

call s:hi("Number",   s:yellow[0], s:none, s:none)
hi! link Character Number
hi! link Float Number

call s:hi("PreProc",      s:purple[0], s:none, s:none)
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
"   let g:terminal_color_7 = s:bg[3]
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
call s:hi('DiffDelete',                         s:red[0],    s:red[2],    s:none)
hi! link DiffRemoved DiffDelete
call s:hi('DiffAdd',                            s:green[0],  s:green[2],  s:none)
hi! link DiffAdded DiffAdd
call s:hi('DiffChange',                         s:bg[3],     s:bg[1],     s:none)
call s:hi('DiffText',                           s:purple[0], s:purple[2], s:none)
" }}}
" LSP: {{{
call s:hi("LspCodeLens",                        s:bg[2],     s:none,      s:italic)
call s:hi("LspDiagnosticsDefaultError",         s:red[0],    s:none,      s:bold)
call s:hi("LspDiagnosticsDefaultWarning",       s:yellow[0], s:none,      s:bold)
call s:hi("LspDiagnosticsDefaultHint",          s:purple[0], s:none,      s:bold)
call s:hi("LspDiagnosticsDefaultInformation",   s:cyan[0],   s:none,      s:bold)

call s:hi("LspDiagnosticsUnderlineError",       s:none,      s:none,      s:undercurl)
exe 'hi! LspDiagnosticsUnderlineError guisp='.s:red[0]
call s:hi("LspDiagnosticsUnderlineWarning",     s:none,      s:none,      s:undercurl)
exe 'hi! LspDiagnosticsUnderlineWarning guisp='.s:yellow[0]
call s:hi("LspDiagnosticsUnderlineInformation", s:none,      s:none,      s:undercurl)
exe 'hi! LspDiagnosticsUnderlineInformation guisp='.s:cyan[0]
call s:hi("LspDiagnosticsUnderlineHint",        s:none,      s:none,      s:undercurl)
exe 'hi! LspDiagnosticsUnderlineHint guisp='.s:purple[0]

call s:hi("LspReferenceText",  s:none, s:green[2], s:none)
call s:hi("LspReferenceWrite", s:none, s:green[2], s:none)
call s:hi("LspReferenceRead",  s:none, s:purple[2], s:none)

" }}}
" IndentBlankLine: {{{
call s:hi("IndentBlanklineChar",               s:bg[2], s:none, s:none)
call s:hi("IndentBlanklineSpaceChar",          s:bg[2], s:none, s:none)
call s:hi("IndentBlanklineSpaceCharBlankline", s:bg[2], s:none, s:none)
" }}}
" Findr: {{{
hi! link FindrMatch Search
hi! link FindrSelected CursorLine
call s:hi("FindrDirPartial", s:green[0], s:none, s:bold)
hi! link FindrDir Directory
" }}}
" StatusLine: {{{

call s:hi("MsgArea",            s:fg[0],     s:background,       s:none)
call s:hi("StatusLine",         s:bg[3],     s:background, s:bold)
call s:hi("StatusLineNC",       s:bg[3],     s:background, s:none)
hi! link StatusLineTermNC StatusLineNC
hi! link StatusLineTerm StatusLine
call s:hi("MsgSeparator",       s:bg[3],     s:background, s:none)
call s:hi("StatusLineInactive", s:bg[3],     s:background, s:none)

call s:hi("TablineSel",  s:fg[0], s:background, s:bold_underline)
call s:hi("Tabline",     s:fg[0], s:background, s:underline)
call s:hi("TablineFill", s:fg[0], s:background, s:underline)
exe "hi! TablineSel guisp=". s:bg[3]
exe "hi! Tabline guisp=". s:bg[3]
exe "hi! TablineFill guisp=". s:bg[3]

" }}}
" Telsecope: {{{
hi! link TelescopeBorder FloatBorder
" call s:hi("TelescopeSelection",      s:fg[0],  s:bg[0],      s:none)
hi! link TelescopeSelection CursorLine
" call s:hi("TelescopeMatching",       s:none,   s:none,       s:underline)
hi! link TelescopeMatching Search
call s:hi("TelescopeMultiSelection", s:red[0], s:red[2],     s:none)
call s:hi("TelescopeSelectionCaret", s:fg[0],  s:bg[0],      s:none)
call s:hi("TelescopePromptPrefix",   s:fg[0],  s:background, s:none)
" }}}
" Which-Key: {{{
call s:hi("WhichKeyFloat", s:none, s:background, s:none)
" }}}
" Org : {{{
call s:hi("OrgDONE",                    s:green[0], s:green[1], s:bold_nocombine)
call s:hi("OrgDONE_builtin",            s:green[0], s:green[1], s:bold_nocombine)
call s:hi("OrgAgendaScheduled_builtin", s:fg[2],    s:none,     s:none)
call s:hi("OrgAgendaScheduled",         s:fg[2],    s:none,     s:none)
hi! link OrgTODO Todo
" }}}
" Sneak: {{{
hi! link Sneak Search
" }}}
" Iron: {{{
call s:hi("IronLastSent", s:none, s:red[2], s:none)
" }}}
" Tree Sitter Context: {{{
call s:hi("TreesitterContext", s:none, s:bg[1], s:none)
" }}}
" Cmp: {{{
call s:hi("CmpItemKindDefault",      s:fg[1],    s:none, s:none)
call s:hi("CmpItemAbbrMatchDefault", s:green[0], s:none, s:none)
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
" CSV: {{{
call s:hi("CSVColumnHeaderOdd",      s:fg[0],    s:none, s:bold_underline)
call s:hi("CSVColumnHeaderEven",      s:fg[0],    s:none, s:bold_underline)
call s:hi("CSVColumnEven",      s:green[0],    s:none, s:underline)
call s:hi("CSVColumnOdd",      s:blue[0],    s:none, s:underline)
call s:hi("CSVDelimiter",      s:bg[1],    s:none, s:underline)
exe "hi! CSVColumnHeaderOdd guisp=". s:bg[1]
exe "hi! CSVColumnHeaderEven guisp=". s:bg[1]
exe "hi! CSVColumnEven guisp=". s:bg[1]
exe "hi! CSVColumnOdd guisp=". s:bg[1]
" }}}
let g:limelight_conceal_guifg = s:bg[2]
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
