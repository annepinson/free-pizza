-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


-- NvimTree custom mappings
local tree_api= require("nvim-tree.api")
vim.keymap.set("n", "t", tree_api.tree.open)
vim.keymap.set("n", "T", tree_api.tree.close)

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true
	},
	update_focused_file = {
		enable = true,
	},
	filters = {
		dotfiles = false,
		git_ignored = false,
	}
})


-- Telescope custom mappings
local builtin = require('telescope.builtin')

vim.keymap.set({'n', 'i', 'v'}, '<C-f>', builtin.find_files, {})
vim.keymap.set({'n', 'i', 'v'}, '<C-g>', builtin.live_grep, {})
vim.keymap.set({'n', 'i', 'v'}, '<C-s>t', builtin.git_status, {})
vim.keymap.set({'n', 'i', 'v'}, '<C-s>h', builtin.git_stash, {})


local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("v", "<C-g>", live_grep_args_shortcuts.grep_visual_selection)


require("telescope").setup {
  pickers = {
    find_files = {
    hidden = true
    }
      --mappings = {
        --i = {
          --["<CR>"] = function(prompt_bufnr)
            ---...
          --end,
       -- },
     -- },
    },
  }


require('gitsigns').setup {
	signs = {
		add          = { text = '│' },
		change       = { text = '│' },
		delete       = { text = '_' },
		topdelete    = { text = '‾' },
		changedelete = { text = '~' },
		untracked    = { text = '┆' },
	},
	signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
	numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true
	},
	auto_attach = true,
	attach_to_untracked = true,
	current_line_blame = true,  -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm = {
		enable = false
	},
}
