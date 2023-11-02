-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "Lazy escape mode" },
    [";;"] = { "<ESC>A;", "Lazy semicolon" },
    [",,"] = { "<ESC>A,", "Lazy comman" },
  },

  n = {
    [";"] = { ":", "Lazy command mode" },
  }
}

M.tabufline = {
  plugin = false,
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fs"] = { ":Telescope lsp_document_symbols<CR>", "Find symbols from current buffer" },
  }
}

return M
