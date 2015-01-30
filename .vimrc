"------------------------------------------------------------
" Features
"

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options
"

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Jump to searched word while typing
set incsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options
"

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
"set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options
"

set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab


"------------------------------------------------------------
" Neobundle
"

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'build' : {
            \     'linux' : './install.sh --clang-completer',
            \     'unix' : './install.sh --clang-completer',
            \    },
            \ }

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'klen/python-mode'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/paredit.vim'
NeoBundle 'yuku-t/unite-git'

" Required
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"------------------------------------------------------------
" Mappings {{{1
"

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Copy/Paste mappings
vmap <C-c> "+y
nmap <C-c> "+yiw
vmap <C-v> "+p
imap <C-v> <Esc>"+pa

" Uncomment for use with X11 forwarding
vmap <C-c> :w !xclip -f -sel clip<CR><CR>
vmap <C-v> :r!xclip -o -sel clip<CR>

" Allow saving of read only files
cmap w!! w !sudo tee % > /dev/null

" Escape using kk (set timeout down so that typing two ks is still possible)
inoremap kk <Esc>
set timeoutlen=200

" Remap leader for make not so much RSI
let mapleader = ","


"------------------------------------------------------------
" Misc
"

colorscheme relaxedgreen
"set background=dark
hi ColorColumn ctermbg=DarkBlue

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

" Strip trailing whitespace from python and clojure files
autocmd FileType python,clojure,coffeescript autocmd BufWritePre <buffer> :%s/\s\+$//e


"------------------------------------------------------------
" Plugins
"


" Use pathogen to manage plugins
call pathogen#infect()
Helptags

" NERDTree toggling
map <F2> :NERDTreeToggle<CR>

"------------------------------------------------------------
" Clojure/paredit
"

" Rainbow paren highlighting
let vimclojure#ParenRainbow = 1
"let vimclojure#WantNailgun = 1

let g:paredit_smartjump=1


"------------------------------------------------------------
" Unite.vim
"

" If working in VM, don't follow sshfs back to host
call unite#custom#source('file_rec,file_rec/async', 'ignore_globs', ['/home/vagrant/.host'])

" Use fuzzy matcher with selecta sort by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])

" Use silver searcher if available
if executable('ag')
    " Use ag to power file list
    let g:unite_source_rec_async_command= 'ag --follow --nocolor --nogroup --hidden -g ""'

    " Use ag in unite grep source
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
    \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif


" Emulate ctrl-p fuzzy finder
nnoremap <C-p> :Unite -start-insert file_rec/async:!<cr>

" Show currently changed git files
nnoremap <C-g> :Unite git_modified git_untracked<cr>

" Grep using ?
nnoremap ? :Unite grep:!<cr>

" Grep for exact match under cursor (hyper-*)
nnoremap <C-n> :UniteWithCursorWord grep:!::-w<cr>

" Enable yank history
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :Unite history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


"------------------------------------------------------------
" Syntastic
"

" Disable for python if favour of pyflakes-vim
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['python'] }


"------------------------------------------------------------
" Pymode
"

" Disable folding
let g:pymode_folding = 0

" Check syntax as we type
let g:pymode_lint_on_fly = 1

" Don't pop up quickfix window automatically on lint errors
let g:pymode_lint_cwindow = 0

" Don't highlight incorrect spaces (annoying when starting new indent)
let g:pymode_syntax_space_errors = 0


"------------------------------------------------------------
" gitgutter
"

" Jump between hunks
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk


"------------------------------------------------------------
" vimrc config
"

" Allow work specific settings to override anything else
let vimrc_work = expand("~/.vimrc_work")
if filereadable(vimrc_work)
    exe "source " . vimrc_work
endif


" Autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
