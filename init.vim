:set number
:set relativenumber
:syntax enable
:set smarttab
:set scrolloff=7
:set mouse=a

"Python specific settings"
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab
:set autoindent
:set fileformat=unix



call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/dracula/vim'
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/deoplete-plugins/deoplete-jedi'
Plug 'https://github.com/davidhalter/jedi-vim'
Plug 'https://github.com/neomake/neomake'

call plug#end()

call neomake#configure#automake('nrwi', 500)

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


let g:deoplete#enable_at_startup = 1
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:neomake_python_enabled_makers = ['pylint']

set background=dark
colorscheme dracula 

"NerdTree stuff
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Re-map the middle of line"
map gm :call cursor(0, virtcol('$')/2)<CR>
