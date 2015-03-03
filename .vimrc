" RichT .vimrc
"
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Load all plugins, with junegunn's vim-plug --- {{{
" ----------------------------------------
call plug#begin('~/.vim/plugged')
" - Make sure you use single quotes to name plugins.

    " Defaults everyone can agree on.
    Plug 'tpope/vim-sensible'

    " Possible replacements for minibufexpl
    Plug 'bling/vim-bufferline'
    "Plug 'bling/vim-airline'  " Too garish, methinks.
    " The latest minibufexpl
    "Plug 'techlivezheng/vim-plugin-minibufexpl'

    " A different buffer choooser. Replacing NERDTree perhaps?
    Plug 'jeetsukumaran/vim-buffergator'

    " Actually use the undo tree.
    Plug 'mbbill/undotree',         { 'on': 'UndotreeToggle'   }

    " Coding --- {{{
    " ======
    " Flexible syntax checking
    Plug 'scrooloose/syntastic'
    " The latest taglist
    Plug 'vim-scripts/taglist.vim'
    " The latest TaskList, based on the Eclipse GUI version.
    Plug 'vim-scripts/TaskList.vim'
    " jedi autocompletion library for vim.
    Plug 'davidhalter/jedi-vim'
    " Helpers for unix stuff.
    Plug 'tpope/vim-eunuch'
    " Mr Pope's projectionist plugin.
    Plug 'tpope/vim-projectionist'

    " Bash support
    Plug 'vim-scripts/bash-support.vim'
    " }}}    

    " Python --- {{{
    " ======
    " Send cells of Python code to ipython pane
    Plug 'julienr/vim-cellmode'

    " Conda environment change from with vim (Warned: BETA)
    "Plug 'cjrh/vim-conda'

    " Python debugging inside vim.
    Plug '~/.vim/unmanaged/VimPdb.vim'
    " }}}

    " Vimscript  --- {{{
    " =========
    " Vimscript testing framework. Very nice.
    Plug 'junegunn/vader.vim',      { 'on': 'Vader', 'for': 'vader' }
    " }}}

    " Writing --- {{{
    " =======
    " Distraction free writing.
    Plug 'junegunn/goyo.vim'
    " Hyper-focus highlighting for Goyo. 
    Plug 'junegunn/limelight.vim'
    " Low contrast colour scheme.
    Plug 'junegunn/seoul256.vim'
    " Easily search for, substitute, and abbreviate multiple variants of a word.
    Plug 'tpope/vim-abolish'
    " Rethinking VIM as a tool for writing.
    "Plug 'reedes/vim-pencil'
    " }}}

    " Edit enhancements  --- {{{
    " =================
    " Alignment plugin
    Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
    " Comment stuff out neatly and flexibly.
    Plug 'tpope/vim-commentary'
    " Enable repeating supported plugins to use "."
    Plug 'tpope/vim-repeat'
    " Quoting/parenthesizing made easy.
    Plug 'tpope/vim-surround'
    " Pairs of handy bracket mappings.
    Plug 'tpope/vim-unimpaired'
    " Smart selection of the nearest text object.
    Plug 'gcmt/wildfire.vim'
    " :NR Isolate a narrow region of the currrent file in a scratch buffer. 
    Plug 'chrisbra/NrrwRgn'
    " <C-w>o toggles a window/pane to full screen and back again.
    Plug 'vim-scripts/ZoomWin'
    " <Leader>ws toggles visibility of whitespace.
    Plug 'chrisbra/vim-show-whitespace'
    " Change single line to multi line, and back.
    Plug 'AndrewRadev/splitjoin.vim'
    " Switch predefined segments of text with defined replacements.
    Plug 'AndrewRadev/switch.vim'
    " }}}

    " Utilities  --- {{{
    " =========
    " The ultimate snippet solution for vim.
    "Plug 'SirVer/ultisnips'
   
    " cdargs-like in vim
    Plug 'vim-scripts/cdargs'

    " Interaction with tmux
    Plug 'benmills/vimux'

    " Preview Markdown documents in a Browser. 
    Plug 'waylan/vim-markdown-extra-preview'

    " Access the sudo functionality from within vim. 
    Plug 'vim-scripts/SudoEdit.vim'

    " Simplenote interface.
    Plug 'mrtazz/simplenote.vim'
    " }}}

call plug#end()
" }}}

" Plugin configuration section  --- {{{
" ----------------------------
let g:config_file = "~/simplenote-config.vim"
if filereadable("g:config_file")
    source! g:config_file
endif

" Goyo settings
let g:goyo_width = 80
let g:goyo_margin_top = 4
let g:goyo_margin_bottom = 4
let g:goyo_linenr = 0

"autocmd User GoyoEnter Limelight
"autocmd User GoyoLeave Limelight!

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
colo seoul256

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Section to support Python coding --- {{{
" --------------------------------

" Minibuffer settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" TagList settings
let $Tlist_Ctags_Cmd='/usr/local/bin/ctags'
map P :TlistToggle<CR>

" TaskList settings
map T :TaskList<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete

" PEP8 settings
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
:syntax on
" }}}

" Syntastic Section
" -----------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" vim-pencil configuration
"augroup pencil
"  autocmd!
"  autocmd FileType markdown,mkd call pencil#init()
"  autocmd FileType text         call pencil#init()
"augroup END

" }}}



" General Section --- {{{
" ---------------

" Instant access to .vimrc, and autoload after tweak. Another Conway special.
nmap <silent> ;v :next $MYVIMRC<CR>

augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC   source $MYVIMRC
augroup END

set wildmenu
if exists("&wildignorecase")
    set wildignorecase
endif
set ignorecase
set infercase

" Enable full rectangles at all times for visual block mode.
set virtualedit=block

" Force .md to be a markdown file rather than Modula2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Some mappings from junegunn

" Save
inoremap <C-s> <C-O>:update<CR>
nnoremap <C-s> :update<CR>

" Circular windows navigation
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

" Enable Alt-Arrow keys to move amongst panes.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"nnoremap <SPACE> <PAGEDOWN>

" The Conway search enhancement
nmap S :%s/\v//gc<LEFT><LEFT><LEFT><LEFT>
vmap S :s/\v//gc<LEFT><LEFT><LEFT><LEFT>

"Persistent visual selections (per Conway, again)
vmap <expr> > ShiftAndKeepVisualSelection(">")
vmap <expr> < ShiftAndKeepVisualSelection("<")

function! ShiftAndKeepVisualSelection(cmd)
    set nosmartindent
    if mode() =~ '[Vv]'
        return a:cmd . ":set smartindent\<CR>gv"
    else
        return a:cmd . ":set smartindent\<CR>"
    endif
endfunction

" Locate and return character "above" current cursor position...
function! LookUpwards()
    "Locate current column and preceding line from which to copy...
    let column_num = virtcol('.')
    let target_pattern = '\%' . column_num . 'v.'
    let target_line_num = search(target_pattern . '*\S', 'bnW')
    "If target line found, return vertically copied character...
    if !target_line_num
        return ""
    else
        return matchstr(getline(target_line_num), target_pattern)
    endif
endfunction

" Reimplement CTRL-Y within insert mode...
imap <silent> <C-Y> <C-R><C-R>=LookUpwards()<CR>

" Some folding settings, recommended on stackexchange
"set foldmethod=indent   "fold based on indent
set foldmethod=marker
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "don't fold by default
set foldlevel=1

" Tidy marker-folded folds.
":set foldtext=MyFoldText()
"function! MyFoldText()
"    let line = getline(v:foldstart)
"    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
"    return v:folddashes . sub
"endfunction

":set foldexpr=getline(v:lnum)[0]==\"\"\"

function! Highlight_cursor ()
    set cursorline
    redraw
    sleep 1
    set nocursorline
endfunction

" Cursor-highlight any file when context-switching ...
"autocmd  FocusGained  *          :call Highlight_cursor()


" }}}
