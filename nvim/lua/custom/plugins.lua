return {
  -- Repeat command with "."
  { "tpope/vim-repeat" },

  -- Auto fix indentation on paste
  {
    "sickill/vim-pasta",
    config = function()
      vim.g.pasta_disabled_filetypes = { "fugitive" }
    end,
  },

  -- Unix commands for vim
  { "tpope/vim-eunuch", opts = {} },

  -- lsp spinner
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
    },
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "b0o/schemastore.nvim",
    },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "deno",
        "stylua",
        "phpactor",
        "intelephense",
        "emmet-language-server",
        "pint",
        "blade-formatter",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
