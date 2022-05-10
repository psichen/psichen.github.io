call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'md'}
Plug 'lervag/vimtex'
"Plug 'voldikss/vim-mma'

call plug#end()

" :PlugInstall
" :PlugUpdate
" :PlugUpgrade
" :PlugClean

" User custom
colorscheme gruvbox
let mapleader = " "
set nu rnu
set tabstop=4
set expandtab
set nojoinspaces
set ignorecase
set smartcase
set scrolloff=3
set sidescrolloff=5
set noswapfile
set nobackup
set autowrite
set conceallevel=2
set foldmethod=indent
hi clear conceal

nmap <Leader>1 "1p
nmap <Leader>2 "2p
nmap <Leader>3 "3p
nmap <Leader>4 "4p
nmap <Leader>5 "5p
nmap <Leader>6 "6p
nmap <Leader>7 "7p
nmap <Leader>8 "8p
nmap <Leader>9 "9p
nmap <Leader>0 "0p

nnoremap <c-m-z> <nop>
vnoremap <c-m-z> <nop>
inoremap <c-m-z> <nop>

set hlsearch
nnoremap <c-j> 20j
nnoremap <c-k> 20k
vnoremap <c-j> 20j
vnoremap <c-k> 20k
inoremap <c-j> 20j
inoremap <c-k> 20k
nnoremap <silent> <leader>s :set spell<cr>
nnoremap <silent> <leader><cr> :noh<cr>:set nospell<cr>

map <Leader>r :call CompileRun()<CR>

func! CompileRun()
        exec "w"
if &filetype == 'wls'
        exec "!wolframscript -print -f %"
elseif &filetype == 'python'
        exec "!python3 %"
endif
endfunc

"  NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers = 1

" markdown-preview.nvim
let g:mkdp_refresh_slow=1
let g:mkdp_command_global=0
nmap <Leader>p <Plug>MarkdownPreview

" vim-instant-markdown
let g:instant_markdown_autostart = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
let g:instant_markdown_autoscroll = 0
nmap <Leader><Leader>p :InstantMarkdownPreview<CR>

" vim-markdown
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1

" Vista
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["▸", ""]
noremap <Leader>v :Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

" Rainbow Parentheses Improved
let g:rainbow_active = 1

" auto-pairs
let g:AutoPairsFlyMode = 0

" tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a\| :Tabularize /\|<CR>
vmap <Leader>a\| :Tabularize /\|<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" vim-surround
nmap <Leader>" yst)"

" tex-conceal.vim
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_conceal="adbgm"

" vimtex
map <leader>l :VimtexCompile<CR>
"let g:vimtex_view_method='skim'
let g:vimtex_quickfix_ignore_filters=0

" LeaderF
let g:Lf_WindowPosition='popup'
let g:Lf_PreviewInPopup=1

" vim-mma
"let g:mma_candy = 1
nnoremap <c-j> 10j
nnoremap <c-k> 10k
