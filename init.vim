set runtimepath^=~/.vim runtimepath+=~/.vim/after
set termguicolors
let &packpath = &runtimepath
source ~/.vimrc
source ~/.config/nvim/myinit.lua
source ~/.config/nvim/colorconfig.vim


" Highlight yanked visual selection, you can change the color in your color scheme highlight group
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="DiffChange", timeout=200})
augroup END
