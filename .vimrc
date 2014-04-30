set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \     },
      \ }
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'taku-o/vim-catn'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'

syntax on

set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i + 1) . 'T'
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

autocmd ColorScheme * highlight TabLineSel cterm=none ctermfg=255
autocmd ColorScheme * highlight TabLine cterm=none ctermfg=243 ctermbg=none
autocmd ColorScheme * highlight TabLineFill cterm=none ctermbg=none
autocmd ColorScheme * highlight LineNr ctermfg=243
autocmd ColorScheme * highlight StatusLine cterm=none ctermfg=255 ctermbg=232
autocmd ColorScheme * highlight StatusLineNC cterm=none ctermfg=243 ctermbg=232
autocmd ColorScheme * highlight CursorLine ctermbg=232
autocmd ColorScheme * highlight Normal ctermbg=none
colorscheme hybrid

filetype plugin indent on
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

set number
set incsearch
set hlsearch
set showmatch
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1

let g:snippets_dir = "~/.vim/bundle/snipmate-snippets/snippets/"

au BufNewFile,BufRead *.applescript      setf applescript

let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_WinWidth = 50
let Tlist_Exit_OnlyWindow = 1

nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap \|\| \|\|<LEFT>
