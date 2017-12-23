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
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('hashivim/vim-hashicorp-tools')
  call dein#add('fatih/vim-go')
  call dein#add('w0rp/ale')
  call dein#add('jmcantrell/vim-virtualenv')
  call dein#add('bfredl/nvim-miniyank')
  call dein#add('tpope/vim-commentary')
  call dein#add('Yggdroot/indentLine')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('zchee/deoplete-jedi')

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

"
" vim-colors-solarized
"
syntax enable
set background=dark
colorscheme solarized

"
" deoplete.nvim
"
let g:deoplete#enable_at_startup = 1

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
 \  'vim': ['vint']
\}
let g:ale_fixers = {
\ 'python':     ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'autopep8', 'isort', 'yapf'],
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
