set nocompatible
filetype off

set rtp^=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Townk/vim-autoclose.git' " auto add matching bracket or quote when you type one
Plugin 'terryma/vim-multiple-cursors' " sublime-text-like mutli cursors
Plugin 'scrooloose/nerdtree' " a file explorer
Plugin 'scrooloose/syntastic' " inline syntax checker
Plugin 'kchmck/vim-coffee-script' " coffeescript syntax highlighter
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-surround' " git wrapper
Plugin 'junegunn/fzf.vim' " fuzzy finder
Plugin 'leafgarland/typescript-vim' " typescript syntax highlighter
Plugin 'mileszs/ack.vim' " ack inside vim

call vundle#end()

filetype plugin indent on

" Default indent settings (2 spaces to a tab)
set number
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent " indent as you type
set backspace=indent,eol,start " enable backspace button
set laststatus=2
set statusline=%f\ %m%=%c,%l/%L\
set scrolloff=15 " vim will automatically adjust viewport to leave at least 15 lines above and below cursor when possible"
set incsearch " highight search incrementally
set ignorecase " searches are case insensitive
set smartcase " searches become case sensitive when you enter capital letters
syntax on

let mapleader = ','

nnoremap ∆ <C-W><C-J>
nnoremap ˚ <C-W><C-K>
nnoremap ¬ <C-W><C-L>
nnoremap ˙ <C-W><C-H>

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" NerdCommenter Settings
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" vim splits
set splitbelow
set splitright

" maximizing and minimizing vim splits
nnoremap <C-W>M <C-W>\| <C-W>_
nnoremap <C-W>m <C-W>=

" NerdTree Settings
map <C-e> :NERDTreeToggle<CR>

" Vim Multiple Cursor Settings
let g:multi_cursor_exit_from_visual_mode = 0

" Syntastic eslint settings
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" insert new line by pressing Enter
nmap <CR> o<Esc>

" fzf config
" Use rg
if executable('rg')
  set grepprg=rg\ --vimgrep
  endif

nmap <c-p> :Files<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" copy text to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" maximize window and return to previous split structure
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-o> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

noremap <C-P> :FZF<CR>

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd BufWritePre * %s/\s\+$//e
