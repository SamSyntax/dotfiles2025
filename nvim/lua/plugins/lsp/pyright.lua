-- ~/.config/lvim/lua/user/lsp/pyright.lua

local lsp_manager = require("lspconfig")
lsp_manager.pyright.setup({
  on_attach = function() end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})
