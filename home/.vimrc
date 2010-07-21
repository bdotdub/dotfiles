" Syntax Highlighting
syntax enable
au BufRead,BufNewFile *.cap setf ruby
au BufRead,BufNewFile *.haml setf ruby
au BufRead,BufNewFile *.md setf mkd
au BufRead,BufNewFile *.pp setf puppet
au BufRead,BufNewFile *.ru setf ruby
au BufRead,BufNewFile *.scala setf scala
au BufRead,BufNewFile *.textile setf textile
au BufRead,BufNewFile Capfile setf ruby

" Search
set showmatch
set ignorecase
set incsearch
set smartcase
set list
set listchars=trail:*

:hi Search guibg=LightBlue
:hi Search ctermbg=LightGrey

" Tab stop and indent stuff
set ts=2
set tabstop=2
set expandtab
set shiftwidth=2

set autoindent
set smartindent

" Line numbers
set ruler
set number
:hi LineNr ctermfg=DarkGrey

" Make
map <D-r> :make<CR>
au FileType mkd set makeprg=/opt/local/bin/maruku\ %

" Misc
set wildignore=*.o
set wildmenu
set nocp
set backspace=indent,eol,start
set laststatus=2

" Other useful tips: http://items.sjbach.com/319/configuring-vim-right
set hidden
set history=1000
set so=2

nnoremap ' `
nnoremap ` '

let mapleader="'"

set backupdir=~/.vim/swp
set directory=~/.vim/swp

" F{n} shortcuts
map <C-c> :!

" Toggle highlight search with F10
map <Leader>hh :set hlsearch!<CR>
imap <Leader>hh <ESC>:set hlsearch!<CR>a

map <Leader>ss :if exists("syntax_on") <Bar>
  \   syntax off <Bar>
  \ else <Bar>
  \   syntax enable <Bar>
  \ endif <CR>
imap <Leader>ss <ESC><Leader>ssi

" Shortcuts to move between buffers
map [ :bp<cr>
map ] :bn<cr>
map :E :e<cr>
map :W :w<cr>

"Changing directory to match current buffer
"START
function! CHANGE_CURR_DIR()
  let _dir = escape(expand("%:p:h"), " ")
  exec "cd " . _dir
  unlet _dir
endfunction

autocmd BufEnter * call CHANGE_CURR_DIR()
"END

"Escape from insert mode
":map <S-space> i
":imap <S-space> <esc>
imap ;; <esc>

"delete the buffer; keep windows
function! Bk(kwbdStage)
if(a:kwbdStage == 1)
  let g:kwbdBufNum = bufnr("%")
  let g:kwbdWinNum = winnr()
  windo call Bk(2)
  execute "bd! " . g:kwbdBufNum
  execute "normal " . g:kwbdWinNum . ""
else
  if(bufnr("%") == g:kwbdBufNum)
    let prevbufvar = bufnr("#")
    if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
      b #
    else
      bn
    endif
  endif
endif
endfunction

function! BwongCloseBufferAndWindow()
  :call Bk(1)
  wincmd c
endfunction

function! ClearExtraneousSpaces()
  :silent! %s/^\s\+$//
  :silent! %s/\s\+$//
endfunction

map :bk :call Bk(1)
map <leader>k :call Bk(1)<CR>
map <leader>j :call BwongCloseBufferAndWindow()<CR>
map <Leader><Tab> :call ClearExtraneousSpaces()<CR>

" Minibufferexplorer config
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" VSTreeExplorer config
let g:treeExplVertical = 1
let g:treeExplWinSize = 35

" Automatically close curly brace on enter
inoremap {<CR>  {<CR>}<Esc>O

nmap <D-/> ,c<space>
vmap <D-/> ,c<space>
imap <D-/> <C-O>,c<space>

