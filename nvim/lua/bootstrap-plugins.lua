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

-- Install Plugins
require("lazy").setup({
	-- Catppuccin theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
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
				end,
			})
			-- Set the theme
			vim.cmd.colorscheme "catppuccin"
		end,
	},

	-- Better Syntax highlighting with Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",

			{ -- LSP Indicator
				'j-hui/fidget.nvim',
				lazy = false,
				event = "LspAttach",
				tag = "legacy",
				opts = {},
			},
		},
	},

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
		end,
	},

	-- Add smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},

	-- Split to multiple lines and Join to single line, Arrays and Methods with "gS" and "gJ"
	{
		"AndrewRadev/splitjoin.vim",
		config = function()
			vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
			vim.g.splitjoin_trailing_comma = 1
			vim.g.splitjoin_php_method_chain_full = 1
		end,
	},

	-- Auto fix indentation on paste
	{
		"sickill/vim-pasta",
		config = function()
			vim.g.pasta_disabled_filetypes = { "fugitive" }
		end,
	},

	-- Editor status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"catppuccin/nvim",
			"kyazdani42/nvim-web-devicons",
		},
		-- See `:help lualine.txt`
		opts = {
		  options = {
			globalstatus = true,
			icons_enabled = true,
			theme = "catppuccin",
			component_separators = "",
			section_separators = "",
		  },
		},
	},

	-- All in one finder/explorer/browser
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- Show icons
			"nvim-telescope/telescope-live-grep-args.nvim", -- search file content
			"nvim-telescope/telescope-file-browser.nvim", -- browser files
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fuzzy find
		},
	},

	-- Git integrations
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_formatter = "<author>, <author_time:%b/%d/%Y %a %I:%M %p> - <summary>",
			})

			vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>")
			vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>")
			vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
			vim.keymap.set("n", "<leader>gS", ":Gitsigns undo_stage_hunk<CR>")
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
			vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>")
		end,
	},

	-- Floating Terminal
	{
		"voldikss/vim-floaterm",
		config = function()
			vim.g.floaterm_width = 0.8
			vim.g.floaterm_height = 0.8

			vim.keymap.set("n", "<F1>", ":FloatermToggle<CR>")
			vim.keymap.set("t", "<F1>", "<C-\\><C-n>:FloatermToggle<CR>")
		end,
	},

}, {})

require("plugins.telescope")
require("plugins.treesitter")
require("lspconfig._lsp")
