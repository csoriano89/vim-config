"
" Carlos s Vim Configuration
"
" Based on Derek Wyat config repository

"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------

" Get pathogen up and running
filetype off 
call pathogen#infect()
call pathogen#helptags()

" Add xptemplate global personal directory value
if has("unix")
  set runtimepath+=~/.vim/xpt-personal
endif

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Printing options
set printoptions=header:0,duplex:long,paper:letter

" set the search scan to wrap lines
set wrapscan

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set noignorecase

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash
if has("unix")
  set shell=bash
else
  set shell=ksh.exe
endif

" Make command line two lines high
set ch=2

" set no visual or sound bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
"set lazyredraw

" Don't show the current command int he lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
"set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acg

" Setting this below makes it sow that error messages don't disappear after one second on startup.
"set debug=msg

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 4 lines from the top and 4
" lines from the bottom
set scrolloff=4

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
set textwidth=80

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
"set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" Line numbers
set number

" Types of files to ignore when autocompleting things
set wildignore+=*.o,*.class,*.git,*.svn

" OK, so I'm gonna remove the VIM safety net for a while and see if kicks my ass
set nobackup
set nowritebackup
set noswapfile

" Various characters are "wider" than normal fixed width characters, but the
" default setting of ambiwidth (single) squeezes them into "normal" width, which
" sucks.  Setting it to double makes it awesome.
"set ambiwidth=double

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1

" System default for mappings is now the "," character
let mapleader = ","

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" put the vim directives for my file editing settings in
nmap <silent> ,vi ovim:set ts=2 sts=2 sw=2:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" Show all available VIM servers
nmap <silent> ,ss :echo serverlist()<CR>

" The following beast is something i didn't write... it will return the 
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as 
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" Maps to make handling windows a bit easier
"noremap <silent> ,h :wincmd h<CR>
"noremap <silent> ,j :wincmd j<CR>
"noremap <silent> ,k :wincmd k<CR>
"noremap <silent> ,l :wincmd l<CR>
"noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Add a GUID to the current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Toggle fullscreen mode
nmap <silent> <F3> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>
nmap <silent> ,u~ :t.\|s/./\\~/g\|:nohls<cr>

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
"nmap <silent> ,sw :execute ":resize " . line('$')<cr>

" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap ,bd :BD<cr>

" Use CTRL-E to replace the original ',' mapping
nnoremap <C-E> ,

" Alright... let's try this out
imap jj <esc>
cmap jj <esc>

" I like jj - Let's try something else fun
imap ,fn <c-r>=expand('%:t:r')<cr>

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

" Digraphs
" Alpha
imap <c-l><c-a> <c-k>a*
" Beta
imap <c-l><c-b> <c-k>b*
" Gamma
imap <c-l><c-g> <c-k>g*
" Delta
imap <c-l><c-d> <c-k>d*
" Epslion
imap <c-l><c-e> <c-k>e*
" Lambda
imap <c-l><c-l> <c-k>l*
" Eta
imap <c-l><c-y> <c-k>y*
" Theta
imap <c-l><c-h> <c-k>h*
" Mu
imap <c-l><c-m> <c-k>m*
" Rho
imap <c-l><c-r> <c-k>r*
" Pi
imap <c-l><c-p> <c-k>p*
" Phi
imap <c-l><c-f> <c-k>f*

" Syntax coloring lines that are too long just slows down the world
"set synmaxcol=2048

" I don't like it when the matching parens are automatically highlighted
"let loaded_matchparen = 1

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

"-----------------------------------------------------------------------------
" Fugitive
"-----------------------------------------------------------------------------
" Thanks to Drew Neil
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \  noremap <buffer> .. :edit %:h<cr> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

nmap ,gs :Gstatus<cr>
nmap ,ge :Gedit<cr>
nmap ,gw :Gwrite<cr>
nmap ,gr :Gread<cr>

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

"-----------------------------------------------------------------------------
" L9 mappings
"-----------------------------------------------------------------------------
" L9 creates an 'interesting' set of error formats when quickfix is engaged
" This mapping cleans it up
nmap <silent> ,eu :sign unplace *<cr>

"-----------------------------------------------------------------------------
" FSwitch mappings
"-----------------------------------------------------------------------------
nmap <silent> ,of :FSHere<CR>
nmap <silent> ,ol :FSRight<CR>
nmap <silent> ,oL :FSSplitRight<CR>
nmap <silent> ,oh :FSLeft<CR>
nmap <silent> ,oH :FSSplitLeft<CR>
nmap <silent> ,ok :FSAbove<CR>
nmap <silent> ,oK :FSSplitAbove<CR>
nmap <silent> ,oj :FSBelow<CR>
nmap <silent> ,oJ :FSSplitBelow<CR>

"-----------------------------------------------------------------------------
" XPTemplate settings
"-----------------------------------------------------------------------------
let g:xptemplate_brace_complete = ''

"-----------------------------------------------------------------------------
" VimSokoban settings
"-----------------------------------------------------------------------------
" Sokoban stuff
let g:SokobanLevelDirectory = "/home/dwyatt/.vim/bundle/vim-sokoban/VimSokoban/"

"-----------------------------------------------------------------------------
" FuzzyFinder Settings
"-----------------------------------------------------------------------------
let g:fuf_splitPathMatching = 1
let g:fuf_maxMenuWidth = 110
let g:fuf_timeFormat = ''
nmap <silent> ,fv :FufFile ~/.vim/<cr>
nmap <silent> ,fc :FufMruCmd<cr>
nmap <silent> ,fm :FufMruFile<cr>

let g:CommandTMatchWindowAtTop = 1
let g:make_scala_fuf_mappings = 0

"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['.project.root']
let g:ctrlp_custom_ignore = '\v%(/\.%(git|hg|svn)|\.%(class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip)$|/target/)'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1ri'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-p>'],
  \ 'PrtHistory(-1)':       ['<c-j>', '<down>'],
  \ 'PrtHistory(1)':        ['<c-i>', '<up>']
\ }
map ,fb :CtrlPBuffer<cr>
map ,ff :CtrlP .<cr>
map ,fr :CtrlP<cr>
map ,fm :CtrlPMixed<cr>

"-----------------------------------------------------------------------------
" Autotags Settings
"-----------------------------------------------------------------------------
let g:autotags_no_global = 0
let g:autotags_ctags_opts = "--exclude=target --exclude=vendor"
let g:autotags_ctags_languages = "+Scala,+Java,+Vim"
let g:autotags_ctags_langmap = "Scala:.scala,Java:.java,Vim:.vim,JavaScript:.js"
let g:autotags_ctags_global_include = ""

"-----------------------------------------------------------------------------
" Gundo Settings
"-----------------------------------------------------------------------------
nmap <c-F5> :GundoToggle<cr>

"-----------------------------------------------------------------------------
" Conque Settings
"-----------------------------------------------------------------------------
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_PromptRegex = '^-->'
let g:ConqueTerm_TERM = 'xterm'

"-----------------------------------------------------------------------------
" EasyAlign Settings
"-----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode - Not the docs in upstream, so strange..
vnoremap <silent> <Enter> :EasyAlign<cr>

" Start interactive EasyAlign with a Vim movement
nnoremap <silent> <Leader>a :EasyAlign<cr>

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
set guifont="Source\\ Code\\ Pro\\ Medium\\ 9"
colorscheme jellybeans
    
:nohls
