
" space as leader
nnoremap <SPACE> <Nop>
let maplocalleader = ' '

let mapleader = '\'


set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set shiftround
set ignorecase
set incsearch
set number
set relativenumber
set splitright
set splitbelow
set hlsearch
set wildmenu

set history=1000
set undolevels=1000

set belloff=all

" Avoiding annoying behavior with line wrapping
nmap j gj
nmap k gk

" Don't remember what this is for.
"nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

"nnoremap <Esc> :noh<Esc>

"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

" boo python
autocmd filetype python setlocal expandtab
autocmd filetype tex setlocal expandtab
autocmd filetype latex setlocal expandtab

autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=0 
autocmd FileType typescript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=0 

" Highlight column at 80 chars
hi Bang ctermfg=red guifg=red
match Bang /\%>79v.*\%<81v/

set laststatus=2

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Two plugin managers? 
if empty(glob('~/.vim/autoload/pathogen.vim'))
	silent !curl -LSso ~/.vim/autoload/pathogen.vim
				\ https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
endif
execute pathogen#infect()

syntax on
filetype plugin on

so ~/.vim/plugins.vim

colorscheme nord

noremap <F7> :NERDTreeToggle<CR>
noremap <F9> :TagbarToggle<CR>
noremap <F8> :TagbarOpenAutoClose<CR>


set diffopt+=vertical

""" Plugin Mappings 

" YCM
nnoremap <silent> <leader>h <Plug>(YCMToggleInlayHints)
nnoremap <localleader>] :YcmCompleter GoToDeclaration<CR>
nnoremap <localleader>[ :YcmCompleter GoToDefinition<CR>
nnoremap <localleader>f :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F9> :YcmCompleter FixIt<CR>

" Coc
function! CocMappings()
	nmap <buffer> <silent> <localleader>] <Plug>(coc-definition)
	nmap <buffer> <silent> <localleader>[ <Plug>(coc-type-definition)
	nmap <buffer> <silent> <localleader>r <Plug>(coc-references)
	nmap <buffer> <F9> <Plug>(coc-codeaction)
	
	nmap <buffer> <leader>rn <Plug>(coc-rename)

	nnoremap <buffer> <silent> K :call CocAction('doHover')<CR>

	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endfunction

autocmd FileType javascript,typescript call CocMappings()

" FZF
"map <C-h> :History<CR>

" Fugitive
" ...

" NerdTree
" quit if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Turn off auto-indent. Originally for annoying .tex behavior.
" TODO revert this
filetype indent off
