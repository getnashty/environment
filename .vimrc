" *****************************
" *****************************
" ****                     ****
" ****   NEW NASH VIMRC    ****
" ****                     ****
" *****************************
" *****************************


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mhinz/vim-signify'                  " DIFF IN GUTTA
Plugin 'vim-airline/vim-airline'			" LINE AT BOTTOM
Plugin 'morhetz/gruvbox'				    " THEME
Plugin 'https://github.com/tpope/vim-fugitive.git'	" GIT WRAPPER
Plugin 'scrooloose/nerdtree'				" DIRECTORY NAV
Plugin 'scrooloose/nerdcommenter'			" COMMENTS
Plugin 'vim-syntastic/syntastic'			" SYNTAX HIGHLIGHT
" Plugin 'w0rp/ale'					        " SYNTAX HIGHLIGHT2
Plugin 'pangloss/vim-javascript'			" JS HIGHLIGHTING
Plugin 'mxw/vim-jsx' 					    " JSX HIGHLIGHTING
Plugin 'raimondi/delimitmate' 				" AUTO-CLOSE PAIRS
Plugin 'elzr/vim-json' 					    " JSON HIGHLIGHTING
Plugin 'othree/html5.vim' 				    " HTML HIGHLIGHTING
Plugin 'hail2u/vim-css3-syntax'				" CSS HIGHLIGHTING
Plugin 'yuttie/comfortable-motion.vim'		" SMOOTH SCROLL
Plugin 'ctrlpvim/ctrlp.vim'				    " CTRLP FIND FILE
Plugin 'ap/vim-css-color'				    " CSS COLORS
Plugin 'christoomey/vim-tmux-navigator'     " TMUX & VIM PANES
Plugin 'sbdchd/neoformat'                   " PRETTIER SYNTAX

" Plugin 'Yggdroot/indentLine' " INDENT LINES

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" AIRLINE FORMATTING
" AIRLINE IS THE LONG BAR AT THE BOTTOM
let g:airline#extensions#tabline#formatter = 'jsformatter'

" NERDTREE
map <leader>n :NERDTreeToggle<CR>

" NERDCOMMENTER
filetype plugin on

" SMOOTH SCROLL CONFIG
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

"""""""""""""""""""""""""""""""
"                             "
"      Custom Functions       "
"                             "    
"""""""""""""""""""""""""""""""

"Clean trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

"""""""""""""""""""""""""""""""
"                             "
"         Appearance          "
"                             "     
"""""""""""""""""""""""""""""""

" COLOR SCHEME INFO
colorscheme gruvbox
set background=dark

" CODE HIGHLIGHT - SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_style_warning_symbol = '💩'

autocmd BufWritePre *.js Neoformat

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" CODE SYNTAX JS - VIM-JAVASCRIPT
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

set ruler        "Always show current position
set cul          "highlight current line
set hlsearch     "highlight search
set cmdheight=2  "The commandbar height
set number       "show line numbers
set nohidden     "dont unload my buffer
set nolazyredraw "Don't redraw while executing macros 
set showmatch    "Show matching bracets when text indicator is over them
set laststatus=2 "always have a status bar
set showcmd      "show information about the current command
syntax enable    "Enable syntax hl

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

"""""""""""""""""""""""""""""""
"                             " 
"     Spacing and Lines       "
"                             "
"""""""""""""""""""""""""""""""

set autoindent "auto indent the next line

"Tabs
"if $WORK
"  set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"else
"set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set expandtab " Make sure that every file uses spaces, not real tabs
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line

" Set the tab width
let s:tabwidth=4
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth
"endif

"Line Wrapping
set tw=500 "Max text width
set ai     "Auto indent
set si     "Smart indet
set wrap   "Wrap lines

"""""""""""""""""""""""""""""""
"                             "
"          Language           "
"                             "
"""""""""""""""""""""""""""""""

" => CSS
autocmd FileType css set sw=4
autocmd FileType css set ts=4
autocmd FileType css set sts=4
autocmd FileType css set textwidth=79
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" => HTML
autocmd FileType html set sw=4
autocmd FileType html set ts=4
autocmd FileType html set sts=4
autocmd FileType html set textwidth=0
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags

" => JavaScript
"au FileType javascript setl fen
"au FileType javascript setl nocindent
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
"autocmd FileType javascript set sw=4
"autocmd FileType javascript set ts=4
"autocmd FileType javascript set sts=4
autocmd FileType javascript set textwidth=79

" => Markdown
au BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType markdown set sw=4
autocmd FileType markdown set ts=4
autocmd FileType markdown set sts=4
autocmd FileType markdown set textwidth=79

" => JSON
au BufNewFile,BufRead *.json set filetype=json
:command! PrettyJSON :call PrettyJSON()

"""""""""""""""""""""""""""""""
"                             "
"      Remap Commands         "
"                             "  
"""""""""""""""""""""""""""""""

:command! W w "just write the file!
:command! Q q "just quit the file!


"""""""""""""""""""""""""""""""
"                             "
"      	     CTRLP            "
"                             "  
"""""""""""""""""""""""""""""""

"show window at top of screen
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0


"""""""""""""""""""""""""""""""
"                             "
"          MISC VIM           "
"                             " 
"""""""""""""""""""""""""""""""

set history=700                             "Sets how many lines of history VIM has to remember
set ttimeoutlen=50                          "Speed up O etc in the Terminal
set autoread                                "Set to auto read when a file is changed from the outside
set bs=2                                    "allow backspace
set scrolloff=6                             "start scrolling 5 lines before edge of viewport
set pastetoggle=<f10>                       "Better paste behavior
autocmd! bufwritepost vimrc source ~/.vimrc "When vimrc is edited, reload it

"Search Options
set ignorecase "Ignore case when searching
set incsearch  "Make search act like search in modern browsers
set magic      "Set magic on, for regular expressions

"Enable filetype plugin
filetype plugin on
filetype indent on
filetype on
syntax enable

"Turn backup off
set nobackup
set nowb
set noswapfile

"Stop beeping at me bro
set noerrorbells 
set vb 
set t_vb="."

"Enable mouse support in xterm 
set mouse=a

"Load Project specific .vimrc 
set exrc   "enable per-directory .vimrc files
set secure "disable unsafe commands in local .vimrc files
