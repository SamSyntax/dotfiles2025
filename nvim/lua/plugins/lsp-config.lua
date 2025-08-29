return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      require("cmp-nvim-lsp").setup()
    end,
  },
}
