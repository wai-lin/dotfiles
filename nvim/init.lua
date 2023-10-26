-- ==================================================
-- Vim Default Override Configs
-- ==================================================

-- Override leader to make sure it is <SPACE>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable line numbers and relative numbers
vim.o.number = true
vim.o.relativenumber = true

-- Reduce identation width size
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Enable break indent
vim.o.breakindent = true

-- Enable highlight groups
vim.opt.termguicolors = true

-- Disable highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard with OS
vim.o.clipboard = "unnamedplus"

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or Capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set better completion experience
vim.o.completeopt = "menuone,noselect"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- ==================================================
-- NETRW Configs
-- ==================================================

-- Default to current directory
vim.g.netrw_keepdir = 0

-- Enable recursive directory copy
vim.g.netrw_localcopydircmd = "cp -r"


-- ==================================================
-- Key Mappings
-- ==================================================

vim.keymap.set("i", "jk", "<ESC>", { silent = true, desc = "Lazy vim escape" })
vim.keymap.set("n", ";", ":", { desc = "Lazy vim command mode" })
