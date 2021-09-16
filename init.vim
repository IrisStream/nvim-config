"""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM PLUG                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" {{ Theme }}
	Plug 'joshdick/onedark.vim'							" Dark Theme

" {{ File browser }}
	Plug 'preservim/nerdtree'							" File Browser
	Plug 'Xuyuanp/nerdtree-git-plugin'					" Git status
	Plug 'ryanoasis/vim-devicons'						" File type icon on Nerd Tree
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'		

" {{ File search }} 
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" Fuzzy Finder
	Plug 'junegunn/fzf.vim'

" {{ Status bar }}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

" {{ Terminal }}
	Plug 'voldikss/vim-floaterm'						" Floating terminal

" {{ Code intellisense }}
	Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Language server
	Plug 'jiangmiao/auto-pairs'
	Plug 'alvan/vim-closetag'
	Plug 'mattn/emmet-vim'

" {{ Code syntax highlight }}
	Plug 'jackguo380/vim-lsp-cxx-highlight'				" C/C++ syntax highlight

" {{ Debugging }}
	Plug 'puremourning/vimspector'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
set tabstop=4
set shiftwidth=4
" set listchars=tab:\|\
" set list
set foldmethod=indent
set foldlevelstart=99
set number
set relativenumber
syntax on
set ignorecase

" Quick navigate between buffer in vim
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable copy from vim to clipboard
if has('win32')
	set clipboard=unnamed
else
	set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold, CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold, CursorHoldI *
			\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
	\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THEME                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
colorscheme onedark

" Overwrite color highlight
if (has("autocmd"))
	augroup colorextend
		autocmd ColorScheme * call onedark#extend_highlight("Comment", { "fg" : { "gui": "#728083" } } )
		autocmd ColorScheme * call onedark#extend_highlight("LineNr", { "fg" : { "gui": "#728083" } } )
	augroup END
endif

" Font 
let g:airline_powerline_fonts = 1										" Enable powerline fonts
if has('win32')
	set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15					" Using Droid Sans Mono font
endif

" Status bar
let g:airline_theme='onedark'											" Theme One Dark
let g:airline#extensions#tabline#enabled = 1							" Enable tab bar
let g:airline#extensions#tabline#left_sep = ' '							" Enable tab separator
let g:airline#extensions#tabline#left_alt_sep = '|'						" Enable tab separator
let g:airline#extensions#tabline#formatter = 'default'					
let g:airline#extensions#tabline#fnamemod = ':t'						" Set tab name as file name

let g:airline#extensions#whitespace#enabled = 0							" Remove warning whitespace

" Always show tabs
set showtabline=2
nnoremap <C-TAB> :bNext<CR>

" Hide -- INSERT -- thing on the status line
set noshowmode

" Extended settings
let nvim_settings_dir = '~/.config/nvim/settings/'
execute 'source '.nvim_settings_dir.'nerdtree.vim'
execute 'source '.nvim_settings_dir.'fzf.vim'
execute 'source '.nvim_settings_dir.'coc.vim'
