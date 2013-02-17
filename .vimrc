set nocompatible " viとの互換なし

" neobundle.vimで管理してるpluginを読み込む
filetype off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"install :NeoBundleInstall
"update  :NeoBundleInstall!
"remove  :NeoBundleClean

" color schema
NeoBundle 'tomasr/molokai'
NeoBundle 'desert256.vim'

" Align : 高機能整形・桁揃えプラグイン
NeoBundle 'Align'

" ステータスラインをリッチにする
NeoBundle 'Lokaltog/vim-powerline'

" vimproc : vimから非同期実行。vimshelleで必要
NeoBundle 'Shougo/vimproc.git'

" neocomplcacheのsinpet補完
NeoBundle 'Shougo/neosnippet'

" grep.vim : 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
NeoBundle 'grep.vim'

" vimの正規表現をrubyやperlの正規表現な入力でできる
NeoBundle 'eregex.vim'

" quickrun.vim : 編集中のファイルを簡単に実行できるプラグイン
NeoBundle 'thinca/vim-quickrun'

" Ruby
" vim-ruby : VimでRubyを扱う際の最も基本的な拡張機能
NeoBundle 'vim-ruby/vim-ruby'
" rails.vim
NeoBundle 'tpope/vim-rails'

" NERDTree : ツリー型エクスプローラ
NeoBundle 'The-NERD-tree'

" minibufexpl.vim : タブエディタ風にバッファ管理ウィンドウを表示
NeoBundle 'minibufexpl.vim'

" coffee script
NeoBundle 'kchmck/vim-coffee-script'

" vimshell
"NeoBundle 'Shougo/vimshell.git'

" surround.vim : テキストを括弧で囲む／削除する
"NeoBundle 'tpope/surround.vim'

filetype on
filetype plugin on
filetype indent on

" matchit.vim
source $VIMRUNTIME/macros/matchit.vim

" colorscheme
colorscheme molokai

" clipboard
set clipboard=unnamed

" encoding settings
set encoding=utf-8 " デフォルトエンコーディング
set fileformats=unix,dos,mac " 改行コード

" basic
syntax on
let mapleader="," " キーマップリーダー
set vb t_vb= " ビープ音を鳴らさない
set backspace=indent,eol,start "バックスペースキーで削除できるものを指定
set title " タイトルを表示する
set ruler " ルーラーを表示
set laststatus=2 " 常にステータラスラインを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " ステータスラインに表示する情報の指定
set showcmd " コマンドをステータスラインに表示
set number " 行番号表示
set list " 不可視文字表示
set listchars=tab:>\ ,extends:<
set hidden " 編集中でも他のファイルを開けるようにする
set autoread " 自動読み直し
set browsedir=buffer " 初期ディレクトリ
set scrolloff=5 " スクロール時の余白確保
set textwidth=0 " 自動で折り返しをしない
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末を超えて行えるように
set modelines=0 " モードラインは無効
set nobackup " バックアップなし
set noswapfile " スワップファイルを作らない
set showmatch " 対応する括弧をハイライト
set matchtime=2 " 対応する括弧の表示時間を2にする
set virtualedit+=block " 矩形選択で自由に移動する
autocmd BufWritePre * :%s/\s\+$//ge " 保存時に行末の空白を除去する

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

" complete
set wildmenu " コマンド補完を強化
set wildchar=<tab> " コマンド補完開始キー
set wildmode=list:longest " リスト表示
set history=1000 " コマンド・検索パターン履歴数
set complete+=k " 補完に辞書ファイル追加

" search
set wrapscan " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase " 大文字は区別する
set hlsearch " 検索文字をハイライト
set incsearch " インクリメンタルサーチ
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" indent
set smartindent " 新しい行のインデントを現在行と同じ数に
set autoindent " 自動でインデント
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set expandtab
"set noexpandtab " タブをスペースに展開しない
"set formatoptions=lmoq " テキスト整形オプション，マルチバイト系を追加
autocmd FileType * set formatoptions-=ro
"set cindent

autocmd BufNewFile,BufRead *.html  setlocal ft=xhtml
autocmd BufNewFile,BufRead *.scss  setlocal ft=scss
autocmd BufRead,BufNewFile *.coffee setlocal ft=coffee

autocmd FileType php        setlocal ts=2 sw=2 sts=2 noexpandtab
autocmd FileType c          setlocal ts=4 sw=4 noexpandtab cindent
autocmd FileType java       setlocal ts=4 sw=4 sts=4 et
autocmd FileType sh         setlocal ts=4 sw=4 sts=4 et
autocmd FileType sql        setlocal ts=4 sw=4 sts=4 et
autocmd FileType xhtml      setlocal ts=4 sw=4 sts=4 et
autocmd FileType css        setlocal ts=2 sw=2 sts=2 et
autocmd FileType scss       setlocal ts=2 sw=2 sts=2 et
autocmd FileType javascript setlocal ts=2 sw=2 sts=2
autocmd FileType ruby       setlocal ts=2 sw=2 tw=0 et nowrap
autocmd FileType eruby      setlocal ts=2 sw=2 tw=0 et nowrap
autocmd FileType coffee     setlocal ts=2 sw=2 tw=0 et nowrap

"autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

autocmd BufNewFile,BufRead app/*/*.rhtml  setlocal ft=mason fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.rb    setlocal ft=ruby  fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.yml   setlocal ft=ruby  fenc=utf-8

" php setting
let php_sql_query = 1 " SQLをハイライトする
let php_htmlInStrings = 1 " HTMLをハイライト
let php_noShortTags = 1 " ショートタグ「< ?」はハイライトしないようにする
"let php_folding = 1 " クラスと関数の折りたたむ

" format json
" http://wozozo.hatenablog.com/entry/2012/02/08/121504
map <Leader>j !python -m json.tool<CR>

" 0, 9で行頭、行末へ
nmap 0 ^
nmap 9 $

" buffer
noremap <Space> :bn!<CR>
noremap <S-Space> :bp!<CR>

" window
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

" height
nnoremap + <C-w>+
nnoremap - <C-w>-
" width
nnoremap ) <C-w>>
nnoremap ( <C-w><LT>

" ウィンドウレイアウトを崩さないでバッファを閉じる
:com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

"------------------------------------
" Align
"------------------------------------
" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

"------------------------------------
" NERDTree
"------------------------------------
" NERDのトグルをキーマップ
nnoremap <f12> :NERDTreeToggle<CR>

"------------------------------------
" neosnippet
"------------------------------------
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/dotfiles/.vim/snippets'

" ------------------------------------
" grep.vim
"------------------------------------
" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git'
let Grep_Skip_Files = '*.bak *~'

"------------------------------------
" MiniBufExplorer
"------------------------------------
" 表示トグル
nnoremap mbe :TMiniBufExplorer<CR>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1

"------------------------------------
" quickrun.vim
"------------------------------------
" 初期化
let g:quickrun_config = {}
" runnerにvimprocを設定
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config._ = {'runner/vimproc/updatetime' : 100}
" 横分割をするようにする
let g:quickrun_config={'*': {'split': ''}}
" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright

" PHPUnit
augroup PHPUnitQuickRun
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=phpunit
augroup END

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter/buffer/split'] = 'vertical 35'
let g:quickrun_config['phpunit']['command'] = 'phpunit'
let g:quickrun_config['phpunit']['cmdopt'] = ''
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
let g:quickrun_config['phpunit']['output_filetype'] = 'phpunit-result'

" RSpec
let g:quickrun_config['rspec'] = {}
let g:quickrun_config['rspec']['outputter/buffer/split'] = 'vertical 35'
"let g:quickrun_config['rspec']['output_filetype'] = 'rspec-result'

" bundleを利用する設定(railsで実行)
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': 'bundle exec %c %s',
  \ 'outputter/buffer/filetype': 'rspec-result'
  \}

" 通常の設定(rubyで実行)
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': '%c %s',
  \ 'outputter/buffer/filetype': 'rspec-result'
  \}

function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

" CoffeeScript
"let g:quickrun_config.coffee = {'command': 'coffee'}
