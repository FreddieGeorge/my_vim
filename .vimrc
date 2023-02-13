"All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" close compatible
set nocompatible

" open highlight
syntax on
" ==================== vim 原生设置 ====================
set showcmd

set showmode

set encoding=utf-8

set t_Co=256

set tabstop=4
set autoindent
set shiftwidth=4
set expandtab
set softtabstop=4

" preference
set number

" search
set showmatch
set hlsearch

colorscheme pablo

" 设置上下滚动保留行数为5
set scrolloff=5

" 显示状态栏
set laststatus=2

" 禁止创建交换文件
set noswapfile

" 设置自动切换目录
set autochdir

" 显示光标位置
set ruler

" true color
set termguicolors

" ====================== vundle 设置开始 ================
" 必须设置
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'   " 主题
Plugin 'scrooloose/nerdtree'                " 目录树
Plugin 'vim-airline/vim-airline'            " 状态栏优化
Plugin 'Valloric/YouCompleteMe'             " code completion
Plugin 'majutsushi/tagbar'                  " 侧边结构

call vundle#end()




" =========== solarized ==========
let g:solarized_termtrans = 1 " use terminal background
let g:solarized_visibility = "high"

if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized


" ============ nerdtree ============
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" " Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=30
let NERDTreeWinPos="right"

"============= vim-airline ============
let g:airline_powerline_fonts=1


filetype plugin indent on


"============= YouCompleteMe ============

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
 
let g:ycm_min_num_of_chars_for_completion = 2 " 输入第 2 个字符开始补全
let g:ycm_seed_identifiers_with_syntax = 1 " 语法关键字补全
 
let g:ycm_complete_in_comments = 1 " 在注释中也可以补全
let g:ycm_complete_in_strings = 1 " 在字符串输入中也能补全
 
let g:ycm_collect_identifiers_from_tag_files = 1 " 使用 ctags 生成的 tags 文件
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
 
let g:ycm_cache_omnifunc = 0 " 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_use_ultisnips_completer = 0 " 不查询 ultisnips 提供的代码模板补全，如果需要，设置成 1 即可
 
let g:ycm_show_diagnostics_ui = 0 " 禁用语法检查
let g:ycm_key_list_select_completion = ['<Down>'] " 选择下一条补全，Default: ['<TAB>', '<Down>']
 
let g:ycm_key_list_previous_completion = ['<Up>'] " 选择上一条补全，Default: ['<S-TAB>', '<Up>']
let g:ycm_key_list_stop_completion = ['<Enter>'] " 中止此次补全，Default: ['<C-y>']



"============= tagbar =============
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left=1
nmap <F3> :TagbarToggle<CR>
