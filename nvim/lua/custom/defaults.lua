-- ========================================
-- vim defaults
-- ========================================

local opt = vim.opt
local g = vim.g

-- line numbers
opt.relativenumber = true

-- scroll offsets
opt.scrolloff = 10
opt.sidescrolloff = 10

-- identation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.breakindent = true
-- Whether to replace "TAB" with "SPACE" character
-- true: replace with "SPACE"
-- false: just as it is
opt.expandtab = false


-- ========================================
-- Snippets
-- ========================================
g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/snippets/vscode"
-- g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/snippets/lua_snippets"
