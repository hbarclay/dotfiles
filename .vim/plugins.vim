call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install all'}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'xuhdev/vim-latex-live-preview'

Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger = '<C-j>'
	let g:UltiSnipsJumpForwardTrigger = '<C-j>'
	let g:UltiSnipsJumpBackwardTrigger = '<C-z>'
Plug 'lervag/vimtex'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_compiler_enabled=1
	let g:vimtex_quickfix_mode=0
Plug 'KeitaNakamura/tex-conceal.vim'
	set conceallevel=1
	let g:tex_conceal='abdmg'
	hi Conceal ctermbg=none


Plug 'tpope/vim-fugitive'
  nmap     <Leader>g :Git<CR>gg<c-n>
  nnoremap <Leader>d :Gdiff<CR>

Plug 'Valloric/YouCompleteMe'
    let g:ycm_auto_trigger=1
	let g:ycm_enable_inlay_hints=0
	let g:ycm_always_populate_location_list=1

Plug 'dylanaraps/wal.vim'

Plug 'ludovicchabant/vim-gutentags'


call plug#end()
