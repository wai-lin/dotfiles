require("custom.defaults")

-- ========================================
-- ========================================
---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,

  telescope = { style = "bordered" },

  tabufline = { enabled = false },

  statusline = {
    theme = "vscode_colored",
    separator_style = "block",
  },
}

M.mappings = require("custom.mappings")

M.plugins = "custom.plugins"

return M

