call plug#begin('~/.config/nvim/plugged')
    Plug 'lervag/vimtex'
    "Themes
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    "Tpope
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
call plug#end()
" Slowly but surely
lua require('cfg.options')
lua require('plugins')
lua require('treesitter')
lua require('lsp')
lua require('cfg.keymaps')
lua require('cfg.colorscheme')
lua require('cfg.lualine')
lua require('cfg.toggleterm')

" Custom keybindings for SK chars
autocmd FileType * so ~/.config/nvim/deadkeys.vim
nnoremap <Leader>d :call ToggleDeadKeys()<CR>
inoremap <Leader>d <ESC>:call ToggleDeadK:ys()<CR>a

" configure nvcode-color-schemes
let g:nvcode_termcolors=256
"colorscheme snazzy " nvcode, onedark, nord, aurora, gruvbox, palenight, snazzy

"Python virtualenv
let g:python3_host_prog='/usr/bin/python3'
" Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
