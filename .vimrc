if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

call plug#begin()
Plug 'kien/ctrlp.vim' " use: ctrl-p [search] search files, ctrl-jk nav, ctrl-t open tab
Plug 'fholgado/minibufexpl.vim' " buffer explorer
Plug 'scrooloose/syntastic' " passive syntax linter
Plug 'w0rp/ale' " passive syntax linter
Plug 'easymotion/vim-easymotion' " use: <Leader>[motion] use motion to go to
Plug 'SirVer/ultisnips' " use: <C-Space> to expand and next, <C-h> back
Plug 'scrooloose/nerdtree' " File explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " passive nerdtree git extension
Plug 'honza/vim-snippets' " passive
Plug 'Yggdroot/indentLine' " passive
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' } " complete from omnibar, use tab to scroll
Plug 'tpope/vim-repeat' " passive
Plug 'dahu/vim-fanfingtastic' " passive, f,F,t,T,etc. wrap lines
Plug 'embear/vim-localvimrc' " passive
Plug 'vim-scripts/restore_view.vim' " passive
Plug 'pangloss/vim-javascript' " passive
Plug 'mxw/vim-jsx' " passive
Plug 'alvan/vim-closetag' " passive close html tags
Plug 'Valloric/MatchTagAlways' " passive match tags
Plug 'jiangmiao/auto-pairs' " passive match brackets, parens, quotes
Plug 'christoomey/vim-tmux-navigator' " passive allow for tmux navigating like vim
Plug 'ryanoasis/vim-devicons' " passive icons
Plug 'airblade/vim-gitgutter' " passive adds a git diff gutter
Plug 'tpope/vim-fugitive' " git commands in vim
Plug 'tpope/vim-obsession' " passive vim session saving
Plug 'tpope/vim-surround' " surround stuff with cs
Plug 'vim-airline/vim-airline' " bottom status line
Plug 'ludovicchabant/vim-gutentags' " automatic ctags generation
Plug 'majutsushi/tagbar' " class outline
Plug 'semanser/vim-outdated-plugins' " passive, checks for plugin updates
Plug 'AndrewRadev/splitjoin.vim' " gS split blocks into multiline statements or gJ join into single line
Plug 'rust-lang/rust.vim' " passive, rust integration
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'godlygeek/tabular' " align stuff :Tabularize
Plug 'itchyny/vim-haskell-indent' " passive, auto indent haskell
" Plug 'eagletmt/ghcmod-vim'
" Plug 'Shougo/vimproc'
call plug#end()

let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\    'cpp': [],
\}
let g:ale_python_auto_pipenv=1

" root marker for project
let g:ctrlp_root_markers = ['.vroot']

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js'

" snippets
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<C-Space>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Eclim settings
let g:EclimTempFilesEnable=0

" Misc costom settings
set nowrap
set number
setg relativenumber
set ignorecase
set autoindent

" Toggle relative line numbering
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

" Leader key
let mapleader = "\<Space>"
nnoremap <Leader>nt :call NumberToggle()<CR>
nnoremap <Leader>0 ^
nnoremap <Leader>s :sp<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>f :NERDTreeFocus<CR>
nnoremap <Leader>c :NERDTreeFind<CR>
nnoremap <Leader>w :MBEFocus<CR>
nnoremap <Leader>l <C-w><C-p>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bq :lclose<bar>b#<bar>bd #<CR>
noremap <Leader><Bar> :Tabularize /
noremap <Leader><Bar>= :Tabularize / \zs=\ze <CR>
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nmap <F8> :TagbarToggle<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" encoding
set encoding=UTF-8

" Folding
set foldmethod=indent
set foldlevel=10
"autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax
"autocmd InsertEnter,WinLeave * setlocal foldmethod=manual

" Vim-repeat
"" TODO

" Vimrc editing
:command! Vimrc tabedit $MYVIMRC
:command! Vimu source $MYVIMRC

" Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Enter
nnoremap <S-Enter> O<Esc>
nnoremap <Enter> o<Esc>
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" local vimrc store decisions if uppercase
let g:localvimrc_persistent = 1


" Backup
set backup
set backupdir=/tmp
set directory=~/.vim/swp

" Tab delineation
set list lcs=tab:\|\ 

" Eclim YCM usage
let g:EclimCompletionMethod = 'omnifunc'

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  if !has('nvim')
      set ttymouse=xterm2
  endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee % > /dev/null
