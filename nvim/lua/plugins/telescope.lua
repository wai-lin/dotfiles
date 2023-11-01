local actions = require("telescope.actions")

-- Telescope Config
require("telescope").setup({
	defaults = {
		initial_mode = "normal",
		path_display = { truncate = 1 },
		prompt_prefix = "    ",
		selection_cart = "     ",
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		mappings = {
			i = {
				-- ["<ESC>"] = actions.close,
				["<C-Down>"] = actions.cycle_history_next,
				["<C-Up>"] = actions.cycle_history_prev,
			},
		},
		file_ignore_patterns = { ".git/" },
		pickers = {
			find_files = {
				hidden = true,
			},
		},
		buffers = {
			previewer = false,
			layout_config = {
				width = 80,
			},
		},
		oldfiles = {
			prompt_title = "History",
		},
		lsp_references = {
			previewer = false,
		},
	},

	extensions = {
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
		},
	},
})


-- Extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("file_browser")


-- Keymaps
vim.keymap.set("n", "<leader>ff", [[:lua require("telescope.builtin").find_files()<CR>]])
vim.keymap.set("n", "<leader>fF", [[:lua require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "All Files" })<CR>]])
vim.keymap.set("n", "<leader>fb", [[:lua require("telescope.builtin").buffers()<CR>]])
vim.keymap.set("n", "<leader>fB", [[:lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>]])
vim.keymap.set("n", "<leader>fh", [[:lua require("telescope.builtin").oldfiles()<CR>]])
vim.keymap.set("n", "<leader>fs", [[:lua require("telescope.builtin").lsp_document_symbols()<CR>]])

vim.keymap.set("n", "<leader>fg", [[:lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>]])

vim.keymap.set("n", "<leader>fe", [[:Telescope file_browser<CR>]])
vim.keymap.set("n", "<leader>fE", [[:Telescope file_browser path=%:p:h select_buffer=true<CR>]], { noremap = true })
