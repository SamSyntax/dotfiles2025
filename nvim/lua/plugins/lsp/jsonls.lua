-- ~/.config/nvim/lua/user/lsp/jsonls.lua
local lspconfig = require("lspconfig")

-- Configure jsonls
lspconfig.jsonls.setup({
  on_attach    = function() end, -- add your common_on_attach here
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
