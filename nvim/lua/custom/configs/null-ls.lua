local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
-- local lint = null_ls.builtins.diagnostics

local sources = {
  -- lua
  formatting.stylua,
  -- html, css, js
  formatting.prettierd,
  formatting.deno_fmt,
  -- php
  formatting.blade_formatter.with {
    filetypes = { "blade", "php" },
  },
  formatting.pint,

  -- lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
