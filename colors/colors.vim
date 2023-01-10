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
let s:none = "none"
let s:nocombine = "nocombine"
let s:bold = "bold"
let s:bold_nocombine = "bold,nocombine"
let s:strikethrough = "strikethrough"
let s:bold_underline_nocombine = "bold,underline,nocombine"
let s:bold_reverse = "bold,reverse"
let s:undercurl = "undercurl"
let s:undercurl_nocombine = "undercurl,nocombine"
let s:reverse = "reverse"
let s:italic = "italic"
let s:italic_reverse = "italic,reverse"
let s:underline = "underline"
let s:underline_nocombine = "underline,nocombine"
let s:italic_underline_nocombine = "italic,underline,nocombine"
let s:bold_underline = "bold,underline"
let s:bold_underline_strikethrough = "bold,underline,strikethrough"
let s:italic_underline_strikethrough = "italic,underline,strikethrough"
let s:underline_strikethrough = "underline,strikethrough"
let s:bold_italic = "bold,italic"
let s:bold_italic_nocombine = "bold,italic,nocombine"
let s:italic_nocombine = "italic,nocombine"
let s:italic_underline = "italic,underline"
let s:italic_underline_nocombine = "italic,underline,nocombine"
let s:bold_italic_underline = "bold,italic,underline"
" }}}
" Colors: {{{
if &bg == 'light'
  let  s:background  =  "#FFFFFF"
  let  s:bg          =  ["#F5F5F5", "#EDEDED",  "#E6E6E6",   "#CCCCCC"]
  let  s:fg          =  ["#000000",  "#383838",  "#4A4A4A",  "#525252",  "#6E6E6E", "#A6A6A6"]
  let  s:red         =  ["#A51000",  "#EF1500",  "#FF9781",  "#FFB2A7", "#FFE5E5"]
  let  s:altred      =  ["#9E0046"]
  let  s:green       =  ["#006101",  "#539A00",  "#87E37A",  "#9CF991", "#D8EED6"]
  let  s:yellow      =  ["#725200",  "#DA9500",  "#F8B500",  "#FFDC7C",  "#FFF4D8"]
  let  s:blue        =  ["#2B2BCF",  "#6464FF",  "#ABABFF",  "#C1C1FF", "#D9EBFF"]
  let  s:altblue     =  ["#235B8B"]
  let  s:purple      =  ["#840099",  "#C808C8",  "#C899FF",  "#DABCFF", "#EEE8F8"]
  let  s:altpurple   =  ["#3D0092"]
  let  s:cyan        =  ["#005D50",  "#009F88",  "#8CD9D0",  "#9EEFE6", "#CDF3EE"]
  let  s:orange      =  ["#963100", "#DB7400", "#FF8600", "#E2B17B", "#F4E9D5"]
else
  let  s:background  =  "#151515"
  let  s:bg          =  ["#202020",  "#2E2E2E",  "#3E3E3E",  "#575757"]
  let  s:fg          =  ["#FFFFFF",  "#BFBFBF",  "#AAAAAA",  "#A5A5A5",  "#848484", "#5E5E5E"]
  let  s:red         =  ["#FA8282",  "#FF6F48",  "#A03000",  "#721F00", "#501600"]
  let  s:altred      =  ["#FF89A0"]
  let  s:green       =  ["#40D169",  "#00AF32",  "#0D6700",  "#0C4D01", "#083501"]
  let  s:yellow      =  ["#FFD063",  "#F5C600",  "#695500",  "#524000",  "#2C2200"]
  let  s:blue        =  ["#8EABFF",  "#3A61FA",  "#2842B2",  "#2A3570", "#2C2F49"]
  let  s:altblue     =  ["#61B5F6"]
  let  s:purple      =  ["#EB7FFF",  "#A951D2",  "#613792",  "#3E008B", "#322345"]
  let  s:altpurple   =  ["#C19BFF"]
  let  s:cyan        =  ["#1FCCCA",  "#00C3C0",  "#005F61",  "#00494A", "#002F30"]
  let  s:orange      =  ["#FFA53F", "#DF7600", "#764315", "#5C4938", "#342C25"]
endif
" }}}
" General: {{{
call s:hi("Search", s:fg[0], s:bg[3], s:bold_nocombine)
call s:hi('IncSearch', s:fg[0], s:blue[2], s:bold_underline)
call s:hi('TextYankPost', s:fg[0], s:orange[2], s:none)
hi! link Substitute Search
call s:hi("ModeMsg", s:fg[0], s:bg[0], s:nocombine)
call s:hi("Normal", s:fg[0], s:background, s:none)
call s:hi("NormalFloat", s:fg[0], s:background, s:none)
call s:hi("Cursor", s:background, s:fg[0], s:nocombine)
call s:hi("TermCursor", s:background, s:fg[0], s:none)
call s:hi("TermCursorNC", s:none, s:bg[3], s:none)
call s:hi("FoldColumn", s:fg[5], s:none, s:none)
call s:hi("ColorColumn", s:none, s:bg[0], s:none)
call s:hi("SignColumn", s:none, s:none, s:none)
call s:hi("QuickFixLine", s:none, s:bg[1], s:none)
call s:hi("LineNr", s:fg[4], s:none, s:none)
call s:hi("CursorLineNr", s:blue[0], s:none, s:bold)
call s:hi("CursorLine", s:none, s:bg[0], s:none)
hi! link CursorColumn CursorLine
call s:hi("WinSeparator", s:fg[5], s:background, s:none)
call s:hi("Folded", s:none, s:bg[1], s:none)

call s:hi("Todo", s:fg[0], s:red[2],s:bold_nocombine)
call s:hi('Visual', s:none, s:blue[4], s:none)
hi! link VisualNOS Visual

call s:hi("Error", s:red[0], s:none, s:bold)
hi! link ErrorMsg Error
hi! link NvimInternalError Error
hi! link WarningMsg ErrorMsg

call s:hi('MoreMsg', s:background, s:blue[0], s:bold_underline)

call s:hi('WildMenu', s:fg[3], s:bg[2], s:bold)
call s:hi("NonText", s:fg[5], s:none, s:nocombine)
call s:hi("EndOfBuffer", s:bg[3], s:none, s:nocombine)

call s:hi('Pmenu', s:fg[1], s:bg[1], s:none)
call s:hi('PmenuSel', s:background, s:fg[0], s:bold)
call s:hi('PmenuSbar', s:none, s:bg[3], s:none)
call s:hi('PmenuThumb', s:none, s:fg[4], s:none)

call s:hi('MatchParen', s:fg[0], s:orange[3], s:bold_nocombine)

if has("spell")

  if has('nvim')
    exe 'hi! SpellBad guisp='.s:red[1]
    exe 'hi! SpellCap guisp='.s:yellow[1]
    exe 'hi! SpellLocal guisp='.s:yellow[1]
    exe 'hi! SpellRare guisp='.s:yellow[1]
  endif

  call s:hi('SpellCap',   s:none, s:none, s:undercurl)
  call s:hi('SpellLocal', s:none, s:none, s:undercurl)
  call s:hi('SpellRare',  s:none, s:none, s:undercurl)
  call s:hi('SpellBad',   s:none, s:none,  s:undercurl)
endif
" }}}
" Syntax: {{{
hi! link luaBraces Normal
hi! link luaTable Normal
hi! link rustCommentLineDoc Comment
hi! link PythonSpaceError Comment
hi! link FennelSpecialForm Keyword
call s:hi("schemeIdentifier", s:fg[0], s:none, s:nocombine)
call s:hi("schemeParentheses", s:fg[0], s:none, s:nocombine)
call s:hi("yamlDocumentStart", s:fg[0], s:none, s:nocombine)
call s:hi("FennelSymbol", s:fg[0], s:none, s:nocombine)
call s:hi("vimUserFunc", s:fg[0], s:none, s:nocombine)
hi! link FennelKeyword function
call s:hi('mdDefinition', s:none, s:none, s:bold_nocombine)
call s:hi('mdDone', s:fg[0], s:bg[3], s:bold_nocombine)
call s:hi('mdOperator', s:fg[0], s:none, s:nocombine)
call s:hi('htmlStrikethrough', s:none, s:none, s:strikethrough)
call s:hi('htmlLink', s:blue[0], s:none, s:underline_nocombine)
exe 'hi! htmlLink guisp='.s:blue[0]
call s:hi('htmlbold', s:none, s:none, s:bold_nocombine)
hi! link htmlUnderline Underlined
call s:hi('htmlBoldItalic', s:none, s:none, s:bold_italic)
call s:hi('htmlItalic', s:none, s:none, s:italic)

call s:hi('Comment', s:fg[4], s:none, s:nocombine)
call s:hi('Conceal', s:fg[3], s:none, s:nocombine)
call s:hi('Underlined', s:none, s:none, s:underline)
exe 'hi! Underlined guisp='.s:fg[0]

call s:hi('Directory', s:blue[0], s:none, s:bold_nocombine)

call s:hi('Title', s:none, s:none, s:bold_nocombine)

call s:hi("Keyword", s:altpurple[0], s:none, s:bold_nocombine)
hi! link Structure Keyword
hi! link Label Keyword
hi! link Conditional Keyword
hi! link Repeat Keyword
hi! link Exception Keyword
hi! link Statement Keyword

call s:hi("Question", s:purple[0], s:none, s:bold_nocombine)

call s:hi("Operator", s:altblue[0], s:none, s:nocombine)
call s:hi("Boolean ", s:altred[0], s:none, s:nocombine)
hi! link SpecialKey Boolean
call s:hi("Delimiter", s:yellow[0], s:none, s:bold_nocombine)

call s:hi("String", s:green[0], s:none, s:nocombine)
hi! link luaStringLongTag String

call s:hi("Function", s:blue[0], s:none, s:nocombine)

call s:hi("Constant", s:cyan[0], s:none, s:nocombine)

call s:hi("Type", s:cyan[0], s:none, s:bold_nocombine)

call s:hi("Number", s:purple[0], s:none, s:nocombine)
hi! link Character Number
hi! link Float Number
hi! link StorageClass Number
hi! link Typedef StorageClass

call s:hi("Identifier", s:altpurple[0], s:none, s:nocombine)

call s:hi("PreProc", s:altred[0], s:none, s:bold_nocombine)
hi! link Macro PreProc
hi! link Define PreProc
hi! link PreCondit PreProc
hi! link Special PreProc

call s:hi("Include", s:blue[0], s:none, s:nocombine)

hi! link @text.title Title
hi! link @text.strong htmlBold
hi! link @text.emphasis htmlItalic
call s:hi("@text.literal", s:fg[1], s:none, s:nocombine)
hi! link @text.reference htmlLink

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
  let g:terminal_color_9 = s:red[1]
  let g:terminal_color_10 = s:green[1]
  let g:terminal_color_11 = s:yellow[1]
  let g:terminal_color_12 = s:blue[1]
  let g:terminal_color_13 = s:purple[1]
  let g:terminal_color_14 = s:cyan[1]
  let g:terminal_color_15 = s:fg[3]
endif

" }}}
" Diffs: {{{
call s:hi('DiffDelete', s:fg[0], s:red[3], s:nocombine)
hi! link DiffRemoved DiffDelete
call s:hi('DiffAdd', s:fg[0], s:blue[3], s:nocombine)
hi! link DiffAdded DiffAdd
call s:hi('DiffChange', s:fg[0], s:bg[1], s:nocombine)
call s:hi('DiffText', s:fg[0], s:yellow[3], s:nocombine)
" " }}}
" LSP: {{{
hi! link LspInfoBorder WinSeparator
call s:hi("LspCodeLens", s:fg[3], s:bg[1], s:underline)
exe 'hi! LspCodeLens guisp='.s:bg[3]
call s:hi("DiagnosticError", s:red[0], s:none, s:bold)
call s:hi("DiagnosticWarn", s:yellow[0], s:none, s:bold)
call s:hi("DiagnosticInfo", s:purple[0], s:none, s:bold)
call s:hi("DiagnosticHint", s:cyan[0], s:none, s:bold)

call s:hi("DiagnosticSignError", s:fg[0], s:none,   s:nocombine)
call s:hi("DiagnosticSignWarn", s:fg[0], s:none, s:nocombine)
call s:hi("DiagnosticSignInfo", s:fg[0], s:none,   s:nocombine)
call s:hi("DiagnosticSignHint", s:fg[0], s:none, s:nocombine)

call s:hi("DiagnosticVirtualTextError", s:red[0], s:red[4], s:none)
call s:hi("DiagnosticVirtualTextWarn", s:yellow[0], s:yellow[4], s:none)
call s:hi("DiagnosticVirtualTextInfo", s:purple[0], s:purple[4], s:none)
call s:hi("DiagnosticVirtualTextHint", s:cyan[0], s:cyan[4], s:none)

call s:hi("DiagnosticUnderlineError", s:none, s:red[4], s:underline)
exe 'hi! DiagnosticUnderlineError guisp='.s:red[1]
call s:hi("DiagnosticUnderlineWarn", s:none, s:yellow[4], s:underline)
exe 'hi! DiagnosticUnderlineWarn guisp='.s:yellow[1]
call s:hi("DiagnosticUnderlineInfo", s:none, s:purple[4], s:underline)
exe 'hi! DiagnosticUnderlineInfo guisp='.s:purple[1]
call s:hi("DiagnosticUnderlineHint", s:none, s:cyan[4], s:underline)
exe 'hi! DiagnosticUnderlineHint guisp='.s:cyan[1]

call s:hi("LspReferenceWrite", s:none, s:bg[1], s:none)
call s:hi("LspReferenceText",  s:none, s:bg[1], s:none)
call s:hi("LspReferenceRead",  s:none, s:bg[1], s:none)

" }}}
" IndentBlankLine: {{{
call s:hi("IndentBlanklineChar", s:bg[3], s:none, s:none)
hi! link IndentBlanklineSpaceChar IndentBlanklineChar
hi! link IndentBlanklineSpaceCharBlankline IndentBlanklineChar
" }}}
" Findr: {{{
hi! link FindrMatch Search
hi! link FindrBorder FloatBorder
hi! link FindrSelected CursorLine
call s:hi("FindrDirPartial", s:green[0], s:none, s:bold)
hi! link FindrDir Directory
" }}}
" StatusLine: {{{

call s:hi("WinBar", s:fg[3], s:background, s:none)

call s:hi("MsgArea", s:fg[3], s:none, s:none)

call s:hi("StatusLine", s:fg[0], s:none, s:bold)
call s:hi("StatusLineNC", s:fg[3], s:none, s:none)

hi! link StatusLineTermNC StatusLineNC
hi! link StatusLineTerm StatusLine
hi! link MsgSeparator WinSeparator

call s:hi("TablineSel", s:background, s:fg[0], s:bold)
call s:hi("Tabline", s:fg[3], s:bg[2], s:none)
call s:hi("TablineFill", s:fg[3], s:none, s:none)
call s:hi("TablineDir", s:background, s:blue[0], s:bold)

" }}}
" Telsecope: {{{
hi! link TelescopeNormal NormalFloat
hi! link TelescopeResultsNumber LineNr
hi! link TelescopePromptCounter LineNr
hi! link TelescopeResultsSpecialComment Comment
hi! link TelescopeBorder WinSeparator
call s:hi("TelescopeTitle", s:background, s:fg[0], s:bold)
hi! link TelescopeMatching Search
call s:hi("TelescopeSelection", s:none, s:bg[1], s:none)
call s:hi("TelescopeMultiSelection", s:none, s:bg[3], s:none)
call s:hi("TelescopeSelectionCaret", s:fg[0], s:bg[1], s:bold)
call s:hi("TelescopePromptPrefix", s:fg[0], s:none, s:bold)
call s:hi("TelescopeMultiIcon", s:red[0], s:none, s:bold)
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
hi! link NeorgHeading6Title htmlH6
hi! link NeorgHeading6Prefix htmlH6
hi! link NeorgTagNameWord Keyword
hi! link NeorgTagBegin Keyword
hi! link NeorgTagEnd Keyword
hi! link NeorgMarkupVariable Function
hi! link NeorgMarkupVerbatim String
hi! link NeorgMarkupSpoiler Number
hi! link NeorgMarkupStrikethrough htmlStrikethrough
hi! link NeorgMarkupItalic htmlItalic
hi! link NeorgMarkupBold htmlBold
hi! link NeorgMarkupUnderline htmlUnderline
hi! link NeorgMarkupInlineComment Comment
hi! link NeorgDefinitionTitle Title
hi! link NeorgDefinitionContent htmlItalic
hi! link NeorgCarryoverTag Type
hi! link NeorgTrailingModifier Operator
hi! link NeorgAnchorDeclarationText htmlLink
hi! link NeorgQuote1Content htmlItalic
hi! link NeorgQuote2Content htmlItalic
hi! link NeorgQuote3Content htmlItalic
hi! link NeorgQuote4Content htmlItalic
hi! link NeorgQuote5Content htmlItalic
hi! link NeorgQuote6Content htmlItalic
" }}}
" Org: {{{
call s:hi("OrgDone", s:fg[0], s:green[2], s:bold)
hi! link OrgTodo Todo
hi! link OrgHeading1 htmlH1
hi! link OrgHeading2 htmlH2
hi! link OrgHeading3 htmlH3
hi! link OrgHeading4 htmlH4
hi! link OrgHeading5 htmlH5
hi! link orgHyperlink htmlLink
hi! link orgHyperURL Normal
hi! link orgBold htmlBold
" }}}
" CSV: {{{
call s:hi("CSVColumnHeaderOdd", s:fg[0], s:none, s:bold_underline)
call s:hi("CSVColumnHeaderEven", s:fg[0], s:none, s:bold_underline)
call s:hi("CSVColumnEven", s:green[0], s:none, s:underline)
call s:hi("CSVColumnOdd", s:blue[0], s:none, s:underline)
call s:hi("CSVDelimiter", s:bg[3], s:none, s:underline)
exe "hi! CSVColumnHeaderOdd guisp=". s:bg[3]
exe "hi! CSVColumnHeaderEven guisp=". s:bg[3]
exe "hi! CSVColumnEven guisp=". s:bg[3]
exe "hi! CSVColumnOdd guisp=". s:bg[3]
" }}}
" Gitsigns: {{{
call s:hi("GitSignsAdd", s:blue[1], s:none, s:none)
call s:hi("GitSignsDelete", s:red[1], s:none, s:none)
call s:hi("GitSignsChange", s:bg[3], s:none, s:none)
"
" }}}
" Cmp: {{{
call s:hi("CmpItemAbbrMatchDefault", s:fg[0], s:none, s:bold)
call s:hi("CmpItemKind", s:altpurple[0], s:none, s:none)
" }}}
" Hop: {{{
call s:hi("HopNextKey", s:fg[0], s:blue[2], s:bold_nocombine)
call s:hi("HopNextKey1", s:fg[0], s:red[2], s:bold_nocombine)
call s:hi("HopNextKey2", s:fg[0], s:red[3], s:nocombine)
call s:hi("HopUnmatched", s:bg[3], s:background, s:nocombine)
call s:hi("HopCursor", s:none, s:none, s:none)
" }}}
" LspSignature: {{{
hi! link LspSignatureActiveParameter IncSearch
" }}}
" Trouble: {{{
call s:hi("TroubleNormal", s:fg[0], s:none, s:bold)
hi! link TroubleText TroubleNormal
call s:hi("TroubleCount", s:fg[0], s:yellow[2], s:bold)
" }}}
" Lir: {{{
hi! link LirDir Directory
hi! link LirFolderNode Directory
" }}}
" Notify: {{{
hi! link NotifyERRORBorder FloatBorder
hi! link NotifySUCCESSBorder FloatBorder
hi! link NotifyLOADINGBorder FloatBorder
hi! link NotifyWARNBorder  FloatBorder
hi! link NotifyINFOBorder  FloatBorder
hi! link NotifyDEBUGBorder FloatBorder
hi! link NotifyTRACEBorder FloatBorder
call s:hi("NotifySUCCESSIcon", s:green[1], s:none, s:none)
hi! link NotifyLOADINGIcon NotifySUCCESSIcon
hi! link NotifyERRORIcon DiagnosticSignError
hi! link NotifyWARNIcon DiagnosticSignWarn
hi! link NotifyINFOIcon DiagnosticSignInfo
hi! link NotifyDEBUGIcon DiagnosticSignHint
hi! link NotifyTRACEIcon DiagnosticSignHint
call s:hi("NotifyERRORTitle", s:red[0], s:none, s:bold_nocombine)
call s:hi("NotifyWARNTitle", s:yellow[0], s:none, s:bold_nocombine)
call s:hi("NotifyINFOTitle", s:cyan[0], s:none, s:bold_nocombine)
call s:hi("NotifyDEBUGTitle", s:purple[0], s:none, s:bold_nocombine)
call s:hi("NotifyTRACETitle", s:purple[0], s:none, s:bold_nocombine)
call s:hi("NotifySUCCESSTitle", s:green[0], s:none, s:bold_nocombine)
hi! link NotifyLOADINGTitle NotifySUCCESSTitle
call s:hi("NotifyERRORBody", s:fg[0], s:none, s:none)
hi! link NotifyLOADINGBody NotifyERRORBody
hi! link NotifySUCCESSBody NotifyERRORBody
hi! link NotifyWARNBody NotifyERRORBody
hi! link NotifyINFOBody NotifyERRORBody
hi! link NotifyDEBUGBody NotifyERRORBody
hi! link NotifyTRACEBody NotifyERRORBody
" }}}
" Hlsearch: {{{
hi! link HlSearchLens Search
" }}}
" SwitchWindow: {{{
call s:hi("SwitchWindowSelected", s:none, s:blue[3], s:none)
call s:hi("SwitchWindowClosed", s:fg[0], s:red[3], s:none)
call s:hi("SwitchWindowSwapped", s:fg[0], s:yellow[3], s:none)
call s:hi("SwitchWindowKey", s:fg[0], s:red[2], s:none)
call s:hi("SwitchWindowKeyCur", s:fg[0], s:blue[2], s:none)
call s:hi("SwitchWindowNormal", s:fg[0], s:bg[1], s:none)
call s:hi("SwitchWindowFade", s:fg[4], s:background, s:nocombine)
" }}}
" Lir : {{{
call s:hi("LirGitStatusBracket", s:bg[3], s:none, s:none)
call s:hi("LirGitStatusIndex", s:blue[0], s:blue[3], s:none)
call s:hi("LirGitStatusWorktree", s:yellow[0], s:yellow[3], s:none)
call s:hi("LirGitStatusUnmerged", s:red[0], s:red[3], s:none)
call s:hi("LirGitStatusUntracked", s:fg[3], s:none, s:none)
call s:hi("LirGitStatusIgnored", s:fg[3], s:none, s:none)
" }}}
" Vimtex: {{{
hi! link texPartArgTitle title
" }}}
" ufo: {{{
call s:hi("UfoFoldedEllipsis", s:fg[4], s:none, s:none)
" }}}
" Twilight: {{{
hi! link Twilight NonText
" }}}
" Rainbow: {{{
call s:hi("rainbowcol1", s:fg[0], s:none, s:none)
call s:hi("rainbowcol2", s:yellow[0], s:none, s:none)
call s:hi("rainbowcol3", s:cyan[0], s:none, s:none)
call s:hi("rainbowcol4", s:purple[0], s:none, s:none)
call s:hi("rainbowcol5", s:altblue[0], s:none, s:none)
call s:hi("rainbowcol6", s:altred[0], s:none, s:none)
call s:hi("rainbowcol7", s:altpurple[0], s:none, s:none)
" }}}
" Leap: {{{
call s:hi("LeapMatch", s:fg[0], s:none, s:bold_nocombine)
call s:hi("LeapLabelPrimary", s:blue[0], s:none, s:bold_nocombine)
call s:hi("LeapLabelSecondary", s:red[0], s:none, s:nocombine)
call s:hi("LeapBackdrop", s:fg[5], s:none, s:nocombine)
call s:hi("LeapLabelSelected", s:fg[3], s:bg[1], s:nocombine)
" }}}
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
