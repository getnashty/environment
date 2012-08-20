et nocompatible               
filetype off                   

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 Bundle 'altercation/vim-colors-solarized.git'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'

 " Color Scheme stuffs
 set background=dark
 let g:solarized_termtrans=1
 let g:solarized_termcolors=256
 let g:solarized_contrast="high"
 let g:solarized_visibility="high"
 colorscheme solarized

 "Syntastic
 let g:syntastic_enable_signs=1
 let g:syntastic_auto_loc_list=1

 "Nerd tree
 nnoremap <leader>n :NERDTreeToggle<cr>

 "IDE STUFF
 set number
 set cul
 hi CursorLine term=none cterm=none ctermbg=3

 "Swoop
 "set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

 "Softtabs, 2 spaces
 set tabstop=2
 set shiftwidth=2
 set expandtab

 " When vimrc is edited, reload it
 autocmd! bufwritepost vimrc source ~/.vimrc

 filetype plugin indent on     " required!


