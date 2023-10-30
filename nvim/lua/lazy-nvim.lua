local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Show pop-up for possible key-bindings shortcuts
	{ "folke/which-key.nvim" },

	-- Navigate splits and tmux panels with CTRL + [h,j,k,l]
	{ "christoomey/vim-tmux-navigator" },

	-- Commenting shortcuts
	{ "tpope/vim-commentary" },

	-- Add, change and delete surrounding text
	{ "tpope/vim-surround" },

	-- Unix commands for vim
	{ "tpope/vim-eunuch" },

	-- Indent autodetection with editorconfig support
	{ "tpope/vim-sleuth" },

	-- Repeat command with "."
	{ "tpope/vim-repeat" },

	-- Jump last cursor position when file is opened
	{ "farmergreg/vim-lastplace" },

	-- Search selected text with "*"
	{ "nelstrom/vim-visual-star-search" },

	-- Auto pair brackets and quotes
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end
	},

	-- Add smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end
	},

	-- Split to multiple lines and Join to single line, Arrays and Methods with "gS" and "gJ"
	{
		"AndrewRadev/splitjoin.vim",
		config = function()
			vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
			vim.g.splitjoin_trailing_comma = 1
			vim.g.splitjoin_php_method_chain_full = 1
		end
	},

	-- Auto fix indentation on paste
	{
		"sickill/vim-pasta",
		config = function()
			vim.g.pasta_disabled_filetypes = { "fugitive" }
		end
	},


	-- Catppuccin theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				styles = {
					functions = { "bold" },
					keywords = { "bold", "italic" },
					types = { "bold" },
				},
				custom_highlights = function(colors)
					return {
						Comment = { fg = colors.peach }
					}
				end
			})
			-- Set the theme
			vim.cmd.colorscheme "catppuccin"
		end
	},

	{
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
		  options = {
			icons_enabled = true,
			theme = "catppuccin",
			component_separators = "|",
			section_separators = "",
		  },
		},
	}
})
