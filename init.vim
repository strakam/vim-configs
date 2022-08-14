call plug#begin('~/.config/nvim/plugged')
	" Plug 'neoclide/coc-references'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'itchyny/lightline.vim'
    " Plug 'dense-analysis/ale'
    Plug 'lervag/vimtex'
    Plug 'SirVer/ultisnips'
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
" Slowly but surely
lua require('cfg.options')
lua require('plugins')
lua require('treesitter')
lua require('lsp')
lua require('cfg.keymaps')
"{{{ Small bindings
" Custom keybindings for SK chars
autocmd FileType * so ~/.config/nvim/deadkeys.vim
nnoremap <Leader>d :call ToggleDeadKeys()<CR>
inoremap <Leader>d <ESC>:call ToggleDeadKeys()<CR>a

" Floaterm
command! LF FloatermNew lf
nnoremap <leader>r :LF<cr>

nnoremap <leader>t :FloatermNew<cr>
nnoremap <leader>st :FloatermShow<cr>
nnoremap <leader>nt :FloatermNext<cr>

" Copy paste
noremap <leader>y "+y
noremap <leader>p "+p

"UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"
nnoremap :use :UltiSnipsEdit<CR>

"No highlight
nnoremap <leader><Space> :noh<CR>

"Tabularize"
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a- :Tabularize -=<CR>
vmap <Leader>a- :Tabularize -=<CR>
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
