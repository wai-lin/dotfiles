-- Setup Mason to automatically install LSP servers
require("mason").setup()
require("mason-lspconfig").setup()

-- ========================================
-- Add border to PopUp UI
-- ========================================
-- Unicode Chars from: https://jrgraphix.net/r/Unicode/2500-257F
local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- ========================================
-- LSP Servers
-- ========================================
local servers = {
	intelephense = {},
	denols = {},
	tailwindcss = {},
	jsonls = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- require("neodev").setup()

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		local setup = servers[server_name]
		require("lspconfig")[server_name].setup(setup)
	end,
})

-- ========================================
-- Keymaps
-- ========================================
vim.keymap.set("n", "<leader>d", [[:lua vim.diagnostic.open_float()<CR>]])
vim.keymap.set("n", "[d", [[:lua vim.diagnostic.goto_prev({ float = { border = "rounded" } })<CR>]])
vim.keymap.set("n", "]d", [[:lua vim.diagnostic.goto_next({ float = { border = "rounded" } })<CR>]])

vim.keymap.set("n", "gi", [[:Telescope lsp_implementations<CR>]])
vim.keymap.set("n", "gr", [[:Telescope lsp_references<CR>]])

vim.keymap.set("n", "K", [[:lua vim.lsp.buf.hover()<CR>]])
vim.keymap.set("n", "gd", [[:lua vim.lsp.buf.definition()<CR>]])
vim.keymap.set("n", "ws", [[:lua vim.lsp.buf.lsp_dynamic_workspace_symbols()<CR>]])
vim.keymap.set("n", "<leader>rn", [[:lua vim.lsp.buf.rename()<CR>]])
vim.keymap.set("n", "<leader>ca", [[:lua vim.lsp.buf.code_action()<CR>]])

