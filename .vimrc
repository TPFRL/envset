"" Specify a directory for plugins
"" - For Neovim: ~/.local/share/nvim/plugged
"" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
"
"" Make sure you use single quotes
"
"" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"
Plug 'scrooloose/nerdtree'
"Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/taglist.vim'
Plug 'wesleyche/SrcExpl'
Plug 'Chiel92/vim-autoformat'
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'
Plug 'tczengming/headerGatesAdd.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"" the relevant modules (add to plug-section if you already have one)
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'
"" Fast python completion (use ncm2 if you want type info or snippet support)
"Plug 'HansPinckaers/ncm2-jedi'
"" Words in buffer completion
"Plug 'ncm2/ncm2-bufword'
"" Filepath completion
"Plug 'ncm2/ncm2-path'

" ncm2 settings
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"" Any valid git URL is allowed

"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
"
"" Initialize plugin system
call plug#end()
" HeaderGatesAdd plugin
nmap <F4> :HeaderGatesAdd<CR>
let g:HeaderGatesAdd_prefix="__"
let g:HeaderGatesAdd_extern_c=1

" Autoformat plugin
nmap <F3> :Autoformat<CR>
" nerdtree plugin 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeWinPos="left"
nmap <F8> :NERDTreeToggle<CR>
nmap <F7> :TlistToggle<CR>

" SrcExpl plugin
nmap <F9> :SrcExplToggle<CR>
let g:SrcExpl_winHeight = 8 " Set the height of Source Explorer window
let g:SrcExpl_refreshTime = 100 " Set time for refreshing the SrcExpl
let g:SrcExpl_jumpKey = "<ENTER>" " Set key to jump into the exact definition context
let g:SrcExpl_gobackKey = "<SPACE>" " Set key for back from the definition context
" // In order to avoid conflicts, the Source Explorer should know what plugins except
" // itself are using buffers. And you need add their buffer names into below list
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]
" // The color schemes used by Source Explorer. There are five color schemes
" // supported for now - Red, Cyan, Green, Yellow and Magenta. Source Explorer
" // will pick up one of them randomly when initialization.
let g:SrcExpl_colorSchemeList = [
        \ "Red",
        \ "Cyan",
        \ "Green",
        \ "Yellow",
        \ "Magenta"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1
" // Workaround for Vim bug @https://goo.gl/TLPK4K as any plugins using autocmd for
" // BufReadPre might have conflicts with Source Explorer. e.g. YCM, Syntastic etc.
let g:SrcExpl_nestedAutoCmd = 1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey = "<F12>" " Set key for updating the tags file artificially
let g:SrcExpl_prevDefKey = "<F10>" " Set key for displaying the previous definition in the jump list
let g:SrcExpl_nextDefKey = "<F11>"

" 찾기 옵션
"set ignorecase " 대소문자 무시 검색
"set smartcase " 대문자가 검색 문자열에 있을 때는 ignorecase 안 함
set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set splitbelow

nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
set smartindent
set autoindent " 자동 들여쓰기
set cindent " C언어 자동 들여쓰기
set expandtab " tab을 space로 저장
set sta " <BS>로 스페이스 인덴트를 지울 때 탭 단위 삭제

set ts=4
set sts=4
set sw=4

" 커서 위치 옵션
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" 화면 보이기 옵션
" Syntax Highlighting
"if has("syntax")
"    syntax on
"endif
"set cul " 커서가 있는 라인 하이라이트
set lz " macro 진행 중에 화면 갱신 안 함
set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%t\ %F\
set ru " 커서 위치 정보를 상태 라인에 보여주기
set scrolloff=4 " 커서 위 10줄 항상 보이기
"set sm " 짝이 맞는 괄호에 하이라이팅
" line number 커서 위치 상대값으로 보여주기 
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
set history=300 " 명령어 히스토리 숫자

nmap <S-l> :tabn<CR>
nmap <S-h> :tabp<CR>
"set tags=/home/caplab/tensorrt/tags
set tags +=./tags,tags;
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ale_cpp_gcc_options = "-std=c++14 -Wall -I~/tensorrt/samples/common -I/usr/local/cuda/include"
"let g:ale_cpp_parse_makefile = 1
hi Search ctermbg=White ctermfg=Black

set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"

"fzf관련
nmap <C-p> :Files<Cr>
nmap <C-g> :Ag<Cr>
