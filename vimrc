
""" Basic behavior
set number
set paste
set cursorline
set scrolloff=10
set wrap
set ruler
set mouse=a
set visualbell
nmap j gj
nmap k gk

""" Coloring and Highlighting
" colorscheme murphy
syntax enable
filetype plugin indent on
set background=dark
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

""" Tab settings
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent

""" Search settings
set incsearch
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>
