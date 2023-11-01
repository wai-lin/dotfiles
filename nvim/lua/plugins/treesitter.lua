
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "all",
		auto_install = true,
		indent = { enable = true },
		hightlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		context_commentstring = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["if"] = "@function.inner",
					["af"] = "@function.outer",
					["ia"] = "@parameter.inner",
					["aa"] = "@parameter.outer",
				},
			},
		},
	})
end, 0)

