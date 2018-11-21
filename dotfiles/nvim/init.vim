"
" dein
"
if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein/plugins')
  let g:dein#install_process_timeout =  600

  call dein#begin('~/.config/nvim/dein/plugins')
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/deoplete.nvim')
  " call dein#add('prabirshrestha/asyncomplete.vim')
  " call dein#add('prabirshrestha/async.vim')
  " call dein#add('prabirshrestha/vim-lsp')
  " call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('hashivim/vim-hashicorp-tools')
  call dein#add('fatih/vim-go', {'hook_post_update': 'GoUpdateBinaries'})
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('w0rp/ale')
  call dein#add('jmcantrell/vim-virtualenv')
  call dein#add('bfredl/nvim-miniyank')
  call dein#add('tpope/vim-commentary')
  call dein#add('Yggdroot/indentLine')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('mattn/gist-vim')
  call dein#add('junegunn/fzf.vim')
  call dein#add('/usr/local/opt/fzf')
  call dein#add('scrooloose/nerdtree')
  call dein#add('posva/vim-vue')
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('ambv/black')

  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

"
" global
"
language en_US
set number
set spell
set hidden
set showmode
set showcmd
set ignorecase
set smartcase
set list
set history=1000
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set undodir=~/.config/nvim/backups
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=100

let mapleader = ","
nmap <C-p> :Files<CR>
nmap <C-i> :Buffers<CR>
nmap <C-c> :Commits<CR>
nmap <C-g> :Gbrowse<CR>
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1 " Close NERDTree when open a node.

"
" terminal emulator
"
tnoremap <silent> <ESC> <C-\><C-n>

"
" vim-colors-solarized
"
syntax enable
set background=dark
colorscheme solarized

"
" indentLine
"

autocmd Filetype json let g:indentLine_enabled = 0 " Ref. https://github.com/Yggdroot/indentLine/issues/172
autocmd Filetype yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Ref. https://github.com/Yggdroot/indentLine/issues/210#issuecomment-405104437
set list lcs=tab:\¦\ " Workaround for tab

"
" vim-terraform
"
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1

"
" ale
"
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'python': ['mypy'],
\   'yaml': ['yamllint'],
\   'vim': ['vint'],
\   'go': ['gometalinter', 'go build']
\}
let g:ale_fixers = {
\ 'python':     ['remove_trailing_lines', 'trim_whitespace'],
\ 'bash':       ['remove_trailing_lines', 'trim_whitespace'],
\ 'docker':     ['remove_trailing_lines', 'trim_whitespace'],
\ 'html':       ['remove_trailing_lines', 'trim_whitespace'],
\ 'json':       ['remove_trailing_lines', 'trim_whitespace'],
\ 'markdown':   ['remove_trailing_lines', 'trim_whitespace'],
\ 'php':        ['remove_trailing_lines', 'trim_whitespace'],
\ 'ruby':       ['remove_trailing_lines', 'trim_whitespace'],
\ 'yaml':       ['remove_trailing_lines', 'trim_whitespace'],
\ 'vim':        ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_go_gometalinter_options = '
   \ --aggregate
   \ --disable=gas
   \ --disable=gotype
   \ --enable=test
   \ --enable=golint
   \ --enable=errcheck
   \ --enable=vet
   \ --enable=goimports
   \ --sort=line
   \ --fast
   \ --tests
   \ --vendor
   \ '

"
" black
"
autocmd BufWritePre *.py execute ':Black'


"
" Save the last cursor postion
"
autocmd BufReadPost *
  \ if line("'\"") > 1 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

"
" Workaround of X11 clipboard for neovim. See https://github.com/neovim/neovim/issues/1822#issuecomment-233152833
"
set clipboard=unnamed
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

"
" vim-go: https://github.com/fatih/vim-go-tutorial
" See ':help go-settings'
" See ':help go-commands'
"
" NOTE: Run ':GoUpdateBinaries' if you got an error on ':GoDef' or ':GoDoc'
"
" NOTES:
" 'ctrl-]' -> ':GoDef'
" 'ctrl-t' -> ':GoDefPop'
" 'K'      -> ':GoDoc'
" ']]'     -> jump to next function
" '[['     -> jump to previous function
"
autocmd FileType go set autowrite
let g:go_fmt_command = "goimports"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <C-n> :cnext<CR>
autocmd FileType go nmap <C-m> :cprevious<CR>
autocmd FileType go nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"
" deoplete.nvim
"
let g:deoplete#enable_at_startup = 1
" Path to python interpreter for neovim
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog  = '/usr/local/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

"
" deoplete-go
" " NOTE: Run ':GoUpdateBinaries' and 'gocode close' if you got an error
"

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
