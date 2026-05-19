" Включение подсветки синтаксиса
syntax on

" Включение номеров строк
set number
set relativenumber

" Использование системного буфера обмена
set clipboard=unnamedplus

" Настройки поиска
set ignorecase
set smartcase

" Подсветка текущей строки
set cursorline

" Настройки прокрутки
set scrolloff=10
set sidescrolloff=20

" Отключение переноса строк
set nowrap

" Настройки табуляции и отступов
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set numberwidth=4
set smartindent
set autoindent
set breakindent

" Отключение резервного копирования и временных файлов
set nobackup
set noswapfile

" Уровень сокрытия
set conceallevel=0

" Кодировка файла
set fileencoding=utf-8

" Включение мыши
set mouse=a

" Настройки разделения окон
set splitbelow
set splitright

" Настройки времени ожидания
set timeoutlen=500
set updatetime=100

" Отключение сохранения истории отмены (undo)
set noundofile

" Настройки подсветки поиска
set hlsearch
set incsearch

" Установка лидера
let mapleader = ' '

" ============================================================
" Пользовательские маппинги
" ============================================================

" Центрирование экрана при перемещении
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap { {zz
nnoremap } }zz
nnoremap ( (zz
nnoremap ) )zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap G Gzz

" Отключение подсветки предыдущего поиска
nnoremap <Esc> :nohlsearch<CR>
nnoremap <C-c> :nohlsearch<CR>

" Отключение копирования удаленного/изменяемого текста в буфер обмена (черный регистр)
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" Перемещение фокуса между окнами
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Закрытие окна
nnoremap <C-q> <C-w>q

" Перемещение окна в новую вкладку
nnoremap <C-t> <C-w>T

" Двойной 'Esc' для выхода из терминального режима
tnoremap <Esc><Esc> <C-\><C-n>

" 'Ctrl + C' для выхода из режима вставки
inoremap <C-c> <Esc>

" Вертикальное и горизонтальное разделение окон
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Оставаться в режиме выделения при изменении отступа
vnoremap < <gv
vnoremap > >gv

" Создание новой вкладки
nnoremap <leader>n :tabnew<CR>

" Переключение вкладок
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>

" Удаление символа в режиме вставки
inoremap <C-l> <Del>

" Перемещение выделенного текста вниз/вверх
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Поиск и замена слова под курсором
nnoremap ? :%s/\<<C-r><C-w>\>/<C-r><C-w>/

" Быстрый просмотр файла в терминале
nnoremap gc :!cat %<CR>
nnoremap gl :!less %<CR>

" ============================================================
" Интерфейс и терминал
" ============================================================

set background=dark
set laststatus=2

" Настройки терминала
set termwinkey=<C-x>
nnoremap <leader>t :tab :terminal<CR>

" Включение автоопределения типов файлов и плагинов
filetype plugin indent on