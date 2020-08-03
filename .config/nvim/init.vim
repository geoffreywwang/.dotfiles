" ********** vim-plug **********
" ==============================
" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugins
call plug#begin('~/.config/nvim/plugins')
    Plug 'kaicataldo/material.vim'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/lightline.vim'
"    Plug 'junegunn/fzf.vim'
"    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Auto-install missing plugins
autocmd VimEnter *
    \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|      PlugInstall --sync | q | source $MYVIMRC | call LightlineReload()
    \|  endif

" ********** General Settings **********
" ======================================
silent! colorscheme material
let g:lightline = {'colorscheme': 'material_vim'}
let g:material_terminal_italics = 1

syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent
set number relativenumber
set nowrap
set smartcase
set incsearch
set noswapfile
set nobackup
set noshowmode
set updatetime=300
set scrolloff=999

" Set up undo-dir
set undodir=~/.config/nvim/undo-dir
set undofile

" Set color bar on the right
set colorcolumn=80
highlight ColorColumn ctermbg=237 guibg=None

" ********** Remaps and Useful Functions **********
" =================================================
" Remap leader key to <SPACE>
map <Space> <leader>

" Edit and source config files
nnoremap <leader>eb :e ~/.bashrc<CR>
nnoremap <leader>sb :source ~/.bashrc<CR>
nnoremap <leader>ea :e ~/.config/alacritty/alacritty.yml<CR>
nnoremap <leader>sa :source ~/.bashrc<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ec :e ~/.config/nvim/coc-settings.json<CR>
nnoremap <leader>sc :source ~/.config/nvim/coc-settings.json<CR>
nnoremap <leader>et :e ~/.tmux.conf<CR>
nnoremap <leader>st :source ~/.tmux.conf<CR>

" Stop highlighting with <leader><Esc>
nnoremap <silent> <leader><Esc> :noh<cr>

" Toggle scrolloff with <leader>zz
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" fzf Remaps
nnoremap <leader>ff :Files!<CR>
nnoremap <leader>fl :BLines!<CR>

" Function to reload lightline
function! LightlineReload()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

" Coc Configuration
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <S-tab> to navigate to the previous complete item
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Select first completion item and confirm
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Esc to close completion menu
inoremap <silent><expr> <Esc> pumvisible() ? "\<C-y>" : "\<Esc>"

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Folding for python
" au BufNewFile,BufRead *.py set foldmethod=indent
nnoremap <leader>f za
