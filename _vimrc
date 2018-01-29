set nobackup

" colorscheme candy
" colorscheme adrian
" colorscheme dante
" colorscheme grb256
colorscheme badwolf

source $VIMRUNTIME/mswin.vim

behave mswin

syn on

set tabstop=3        " set how many columns a tab counts for
set softtabstop=3    " set how many columns a tab counts for in insert mode
set expandtab        " hitting Tab in insert mode will produce spaces

set history=50       " set the number of commands to save in history

set visualbell t_vb=""  " sets the bell to a visual instead of an audible bell

set guioptions+=b    " enable bottom scrollbar

set number           " set line numbers 

set ignorecase       " searching is not case sensitive
set smartcase        " if a pattern contains an uppercase the search is case sensitive

set showcmd          " show command in bottom bar
set wildmenu         " visual autocomplete for command menu
set showmatch        " highlight matching [{()}]

set cursorline       " add underline/highlight to current line

" set wrap!            " Don't wrap long lines

" move vertically by visual line / don't jump over the wrapped part of the line
nnoremap j gj
nnoremap k gk

if has("win32") || has("win64")
   set directory=$TMP
else
   set directory=/tmp
end

if has('multi_byte')                   " multibyte features compiled-in 
  if &encoding !~? '^u'                " the OS locale is not Unicode 
    if &termencoding == ''             " empty means 'use &enc' 
      let &termencoding = &encoding    " avoid clobbering keyboard codes 
    endif 
    set encoding=utf-8 						" we can do it, now that the kb is taken care of 
  endif 
  set fileencodings=ucs-bom,utf-8,latin1 " heuristics for existing files 
  setglobal bomb fileencoding=latin1   " defaults for new files 
                     						" 'bomb' doesn't apply to latin1 
                     						" it applies when 'fenc' is manually set to Unicode
   set syntax=ps1
endif


