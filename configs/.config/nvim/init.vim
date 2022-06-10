set mouse=a
set nowrap
set nu

nmap <C-P> :FZF<CR>
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'mg979/vim-visual-multi'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'yggdroot/indentline'
" Themes
Plug 'nlknguyen/papercolor-theme'
Plug 'romainl/apprentice'
Plug 'sainnhe/sonokai'
call plug#end()

set background=dark
colorscheme PaperColor
