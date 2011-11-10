silent! call pathogen#infect()

set expandtab
set tabstop=4
set shiftwidth=4
set path=$PWD/**

imap <C-d> import pdb; pdb.set_trace()<CR>
imap <C-f> from IPython import Shell; Shell.IPShellEmbed(argv=['-noconfirm_exit'])()<CR>
syntax enable
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
let g:pyflakes_use_quickfix = 0

set background=light
set tags=~/tags
set nolist
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>
"Invisible character colors
highlight NonText ctermfg=240
highlight SpecialKey ctermfg=240
highlight SpellBad cterm=NONE ctermbg=7

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

nmap <leader>, :tabedit $MYVIMRC<CR>

let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split

function! HasError()
    if exists("g:pyflakes_has_errors")
        if g:pyflakes_has_errors
            return "!"
        endif
        return ""
    else
        return ""
    endif
endfunction

function! Collapse(string)
    let threshold = 30
    let total_length = len(a:string)
    if total_length > threshold
        let difference = total_length - threshold
        return ' ...' . strpart(a:string, difference)
    else
        return a:string
    endif
endfunction

function! Getcwd()
    let current_dir = getcwd()
    let current_path = expand("%:p:h")
    if current_dir == current_path
        return "."
    else
        return current_dir
    endif
endfunction


" A status bar that shows nice information
set laststatus=2

" All status line
set statusline=%#ErrorMsg#                   " set the highlight to error
set statusline+=%{HasError()}                " let me know if pyflakes errs
set statusline+=%*                           " switch back to normal statuscolor
set statusline+=%-4{fugitive#statusline()}%*
set statusline+=%F                           " absolute path
set statusline+=%m                           " are you modified?
set statusline+=%r                           " are you read only?
set statusline+=%w                           " are we in a preview window
set statusline+=\ \ \ cwd:                   " show me the
set statusline+=%{Collapse(Getcwd())}        " current working dir truncated
set statusline+=%=                           " right align
set statusline+=\ \ \ \ %y                   " what the file type
set statusline+=[                            "
set statusline+=\ Line:                      "
set statusline+=%3l/                         " Line number with padding
set statusline+=%L                           " Total lines in the file
set statusline+=:%2c                         " column number
set statusline+=]                            "
