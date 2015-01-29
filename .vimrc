"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

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
" Must have options {{{1
"
" These are highly recommended options.

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
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

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

" Enable use of the mouse for all modes
"set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab



"------------------------------------------------------------
" Bundle Scripts
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
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
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/paredit.vim'

" Required:
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

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

" NERDTree toggling
map <F2> :NERDTreeToggle<CR>

" Escape using kk
inoremap kk <Esc>
set timeoutlen=200

" Remap leader for make not so much RSI
let mapleader = ","


"------------------------------------------------------------
" Misc
"


" Use pathogen to manage plugins
call pathogen#infect()
Helptags

colorscheme relaxedgreen
hi ColorColumn ctermbg=DarkBlue

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

let vimclojure#ParenRainbow = 1
"let vimclojure#WantNailgun = 1

" Unite.vim settings
call unite#custom#source('file_rec', 'ignore_globs', ['/home/vagrant/.host'])
call unite#custom#source('buffer,file,file_rec', 'sorters', 'sorter_selecta')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_rec_async_command= 'ag --follow --nocolor --nogroup --hidden -g ""'

nnoremap <C-p> :Unite -start-insert file_mru file_rec/async:!<cr>
nnoremap ? :Unite grep:!<cr>
nnoremap <C-n> :UniteWithCursorWord grep:!:-w<cr>

let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :Unite history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Strip trailing whitespace from python and clojure files
autocmd FileType python,clojure,coffeescript autocmd BufWritePre <buffer> :%s/\s\+$//e

" Syntastic
" Disable for python if favour of pyflakes-vim
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['python'] }

let g:paredit_smartjump=1

" Pymode
let g:pymode_folding = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_cwindow = 0
let g:pymode_syntax_space_errors = 0

"------------------------------------------------------------
" Allow work specific settings to override anything else
"

let vimrc_work = expand("~/.vimrc_work")
if filereadable(vimrc_work)
    exe "source " . vimrc_work
endif
