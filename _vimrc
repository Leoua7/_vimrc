set nocompatible
filetype plugin on
set fileencodings=utf-8,ucs-bom,cp936,big5
set fileencoding=utf-8

source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

call plug#begin('~/.vim/plugged')
"Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
"set conceallevel=2
"let g:tex_conceal="abdgm"
Plug 'kaicataldo/material.vim'
Plug 'Leoua7/vim-snippets'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'lervag/vimtex'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

call plug#end()

if has("gui_running") 
"au GUIEnter * simalt ~x " 窗口启动时自动最大化 
"set guioptions-=m " 隐藏菜单栏 
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=b
set showtabline=0

set tabstop=4
set noautoindent
"字体
"set guifont=Monaco\ 11
endif

set number

map <C-s> :w<CR>:e<CR>
imap <C-s> <ESC>:w<CR>:e<CR>
"set lines=59 columns=85
:cd D:\AppDate\Vim Dates

