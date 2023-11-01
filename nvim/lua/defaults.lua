-- ==================================================
-- Vim Default Override Configs
-- ==================================================

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Identation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true
-- Whether to replace "TAB" with "SPACE" character
-- true: replace with "SPACE"
-- false: just as it is
vim.opt.expandtab = false

-- Line wrapping
vim.opt.wrap = false

-- Vim cmd completion, complete the longest common match.
-- And allow tabbing the results to fully complete theme.
vim.opt.wildmode = "longest:full,full"

vim.opt.title = true -- Pass vim title to multiplexer like tmux
vim.opt.mouse = "a" -- Enable mouse mode

-- Enable more colors for modern terminal apps.
vim.opt.termguicolors = true

-- Enable spelling checking
vim.opt.spell = true

-- Searching
vim.opt.ignorecase = true -- Case-insensitive searching 
vim.opt.smartcase = true -- UNLESS \C or Capital in search
vim.opt.hlsearch = true -- Highlight on search

-- White-space Rendering
vim.opt.list = true -- Enable white-space rendering
vim.opt.listchars = { tab = " " , trail = "." } -- tab = "󰌒 ", enter = "󰘌"
vim.opt.fillchars:append({ eob = " " }) -- remove ~ from end of buffer

-- Window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Scroll offset
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Confirm before quit
vim.opt.confirm = true

-- Save persistent undo history
vim.opt.undofile = true

-- Save backup file
vim.opt.backup = true

-- Keep backup out of current directory
vim.opt.backupdir:remove(".")

-- Set better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Reserve space for signcolumn
-- this prevent UI from jumping when signcolumn appear and disappear
vim.opt.signcolumn = "yes:1"
