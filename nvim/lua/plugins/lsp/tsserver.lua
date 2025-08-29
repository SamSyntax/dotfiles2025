-- ~/.config/lvim/lua/user/lsp/tsserver.lua

local lsp_manager = require("lspconfig")

lsp_manager.ts_ls.setup({
  on_attach = function() end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
})
