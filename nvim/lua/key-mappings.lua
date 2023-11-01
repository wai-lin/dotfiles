-- ==================================================
-- Key Mappings
-- ==================================================

-- <SPACE> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection.
vim.keymap.set("v", "y", "myy`y")

-- Disable showing history and annoying typo quit
vim.keymap.set("n", "q:", ":q")

-- Paste replace visual selection without copying it
vim.keymap.set("v", "p", '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set("i", ";;", "<ESC>A;")
vim.keymap.set("i", ",,", "<ESC>A,")

-- Quickly clear search highlight
vim.keymap.set("n", "<leader>hk", ":nohlsearch<CR>")

-- Open the current file in the default program ( Mac: open, Linux: xdg-open ).
vim.keymap.set("n", "<leader>x", ":!open %<CR><CR>")

-- Close current buffer
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")

-- Move lines up and down
vim.keymap.set("i", "<A-j>", "<ESC>:move .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<ESC>:move .-2<CR>==gi")
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Lazy ESC key
vim.keymap.set("i", "jk", "<ESC>", { silent = true, desc = "Lazy vim escape Insert Mode" })
vim.keymap.set("v", "<leader>;", "<ESC>", { silent = true, desc = "Lazy vim escape Visual Mode" })
vim.keymap.set("n", ";", ":", { desc = "Lazy vim command mode" })
