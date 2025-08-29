-- ~/.config/lvim/lua/user/lsp/yamlls.lua
local lsp_manager = require("lspconfig")

lsp_manager.yamlls.setup({
  on_attach = function() end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
