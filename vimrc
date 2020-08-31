" Incompatible vi 
set nocompatible
filetype plugin indent on   " Load plugins according to detected filetype.
filetype on                 " 开启文件类型侦测
filetype indent on          " 自适应不同语言的智能缩进
set backspace=indent,eol,start

syntax enable               " Enable syntax highlighting. 
syntax on                   " 允许使用指定语法高亮配色方案代替默认方案


set shortmess=a
set cmdheight=2

set autoindent              " Indent according to previous line.
set expandtab               " Use space instead of tabs.
set softtabstop =4          " Tab key intents by 4 spaces.
set tabstop =4             " 设置编辑时制表符占用空格数
set shiftwidth =4          " 设置格式化时制表符占用空格数

set hidden                  " Switch between buffers without having to save expert.
set laststatus =2           " Always show statusline.
set display =lastline       " Show as much as possible of the last line.
"set showmode                " Show current mode in command-line
set noshowmode              " 关闭模式提示
set showcmd                 " Show already typed keys when more are expected.

set incsearch               " Highlight while searching with / or ?.
set hlsearch                " Keep matches highlighted.

set nowrap                  " No wrap.

set showmatch               " 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set ignorecase              " Ignore case.
set smartcase               "      

set nobackup                " No backup.
set autochdir               " Automatically switch working directory.

set number                  " Display line number.

set wildmenu                " vim 自身命令行模式智能补全
"set cursorline              " 高亮当前行
"set cursorcolumn            " 高亮当前列

"set foldmethod=indent       " 基于缩进或语法进行代码折叠
set foldmethod=syntax       " 基于缩进或语法进行代码折叠
set nofoldenable            " 启动vim时关闭折叠代码 


"------------- 快捷键定义------------------------
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" ESC
inoremap jk <ESC>
" 定义快捷键到行首
nmap LB ^
"定义快捷键到行尾
nmap LE $
" 定义快捷键保存所有窗口内容
nmap <Leader>w :w<CR>       
" 定义快捷键保存所有窗口内容并退出vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 不做任何保存，直接退出vim

" 窗口相关操作
" ===
"

" 往右分屏 
map <Leader>sl :set splitright<CR>:vsplit<CR>
" 往左分屏 
map <Leader>sh :set splitright<CR>:vsplit<CR>
" 往上分屏
map <Leader>sk :set nosplitbelow<CR>:split<CR>
" 往下分屏
map <Leader>sj :set splitbelow<CR>:split<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

nmap <Leader>Q :qa!<CR>
" 依次遍历窗口 / 查询时会按n会延时，所以取消不用
"nnoremap nw <C-W><C-W>
"跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nnoremap <Leader>m %
" 跳转下一个Buffer
nmap <Leader>bn :bn<CR>
" 跳转上一个Buffer
nmap <Leader>bp :bp<CR>
" 关闭Buffer
nmap <Leader>bd :bd<CR>
" 将world转换成大写
imap <C-u> <ESC>viwUA
" 打开vimrc文件
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
" source vimrc文件
nnoremap <leader>sv :source $MYVIMRC<CR>
" 将word 添加双引号
nnoremap <leader>" :viw<ESC>a"<ESC>bi"<ESC>lel

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>

nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

nnoremap <leader>jh :YcmCompleter GoToInclude<CR>


map s <Nop>
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 让配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC 



"----------------- Plugin-------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'skywind3000/asyncrun.vim' " 编译运行
Plug 'dense-analysis/ale'       " 动态检查
Plug 'ycm-core/YouCompleteMe'   " 代码补全
Plug 'Yggdroot/LeaderF'         " 函数列表
Plug 'Shougo/echodoc.vim'       " 参数提示
Plug 'vim-airline/vim-airline'  " 状态栏
Plug 'scrooloose/nerdtree'      " 目录树
Plug 'octol/vim-cpp-enhanced-highlight' " 语法高亮
"Plug 'vim-scripts/a.vim'        " .h/.cpp切换
Plug 'jiangmiao/auto-pairs'     " 括号补全
Plug 'universal-ctags/ctags'   " ctags
Plug 'ludovicchabant/vim-gutentags' " 自动生成tag
"Plug 'grailbio/bazel-compilation-database' " 自动配置.ycm_extra_conf.py
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} "markdown
Plug 'dhruvasagar/vim-table-mode' " markdown table mode
call plug#end()
"---------------------------------------------------------

" vim-gutentags configuration

let g:gutentags_enabled = 1
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
"if executable('gtags-cscope') && executable('gtags')
"	let g:gutentags_modules += ['gtags_cscope']
"endif
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" Don't load me if there's no ctags file
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"------------------------------------------------------------------
" 配置asyncrun
" 自动打开quickfix window, 高度为6
let g:asyncrun_open = 6
" 设置F10打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"---------------------------------------------------------------

" 配置ale

let g:ale_linters = {
\   'cpp': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 200
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magent

" 配置YCM 
" 每次在.vimrc 更改YCM配置都要重新启动YCM :YcmRestartServer

let g:ycm_use_clangd = 0

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1


let g:ycm_register_as_syntastic_checker=0

" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>x <C-x><C-o>
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全			
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
" 限制补全菜单选项最小字符数
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_min_num_of_chars_for_completiom = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone


let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \   'cs,lua,javascript': ['re!\w{2}'],
  \ }

"---------------------------
" 配置LeaderF

"let g:Lf_ShortcutF = '<c-p>'
"let g:Lf_ShortcutB = '<c-n>'
nnoremap <leader>ll :LeaderfMru<cr>
nnoremap <leader>lp :LeaderfFunction!<cr>
nnoremap <leader>lb :LeaderfBuffer<cr>
nnoremap <leader>lt :LeaderfTag<cr>
nnoremap <leader>lf :LeaderfFile<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
"-----------------------------------------------------

"-----------------------------------------------------
" NERDTree 
" 常用操作：回车，打开选中文件；
" r，刷新工程目录文件列表；I（大写），显示/隐藏隐藏文件；
" m，出现创建/删除/剪切/拷贝操作列表


"-----------------------------------------------------

"----------------------------------------------------
" 配置 gtags 的参数
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'


"------------------------------------------------------
" 配置echodoc
let g:echodoc_enable_at_startup = 1

"-----------------------------------------------------
" 配置airline
let g:airline#extensions#tabline#enabled = 1


