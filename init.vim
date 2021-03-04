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
    Plug 'itchyny/lightline.vim'
    " Window management
    Plug 'spolu/dwm.vim'
    "Linting and completion
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'dense-analysis/ale'
    Plug 'neovim/nvim-lspconfig'
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
"{{{ Small bindings
" Custom keybindings for SK chars
autocmd FileType * so ~/.vim/deadkeys.vim
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
lua require('treesitter')

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
"{{{ Conquer of Completion
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=80

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Ue <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>s
"}}}
