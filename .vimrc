"Regular set
"----------------------------------------------------
"clear search highlight.
noh
"enable syntax color.
syntax on
"Enable Flash or Beep if an error occurs.
set visualbell
"enable number
set number
"always show what mode we're currently editing in
set showmode
"set show matching parenthesis
set showmatch
"show (partial) command in the last line of the screen
set showcmd
"a tab is one spaces
set tabstop=4
"one of spaces per tab when editing
set softtabstop=4
"spaces to insert or remove using the indentation commands
set shiftwidth=4
"tabs are spaces
set expandtab
"use a status bar that is 1 rows high
set cmdheight=1
"tell VIM to always put a status line even if there is only one windown
set laststatus=2
"environment variable to indicate that UTF-8 is your preferred character encoding
set encoding=UTF-8
"set leader VIM
let mapleader = " "
"delete ~ character 
set fillchars=eob:\ 
"delete file nerd tree\ 
set modifiable
"fast delete previous word
set backspace=indent,eol,start
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
"-----------------------------------------------------


"Plugins VIM
"---------------------------------------------------
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
call plug#end()
"----------------------------------------------------


"IndentLine
"----------------------------------------------------
"set color indentline
let g:indentLine_color_term = 239
"display character lines
"let g:indentLine_char = '|'
let g:indentLine_char = ' '
"to use the same colors that are used for tab indents
let g:indentLine_defaultGroup = 'SpecialKey'
"-----------------------------------------------------


"Vim Devicons
"----------------------------------------------------
"for fix ^[P1$r0 q^[\^[[?12;4$y
"set t_RV=
"set background=dark
"-----------------------------------------------------


"Airline
"----------------------------------------------------
"which will automatically populate the g:airline_symbols dictionary with the powerline symbols.
let g:airline_powerline_fonts = 1
"an empty array would effectively disable all extensions
let g:airline_extensions = []
"will however clear the cache
let g:airline_highlighting_cache = 1
"enable by default
let g:airline#extensions#tabline#enabled = 1
"theme selections
let g:airline_theme='base16_gruvbox_dark_hard'
"-----------------------------------------------------


"NerdTree 
"-----------------------------------------------------
"focus nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
"show nerdtree 
nnoremap <C-n> :NERDTree<CR>
"close nerdtree
nnoremap <C-a> :NERDTreeClose<CR>
"find in nerdtree
nnoremap <C-f> :NERDTreeFind<CR>
"change focus to up 
nmap <silent> <c-k> :wincmd k<CR>
"change focus to down
nmap <silent> <c-j> :wincmd j<CR>
"change focus to left
nmap <silent> <c-h> :wincmd h<CR>
"change focus to right
nmap <silent> <c-l> :wincmd l<CR>
"-----------------------------------------------------

"Css Color
"-----------------------------------------------------
"for show color code
let g:cssColorVimDoNotMessMyUpdatetime = 1
"-----------------------------------------------------


"Fzf Setup with Ctrl
"-----------------------------------------------------
let $FZF_DEFAULT_OPTS ="--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-f:preview-down,ctrl-b:preview-up --preview 'bat --style=numbers  --color=always --line-range=:500 {}'"
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
"find file in directory
silent! nmap <C-p> :Files<CR>
"find file repo git
silent! nma <C-g> :Gfiles<CR>
"find file string/regex
silent! nmap <C-f> :Rg!
"-----------------------------------------------------


"OmniFunc Autocomplete
"-----------------------------------------------------
filetype plugin on
set omnifunc=syntaxcomplete#Complete
highlight Pmenu ctermbg=148 gui=bold
"-----------------------------------------------------


"Coc Autocomplete C++
"--------------------------------
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"-----------------------------------------------------------------------------
