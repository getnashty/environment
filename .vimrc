set nocompatible               
filetype off                   

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-rails'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-surround'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'

let g:neocomplcache_enable_cursor_hold_i = 1
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

"snippet settings
imap <C-k> <Plug>(neocomplcache_snippets_expand) 
smap <C-k> <Plug>(neocomplcache_snippets_expand) 
" For snippet_complete marker. 
if has('conceal') 
  set conceallevel=2 concealcursor=i 
endif


imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
 \ "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

set hlsearch "Highlight search things

" Color Scheme stuffs
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

"Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1 

"Nerd tree
nnoremap <leader>n :NERDTreeToggle<cr>

"IDE STUFF
set number
set cul
hi CursorLine term=none cterm=none ctermbg=3

"Swoop
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"Softtabs, 2 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Autocomplete
"" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
autocmd FileType css set textwidth=79
" JavaScript (tab width 2 chr, wrap at 79th)
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79
" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0

"Omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"mini buf stuff
let g:miniBufExplCloseOnSelect = 0 

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

filetype plugin indent on     " required!

"JSON File Stuff
au BufNewFile,BufRead *.json set filetype=json
"Pretty Print JSON files using python simplejson
":command PrettyJSON :'<,'>!python -m simplejson.tool
function! PrettyJSON()
  :%!python -m simplejson.tool
  set filetype=json
endfunction
:command PrettyJSON :call PrettyJSON()

au VimEnter *  NERDTree