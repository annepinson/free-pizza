syntax on
filetype indent plugin on
:set mouse=v
:set showcmd
:set ruler
:set sm
set formatoptions=tcroqn
:set autoindent
:set nu
:set autowrite
:set autowriteall
" let g:coc_disable_startup_warning = 1
" colorscheme edmondburnett/leeward.nvim
call plug#begin()
Plug 'vim-scripts/OmniCppComplete'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-autoformat/vim-autoformat'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'github/copilot.vim'
Plug 'edmondburnett/leeward.nvim'
Plug 'sainnhe/everforest'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'rhysd/conflict-marker.vim'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'xiyaowong/transparent.nvim'
Plug 'feline-nvim/feline.nvim'
call plug#end()

" Autoformat
" au BufWrite * :Autoformat

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview



" Coc autocompletion
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=no
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif


" Commenting blocks of code.
augroup commenting_blocks_of_code
	echo $FileType
	autocmd!
	autocmd FileType c,cpp,java,javascript,typescript,typescriptreact,javascriptreact let b:comment_leader = '//'
	autocmd FileType sh,ruby,python   let b:comment_leader = '#'
	autocmd FileType vim              let b:comment_leader = '"'
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Remap nvim windows commands
nnoremap <C-Left> <C-W>h
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k
nnoremap <C-Right> <C-W>l
nnoremap <C-c> <C-W>c
inoremap <C-Left> <Esc><C-W>h
inoremap <C-Down> <Esc><C-W>j
inoremap <C-Up> <Esc><C-W>k
inoremap <C-Right> <Esc><C-W>l
inoremap <C-c> <Esc><C-W>c


" cmap vertical sb

"au! bufwritepre *.tsx :CocCommand prettier.formatFile
"au! bufwritepre *.jsx :CocCommand prettier.formatFile
"au! bufwritepre *.ts :CocCommand prettier.formatFile
"au! bufwritepre *.js :CocCommand prettier.formatFile

"command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePre * if CocHasProvider('format') | call CocAction('format') | endif
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> dp <Plug>(coc-diagnostic-prev)
nmap <silent> dn <Plug>(coc-diagnostic-next)


" Replace pick by wanted command in git rebase -i
nmap <silent> ed :<C-B>silent <C-E>s/pick/edit/<CR>:nohlsearch<CR><Down>
nmap <silent> sq :<C-B>silent <C-E>s/pick/squash/<CR>:nohlsearch<CR><Down>
nmap <silent> de :<C-B>silent <C-E>s/pick/delete/<CR>:nohlsearch<CR><Down>
nmap <silent> re :<C-B>silent <C-E>s/pick/reword/<CR>:nohlsearch<CR><Down>

" Allow to search and replace a word easily
" Substitute in line
vnoremap fr "zy:%s/<C-r>z//g<Left><Left>
nnoremap fr "zyiw:%s/<C-r>z//g<Left><Left>

"Allow to search a pattern easily
vnoremap fs "zy/<C-r>z
nnoremap fs "zyiw/<C-r>z

vnoremap fc :nohlsearch<CR>
nnoremap fc :nohlsearch<CR>

" To be able to select a word in normal mode
nnoremap aw vaw
