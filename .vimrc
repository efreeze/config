" ---------------------------
" НАСТРОЙКА
" ---------------------------

" Кодировка терминала
set termencoding=utf-8
" Возможные кодировки файлов
set fileencodings=utf-8,cp1251,koi8-r
" Рекомендуется при работе с GTK2+
set encoding=utf-8
" Установка режима работы бекспейса
"set backspace=indent,eol,start
set backspace=indent,eol,start
" Табы, пробелы и окончания строк подсвечиваем символами:
"set listchars=tab:»\ ,trail:·,eol:¶
set listchars=tab:»\ ,trail:·
" Даем возможность сворачивать
set foldenable
" Установим режим работы с мышью (возможно a или v)
set mouse=a
" Покажи непечатаемые символы
set list 
" Седлаем возможность копорования мышью
set mousemodel=popup
" Свой формат строки состояния
set statusline=%<%f%h%m%r%=enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2
" Сделать строку команд высотой в одну строку
set ch=1
" Убираем совместимость
set nocompatible
" Нумерация и синтаксическая подсветка
set number
" Добавляем подсветку синтаксиса
syntax on
" Вырубаем бекапы
set nobackup
" показываем позицию курсора
set ruler
" Tab config
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
"set noexpandtab
set expandtab
"Автозамена по умолчанию пробелов в табы
set et!
" Автоотступ для новых сток
set ai
" Отступы в стиле С++
set cin
" Настройки результаты поиска:
set showmatch 		" показывать результат
set hlsearch 		" подсвечивать совпадения
set incsearch 		" поиск во время набора
set ignorecase 		" не учитывать регистр
" Вырубаемавто перенос
set nowrap
" Приоритет кодировки
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,cp866
" В режиме только чтения будет так:
if &readonly == 1
	set nonumber
	set nofoldenable
	set foldcolumn=10
endif

" Максимизуем окно
if has('gui')
    if has('gui_gtk2')
        au GUIEnter * :set lines=53 columns=156
    endif
endif

" Сносим меню и тулбар
set guioptions-=T 
"set guioptions-=m

colorscheme slate
"colorscheme desert
set background=dark
" colorscheme solarized


" Устанавливаем, что мускуль у нас по умолчанию как режим подсветки
if has("autocmd")
    autocmd BufRead *.sql set filetype=mysql
endif

" ---------------------------
" ГОРЯЧИЕ КЛАВИШИ
" ---------------------------

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-c> "+yi
" imap <C-v> <esc>"+gPi
" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>
" C-y - удаление текущей строки
nmap <C-e> "_dd
imap <C-e> <esc>"_ddi
" C-d - дублирование текущей строки
nmap <C-d> yyp<cr>
imap <C-d> <esc>yypi

vmap <BS> x

" Save
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

imap [ []<LEFT>
" Аналогично и для {
imap {<CR> {<CR>}<Esc>O

" F5 - Список буферовы
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F3 - предыдущий буфер
" nmap <F3> :set paste<cr>
" vmap <F3> <esc>:set paste<cr>i
" imap <F3> <esc>:set paste<cr>i

" F4 - следующий буфер
nmap <F4> :set list<cr>
vmap <F4> <esc>:set list<cr>i
imap <F4> <esc>:set list<cr>i

" NERDTree
nmap <F8> :NERDTree<cr>
vmap <F8> <esc>:NERDTree<cr>i
imap <F8> <esc>:NERDTree<cr>i

" nmap <silent> <F7> <Plug>ToggleProject

nmap <F10> :q!<cr>

vmap <S-Tab> <gv
vmap <Tab> >gv
imap <Ins> <Esc>wq
imap <C-d> <esc>yypi
" For 'view' mode
if &readonly == 1
	nmap <F10> :qa<cr>
	nmap <Space> <PageDown>
endif
" Делаем циклическое изменение кодировки
map <F11> :execute RotateEnc()<CR>

" ---------------------------
" ПРОЧИЕ НАСТРОЙКИ 
" ---------------------------

set wildmenu
    set wcm=<Tab>
    " Юникод
        menu Encoding.UTF-8          :e ++enc=utf-8<CR>
        "    menu Encoding.Unicode        :e ++enc=unicode
        "    menu Encoding.UCS-2          :e ++enc=ucs-2
        "    menu Encoding.UCS-4          :e ++enc=ucs-4
        " Кириллические кодировки
        menu Encoding.KOI8-R         :e ++enc=koi8-r<CR>
        "    menu Encoding.KOI8-RU        :e ++enc=koi8-ru
        menu Encoding.CP1251         :e ++enc=cp1251<CR>
        " Определяем клавишу F8 для меню выбора кодировки
        map  :emenu Encoding.
        map <F11> :emenu Encoding.<TAB>
        "
        " Меню для выбора типа файла (DOS, UNIX, Mac)
        menu FileFormat.UNIX         :e ++ff=unix<CR>
        menu FileFormat.DOS          :e ++ff=dos<CR>
        menu FileFormat.Mac          :e ++ff=mac<CR>
        " Определяем сочетание клавиш Shift+F8 для вызова этого меню
        map  :emenu FileFormat.

" some funcs
let b:encindex=0
function! RotateEnc()
        let y = -1
        while y == -1
                let encstring = "#8bit-cp1251#koi8-r#utf-8#"
                let x = match(encstring,"#",b:encindex)
                let y = match(encstring,"#",x+1)
                let b:encindex = x+1
                if y == -1
                        let b:encindex = 0
                else
                        let str = strpart(encstring,x+1,y-x-1)
                        return ":set encoding=".str
                endif
        endwhile
endfunction

map <C-v> <esc>:set paste<cr> <MiddleMouse> :set nopaste<cr>
set pastetoggle=<F3>

source ~/.vim/php-doc.vim 

" Автозавершение слов по tab =)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>
