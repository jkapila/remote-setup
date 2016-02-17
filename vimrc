
" Vim config for complete Python IDE
" Creator : Jitin Kapila
" Updated: 
"Error: jedi-vim failed to initialize Python: jedi#setup_py_version: Vim(pyfile):Traceback (most recent call last): (in function  jedi#init_python[3]..<SNR>105_init_python[48]..jedi#setup_py_version, line 18)
" Initial setup notes
" Remove standard vim using sudo apt-get remove vim vim-tiny
" Install form scratch following steps
" $git clone https://github.com/vim/vim.git
" $cd vim/src
" $./configure --enable-pythoninterp=yes --with-python-config-dir=/home/jitin/anaconda2/lib/python2.7/config --prefix=$HOME
" better version of above
" $vi_cv_path_python=path/to/anaconda/bin/python ./configure --with-features=huge --enable-pythoninterp --prefix=/SOME/FOLDER
" $vi_cv_path_python=$HOME/anaconda2/bin/python ./configure --with-features=huge --enable-pythoninterp=yes --prefix=$HOME/vim-py-ide
" $make && $make check && make install && make clean
" /home/jitin/anaconda2/bin/python
"Then: 
" * Copy the vimrc file to ~/.vimrc
" * git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" * In vim, run the command :PluginInstall (to tell Vundle to install the
" Bundles)

" Set the runtime path to include Vundle and initialize



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Vundle Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"git interface
Plugin 'tpope/vim-fugitive'

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

"html
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"multiple commenting
"Plugin 'https://github.com/scrooloose/nerdcommenter.git'

" Tagbar
Plugin 'majutsushi/tagbar'

"Zoom In zoom out check to see if it is working or not
"Plugin 'git@github.com:vim-scripts/ZoomWin.git'

"auto-completion stuff
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'

"Plugin 'git@github.com:jiangmiao/auto-pairs.git'

"code snipping
Plugin 'SirVer/ultisnips'

"code folding
Plugin 'tmhedberg/SimpylFold'

"code finding
Plugin 'tacahiroy/ctrlp-funky'

"tabs and status
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'git@github.com:fholgado/minibufexpl.vim.git'

"Colors!!!
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'git@github.com:w0ng/vim-hybrid.git'
Plugin 'git@github.com:jonathanfilip/vim-lucius.git'
Plugin 'git@github.com:goatslacker/mango.vim.git'
Plugin 'git@github.com:zeis/vim-kolor.git'
Plugin 'altercation/vim-colors-solarized'

"These colorschems dosent needs any settings eventually will add all these setting to git and make it standard
Plugin 'jnurmine/Zenburn'
Plugin 'git@github.com:sickill/vim-monokai.git'
Plugin 'git@github.com:Lokaltog/vim-distinguished.git' 
Plugin 'git@github.com:ciaranm/inkpot.git'
Plugin 'flazz/vim-colorschemes'

call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Configuration Starts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

"Sytax checking
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Turn on the WiLd menu
set wildmenu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" No swap files or backups
set noswapfile
set nobackup

"turn on numbering
set number

" Better paste functionality
set paste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
"set si "Smart indent
set nowrap "No Wrap lines for python

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Visual Vim Ctrl-Tab and Ctrl-Shift-Tab for tab switching
"noremap <C-Tab> gt
"noremap <C-S-Tab> gT


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Completion , Tab Settings and Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ycm Settings cannot implement since anaconda pytohn in compiled with ucs2 
"     \against required ucs4 for ycmswitchin to jedi-vim again
"let g:ycm_python_binary_path = '/home/jitin/anaconda2/bin/python2.7'
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"supertab Settings
"inoremap <c-n> <down>
let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

"UtilSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"=============old
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"=============new
let g:UltiSnipsExpandTrigger = "<s-tab>"
let g:UltiSnipsJumpForwardTrigger = "<s-tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"other tips

"omnicomplete
"autocmd FileType python set omnifunc=pythoncomplete#Complete

let g:SuperTabCrMapping = 0
let g:UltiSnipsJumpForwardTrigger = "<Right>" 
let g:UltiSnipsJumpBackwardTrigger = "<Left>"

"jedi-vim
"testing
let g:jedi#completions_command = "<C-x><c-u>"

"let g:jedi#completions_command = "<tab>"
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
"let g:jedi#popup_select_first = 0 
let g:jedi#show_call_signatures_delay= 100
let g:jedi#completions_enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :call VisualSelection('f', '')<CR>
"vnoremap <silent> # :call VisualSelection('b', '')<CR>

"making search powerful
set hlsearch
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
":imap jk <Esc>

" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

" Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
"map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"Arilne Configuration
let g:airline_theme="luna"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"AutoPairs ----- has problem with utils snips
"let g:AutoPairsShortcutToggle = '<leader>'
"let g:AutoPairsFlyMode = 0
"let g:AutoPairsShortcutBackInsert = '<M-b>'

"delimitMate
let delimitMate_autoclose = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_quotes = "\" ' ` * #"
au FileType python let b:delimitMate_nesting_quotes = ['"','`']

"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i
"inoremap $t <><esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=35
let g:NERDTreeWinPos = "left"
map <F3> :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> General Libraries Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"Ctrlp_funky Setting
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr> 

"Doc string preview
let g:SimpylFold_docstring_preview = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Python syntax checker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers=['pyflakes']
"this will be used if not working properly
"let g:syntastic_python_python_exec = '/path/to/python3'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>GUI and others stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"codeschool Setting
"colorscheme codeschool
"set guifont=Monaco:h12

"base-16
"set background=dark
"colorscheme base16-default "for more themes refer: https://github.com/chriskempson/base16-vim/tree/master/colors

"Vim hybrid
"set background=dark
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
"colorscheme hybrid

"Zenburn
"colorscheme zenburn

" Solarised settings
"set background=dark "or light
"colorscheme solarized

"Mango vim setting 
"set background=dark  " or `light` as your background
"colorscheme mango

"Lucius themes
"colorscheme lucius 
"LuciusLight " for other option refer http://www.vim.org/scripts/script.php?script_id=2536

"Kolor theme
"colorscheme kolor
"let g:kolor_italic=1                    " Enable italic. Default: 1
"let g:kolor_bold=1                      " Enable bold. Default: 1
"let g:kolor_underlined=0                " Enable underline. Default: 0
"let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0

"gruvbox Setting
"set background=light " or dark
"nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
"nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
"nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

"nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
"nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
"nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

"colorsheme
call togglebg#map("<F5>")
"colorscheme zenburn
"colorscheme monokai

"monokai
colorscheme monokai


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""Start Python PEP 8 stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
"au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" For full syntax highlighting:
let python_highlight_all=1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 

"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>Make Vim Executable and Compilable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"python version check
function! s:pyver()
  :py import sys;print("Version : {} \n Path: {}".format(sys.version,sys.path))
endfunction

command Pyver call s:pyver()

"python makeprg settings
map <F6> :make<CR>%

setlocal makeprg=python\ %

setlocal errorformat=
        \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
        \%C\ \ \ \ %.%#,
        \%+Z%.%#Error\:\ %.%#,
        \%A\ \ File\ \"%f\"\\\,\ line\ %l,
        \%+C\ \ %.%#,
        \%-C%p^,
        \%Z%m,
        \%-G%.%#

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Make vim Runnable and show output
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"this is sure shot solution to run pyton working with others
command R call s:ExecPy('%')

"this function is useful when some input is to be given via console
function! s:ExecPy(file)
  let file = fnameescape(expand(a:file))
  :w "saves file before execution
  execute '!python '. file 
  echo 'Execution Done for ' . file . '...'
endfunction

"this is standard execution which executes the current file
noremap <F10> <ESC>:call ExecuteConsole('python %')

"This will be helpfull for runnig git and others within Vim
command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shell

function! ExecuteConsole(command)
  :w "saves File before Execution
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number	
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteConsole(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction

let s:_ = ''
function! s:ExecuteInShell(command, bang)
	let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

	if (_ != '')
		let s:_ = _
		let bufnr = bufnr('%')
		let winnr = bufwinnr('^' . _ . '$')
		silent! execute  winnr < 0 ? 'belowright new ' . fnameescape(_) : winnr . 'wincmd w'
		setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile wrap number
		silent! :%d
		let message = 'Execute ' . _ . '...'
		call append(0, message)
		echo message
		silent! 2d | resize 1 | redraw
		silent! execute 'silent! %!'. _
		silent! execute 'resize ' . line('$')
		silent! execute 'syntax on'
		silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
		silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
		silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
		nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
		silent! syntax on
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"saving key mapping during testing mode
function! SaveKeyMappings(file)
  :redir! > a:file
  :silent verbose map
  :silent verbose map!
  :redir END
endfunction

"Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
