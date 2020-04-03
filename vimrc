call plug#begin()
Plug 'neoclide/coc.nvim'
Plug 'herringtondarkholme/yats.vim'
Plug 'preservim/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/SyntaxComplete'
call plug#end()

syntax on
let g:solarized_termcolors=256
call togglebg#map("<F5>")
set cursorline
set number
set relativenumber
set noerrorbells

"set automaticali Nerd autocmd vimenter * NERDTree
"***********************************General configuration options􏰁
set nocompatible " Use Vim settings, rather then Vi settings. It’s important to have this on the top of your file, as it influences other options.
set backspace=indent,eol,start "Allow backspacing over indention, line breaks and insertion start.
set history=1000 "Set bigger history of executed commands.
set showcmd "Show incomplete commands at the bottom.
set showmode "Show current mode at the bottom.
set autoread "Automatically re-read files if unmodified inside Vim.
set hidden "Manage multiple buffers effectively: the current buffer can be “sent” to the background without writing to disk. When a background buffer becomes current again, marks and undo-history are remembered. See chapter Buffers to understand this better.


"*********************************User Interface Options
set laststatus=2 "Always display the status bar.
set ruler "Always show cursor position.
set wildmenu "Display command line’s tab complete options as a menu.
set tabpagemax=40 "Maximum number of tab pages that can be opened from the command line.
colorscheme solarized 
set cursorline "Highlight the line currently under cursor.
set number "Show line numbers on the sidebar.
set relativenumber "Show line number on the current line and relative numbers on all other lines. Works only if the option above (number) is enabled.
set noerrorbells visualbell t_vb= "Disable beep on errors.
autocmd GUIEnter * set visualbell t_vb=
set mouse=a "Enable mouse for scrolling and resizing.
set background=dark "Use colors that suit a dark background.
set title "Set the window’s title, reflecting the file currently being edited.

"**********************************Swap and backup file options - disable all of them:
set noswapfile
set nobackup
set nowb

"**********************************Indentation options:
set autoindent "New lines inherit the indentation of previous lines.
filetype plugin indent on "Smart auto indentation (instead of old smartindent option).
set tabstop=4 "Show existing tab with 4 spaces width.
set shiftwidth=2 "When indenting with ‘>’, use 2 spaces width.
set expandtab "On pressing tab, insert 4 spaces.
set nowrap "Don’t wrap lines.

"****************************************Search options:
set incsearch "Find the next match as we type the search. • set hlsearch "Highlight searches by default.
set ignorecase "Ignore case when searching . . .
set smartcase ". . . unless you type a capital.

"****************************************Text rendering options
set encoding=utf-8 "Use an encoding that supports Unicode.
set linebreak "Wrap lines at convenient points, avoid wrapping a line in the middle of a word.
set scrolloff=3 "The number of screen lines to keep above and below the cursor.
set sidescrolloff=5 "The number of screen columns to keep to the left and right of the cursor.
syntax enable "Enable syntax highlighting.

"****************************************Status line
"show status line
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

"****************************************CONFIG

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"Se deplacer entre les buffers.
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>

"OPtion plugin fonctionne pas
 if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
		    \	if &omnifunc == "" |
		    \		setlocal omnifunc=syntaxcomplete#Complete |
		    \	endif
    endif
"map l pour visual mode
nmap l V

let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:solarized_diffmode="normal"
let g:solarized_hitrail=0
let g:solarized_menu=1
