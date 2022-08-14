"{{{ Basics
" General filetype plugin on
let mapleader=','
let localleader=','

set number			" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set textwidth=80	" Line wrap (number of cols)
set colorcolumn=80
set showmatch		" Highlight matching brace
set visualbell		" Use visual bell (no beeping)
set noshowmode		" Hidden --insert-- 
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
set foldmethod=indent " Braces to fold
set noswapfile


" Indentation 
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
" Advanced
set ruler		"Show row and column ruler information
"}}}
"{{{ Plug
call plug#begin('~/.config/nvim/plugged')
	" Plug 'neoclide/coc-references'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'itchyny/lightline.vim'
    " Window management
    Plug 'spolu/dwm.vim'
    "Linting and completion
    " Plug 'dense-analysis/ale'
    Plug 'lervag/vimtex'
    Plug 'SirVer/ultisnips'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "Themes
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    "Tpope
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'godlygeek/tabular'
    "Files
    Plug 'voldikss/vim-floaterm', { 'on':  ['FloatermNew'] }
    "Startup
    Plug 'mhinz/vim-startify'
    " Which
call plug#end()
"}}}
" Slowly but surely
lua require('plugins')
lua require('treesitter')
lua require('lsp')
"{{{ Small bindings
" Custom keybindings for SK chars
autocmd FileType * so ~/.config/nvim/deadkeys.vim
nnoremap <Leader>d :call ToggleDeadKeys()<CR>
inoremap <Leader>d <ESC>:call ToggleDeadKeys()<CR>a

"FZF
nnoremap <Leader><Leader>f :Files ~<CR>
command! -bang -nargs=? -complete=dir Files call fzf#vim#files('~', <bang>0)

" Folds
nnoremap <Space>f za

" Floaterm
command! LF FloatermNew lf
nnoremap <leader>r :LF<cr>

nnoremap <leader>t :FloatermNew<cr>
nnoremap <leader>st :FloatermShow<cr>
nnoremap <leader>nt :FloatermNext<cr>

autocmd Filetype cpp nnoremap <F5> :FloatermNew --autoclose=0 g++ % -o %< && ./%<<cr>

" Copy paste
noremap <leader>y "+y
noremap <leader>p "+p


" Brackets
inoremap {<CR> {<CR>}<ESC>O

"UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"
nnoremap :use :UltiSnipsEdit<CR>

"Source"
nnoremap <leader>s :so $MYVIMRC<CR>:call lightline#update()<CR>

"No highlight"
nnoremap <leader><Space> :noh<CR>

"Tabularize"
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a- :Tabularize -=<CR>
vmap <Leader>a- :Tabularize -=<CR>
"}}}
"{{{ Window management settings and bindings
" DWM 
nmap [r <Plug>DWMRotateCounterclockwise
nmap ]r <Plug>DWMRotateClockwise
augroup vimrc
    au!
    au VimEnter * unmap <C-j>
    au VimEnter * noremap <C-j> <C-w>w
augroup END
nmap <C-o> <C-n><C-j><C-Space>
nmap [h <C-w>+
nmap ]h <C-w>-
nmap <C-;> gt
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>

" Terminal bindings
tnoremap <C-h> <c-\><c-n><c-w>h
tnoremap <C-j> <c-\><c-n><c-w>j
tnoremap <C-k> <c-\><c-n><c-w>k
tnoremap <C-l> <c-\><c-n><c-w>l
tnoremap <esc> <c-\><c-n>

nmap <C-t> :terminal<CR>

"Buffers"
nnoremap <silent> [b :bprevious<CR> 
nnoremap <silent> ]b :bnext<CR> 
nnoremap <silent> [B :bfirst<CR> 
nnoremap <silent> ]B :blast<CR> 
nnoremap <silent> [n :next<CR> 
nnoremap <silent> ]n :prev<CR> 
"}}}
"{{{ Debug
autocmd Filetype cpp packadd termdebug
let g:termdebug_popup = 0
let g:termdebug_wide = 163
autocmd Filetype cpp map <Leader><Leader>c :! g++ -std=c++17 -g % -o %:r.out<CR>
autocmd Filetype cpp map <Leader><Leader>d :! g++ -std=c++17 -g % -o %:r.out<CR>:Termdebug <c-r>=getcwd()<CR>/%:r.out<CR>
autocmd Filetype cpp map \r :Run<CR>
autocmd Filetype cpp map \n :Over<CR>
autocmd Filetype cpp map s :Step<CR>
autocmd Filetype cpp map C :Continue<CR>
autocmd Filetype cpp map b :Break<CR>
autocmd Filetype cpp map \c :Clear<CR>
autocmd Filetype cpp map \f :Finish<CR>
autocmd Filetype cpp map \S :Stop<CR>
"}}}
"{{{ Colors
" configure treesitter

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on

colorscheme snazzy " nvcode, onedark, nord, aurora, gruvbox, palenight, snazzy

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
"}}}
"{{{ Startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_files_number = 6
nnoremap <Leader>S :Startify<cr>
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['Bookmarks']      },
    \ { 'type': 'files',     'header': ['Recent files']            },
    \ { 'type': 'dir',       'header': ['Current Directory '. getcwd()] },
    \ ]

let g:startify_bookmarks = [
    \ { 'i': '~/.config/nvim/init.vim' },
    \ { 'm': '~/Skola/CPP/main.cpp' },
    \ ]
"}}}
"{{{ Languages and ALE
"Python virtualenv
let g:python3_host_prog='/usr/bin/python3'
" Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" ALE
let g:ale_sign_error   = '>>'
let g:ale_sign_warning = '->'
"}}}
