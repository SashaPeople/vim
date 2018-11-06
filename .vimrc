call plug#begin('~/.vim/plugged')
"C++----------------------------------------------------------------------------------------------------------------------------------------- 
  Plug 'vim-scripts/c.vim'
  Plug 'valloric/youcompleteme'
"Display options----------------------------------------------------------------------------------------------------------------------------- 
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'chriskempson/base16-vim'
  Plug 'bling/vim-airline'
  Plug 'scrooloose/syntastic'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ap/vim-css-color', {'for': 'css'}
  Plug 'gorodinskiy/vim-coloresque'
"Nav------------------------------------------------------------------------------------------------------------------------------------------
  Plug 'kien/ctrlp.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'terryma/vim-multiple-cursors'
"Vim------------------------------------------------------------------------------------------------------------------------------------------
  Plug 'matze/vim-move'
  Plug 'benekastah/neomake' "Asynchronous linting and make framework for Neovim/Vim
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'junegunn/vim-easy-align'
"functionality--------------------------------------------------------------------------------------------------------------------------------
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/vim-easy-align' "vim alignment plugin (gaip)
  Plug 'tpope/vim-surround'  "surroundings: parentheses, brackets, quotes, XML tags, and more
  Plug 'shougo/vimproc.vim' "Interactive command execution in Vim.
"for php development--------------------------------------------------------------------------------------------------------------------------
  Plug 'captbaritone/better-indent-support-for-php-with-html'
  Plug 'joonty/vdebug'
  Plug 'mattn/emmet-vim'
  Plug 'shawncplus/phpcomplete.vim'
  Plug 'stanangeloff/php.vim'
  Plug 'othree/html5.vim'
  Plug 'hail2u/vim-css3-syntax', {'for': 'css'}
  Plug 'vim-scripts/dbext.vim'
call plug#end()


"php
  filetype plugin indent on
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  let g:ycm_seed_identifiers_with_syntax = 1
  let g:ycm_key_invoke_completion = '<C-F>'

"move
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
  set timeout ttimeoutlen=50

"multiple cursors 
  let g:multi_cursor_start_word_key = '<C-m>'
  ")

"folding
  " (Using s-tab to avoid collision between <tab> and <C-i>).
  nnoremap <s-tab> za
  if has('folding')
    if has('windows')
      let &fillchars='vert: '           " less cluttered vertical window separators
    endif
    set foldmethod=indent               " not as cool as syntax, but faster
    set foldlevelstart=99               " start unfolded
  endif

"vim-css
  let g:cssColorVimDoNotMessMyUpdatetime = 1
  ")

" Display options
  syntax on
  set cursorline 
  let base16colorspace=256
  set relativenumber
  colorscheme base16-phd
  let g:rbpt_loadcmd_toggle = 1
  hi Comment ctermfg=LightBlue
  set background=light

"indentline
  :set list lcs=tab:\|\ 
  let g:indentLine_setColors = 0
  let g:indentLine_color_term =150  

"easy align  (gaip= gg=G) 
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

"icons
  set encoding=utf8
  set guifont=Meslo\ LG\ S\ Bold\ for\ Powerline:h20
  let g:airline_powerline_fonts = 1

" Relative line numbers
  set incsearch
  ")

"base16
  if filereadable(expand("~/.vimrc_background"))
      let base16colorspace=256
        source ~/.vimrc_background
      endif
  let base16colorspace=256

"Indentation and tabbing
  set autoindent smartindent
  set smarttab                    " Make <tab> and <backspace> smarter
  set tabstop=2
  set expandtab
  set shiftround
  set shiftwidth=2

"airline 
  set laststatus=2
  let g:airline_powerline_fonts = 1
  let g:airline_theme='dark'
  let g:airline_solarized_bg='powerlineish'
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  set t_Co=256
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

" unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'



"ruby
"nmap <C-b> :!ruby %<CR>

"mappingss
  map <C-n> :NERDTreeToggle <CR>
  map <Leader> <Plug>(easymotion-prefix)
  map <silent> <C-h> :call WinMove('h')<CR>
  map <silent> <C-j> :call WinMove('j')<CR>
  map <silent> <C-k> :call WinMove('k')<CR>
  map <silent> <C-l> :call WinMove('l')<CR>
  map <C-a> <esc>ggVG<CR>

  function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
        wincmd v
      else
        wincmd s
      endif
      exec "wincmd ".a:key
    endif
  endfunction

"test
  let g:bufcleaner_max_save = 2

  command! -bar -bang -nargs=? CleanBuffers call s:cleanBuffers("<bang>")
  function! s:cleanBuffers(...) abort
    let force = a:0 >= 1 && a:1 ==# '!'
    redir => bufs
      silent! buffers
    redir END

    let hidden = []
    for buf in map(split(bufs, '\n'), 'split(v:val)')
      let bufnr = buf[0] + 0
      let flags = matchstr(join(buf[1:]), '^.*\ze\s\+"')
      let mod = substitute(flags, '\s*', '', 'g')
      let hide = mod ==# 'h' || mod ==# 'h+'
          \ && (force || input(printf("\n%s not saved.\nDelete anyway? [Y]es, (N)o: ",
            \ bufname(bufnr))) =~? '^y\%[es]$')
      if hide
        call add(hidden, bufnr)
      endif
    endfor

    let saved = get(g:, 'bufcleaner_max_save', 3)
    let target = len(hidden) > saved ? join(hidden[0:-saved-1], ' ') : ''
    if !empty(target)
      silent! execute 'bwipeout!' target
    endif
  endfunction


  augroup buffer-cleaner
    autocmd!
    autocmd BufHidden * CleanBuffers
  augroup END

