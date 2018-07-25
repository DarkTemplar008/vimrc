set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'freiz/c.vim'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax on

"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set nobackup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set expandtab                   " use the appropriate number of spaces to insert a <Tab>  
set fileformat=unix             " use unix fileformat 
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set mouse=a                     " enable the use of the mouse
set wrap                      " do not wrap lines
set number                      " show line number
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set shiftwidth=4                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set softtabstop=4               " soft tab stop
set tabstop=4                   " number of spaces that a <Tab> counts for
set t_Co=256                    " number of colors
set visualbell                  " visual bell instead of beeping
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode

"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
inoremap , ,<Space>

"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>

"vnoremap ( s()<Esc>P<Right>%
"vnoremap [ s[]<Esc>P<Right>%
"vnoremap { s{}<Esc>P<Right>%

"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
"inoremap ' ''<Left>
"inoremap " ""<Left>
"inoremap ` ``<Left>

"vnoremap ' s''<Esc>P<Right>%
"vnoremap " s""<Esc>P<Right>%
"vnoremap ` s``<Esc>P<Right>%


"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
 noremap <unique><silent> <F2>      :write<CR>
 noremap <unique><silent> <F3>      :NERDTreeToggle<CR>
 noremap <unique><silent> <F4>      :TagbarToggle<CR>

inoremap <unique><silent> <F2> <Esc>:write<CR>
inoremap <unique><silent> <F3> <Esc>:NERDTreeToggle<CR>
inoremap <unique><silent> <F4> <Esc>:TagbarToggle<CR>

"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
 noremap <unique><silent> <s-tab>      :if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap <unique><silent> <s-tab> <Esc>:if &modifiable && !&readonly && 
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"-------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif " has("autocmd")

"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
"if has("autocmd")
"  autocmd BufEnter * :lchdir %:p:h
"endif " has("autocmd")
"
if has("multi_byte")                                                                                   
	set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1                                    
	if v:lang =~ "^zh_CN"                                                                              
		set encoding=cp936                                                                             
		set termencoding=cp936                                                                         
		set fileencoding=cp936                                                                         
	elseif v:lang =~ "^zh_TW"                                                                          
		set encoding=big5                                                                              
		set termencoding=big5                                                                          
		set fileencoding=big5                                                                          
	elseif v:lang =~ "^ko"                                                                             
		set encoding=euc-kr                                                                            
		set termencoding=euc-kr                                                                        
		set fileencoding=euc-kr                                                                        
	elseif v:lang =~ "^ja_JP"                                                                          
		set encoding=euc-jp                                                                            
		set termencoding=euc-jp                                                                        
		set fileencoding=euc-jp                                                                        
	endif                                                                                              

	if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"                                                         
		set encoding=utf-8                                                                             
		set termencoding=utf-8                                                                         
		set fileencoding=utf-8                                                                         
	endif                                                                                              
else                                                                                                   
	echoerr "Sorry,  this version of (g)vim was not compiled with multi_byte"                           
endif

"-------------------------------------------------------------------------------
" cscope
"-------------------------------------------------------------------------------
if has("cscope")
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

"-------------------------------------------------------------------------------
"" molokai
"-------------------------------------------------------------------------------
colorscheme molokai

"-------------------------------------------------------------------------------
"" tagbar
"-------------------------------------------------------------------------------
let g:tagbar_width = 32
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▸',  '▾']

"-------------------------------------------------------------------------------
"" nerdtree 
"-------------------------------------------------------------------------------
let g:NERDTreeWinSize = 32

"-------------------------------------------------------------------------------
"" vim-airline 
"-------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#fnamecollapse = 0

"-------------------------------------------------------------------------------
"" ctrlsf 
"-------------------------------------------------------------------------------
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>N <Plug>CtrlSFCwordExec
nmap     <C-F>p <Plug>CtrlSFPwordPath
nmap     <C-F>P <Plug>CtrlSFPwordExec
nnoremap <C-F>t :CtrlSFToggle<CR>
nnoremap <C-F>u :CtrlSFUpdate<CR>
let g:ctrlsf_auto_close = 1
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_selected_line_hl = 'op'
let g:ctrlsf_winsize = '30%'

"-------------------------------------------------------------------------------
" YouCompleteMe
"-------------------------------------------------------------------------------
let g:ycm_confirm_extra_conf = 0
let NERDTreeIgnore=['\.o$', '\.pyc$']
