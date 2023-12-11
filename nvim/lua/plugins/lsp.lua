-- LSP Support
return {
	-- LSP Configuration
	"neovim/nvim-lspconfig",
	event = 'VeryLazy',
	dependencies = {
		-- LSP Manager Plugins
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Useful status updates for LSP
		{ "j-hui/fidget.nvim",                opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		{ "folke/neodev.nvim" },

		-- JSON schema store
		{ "b0o/schemastore.nvim" },
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			-- Update this list to the language servers you need installed
			ensure_installed = {
				"bashls", -- requires npm to be installed
				"cssls", -- requires npm to be installed
				"html", -- requires npm to be installed
				"lua_ls",
				"intelephense", -- requires npm to be installed
				"jsonls", -- requires npm to be installed
				"tsserver", -- requires npm to be installed
				"volar", -- requires npm to be installed
				"yamlls", -- requires npm to be installed
			},
		})

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp_attach = function(client, bufnr)
			-- Create your keybindings here...
		end

		-- Call setup on each LSP server
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local opts = {
					on_attach = lsp_attach,
					capabilities = lsp_capabilities,
				}

				if (server_name == "jsonls") then
					opts.settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
						},
					}
				end

				lspconfig[server_name].setup(opts)
			end
		})

		-- Lua LSP settings
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		}
	end
}
