set runtimepath^=~/.vim runtimepath+=~/.vim/after
set termguicolors
let &packpath = &runtimepath
source ~/.vimrc
source ~/.config/nvim/myinit.lua

let g:everforest_background = 'hard'
let g:everforest_cursor_color = 'blue'
let g:everforest_diagnostic_virtual_text = 'colored'
let g:everforest_better_performance = 1
let g:everforest_colors_override = {'fg': ['#7FBBB3', '550'], 'blue' : ['#D3C6AA', '250']}

colorscheme everforest



