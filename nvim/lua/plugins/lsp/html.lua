-- ~/.config/nvim/lua/user/lsp/html.lua
local lspconfig = require("lspconfig")

-- Configure html-lsp
lspconfig.html.setup({
  on_attach    = function() end, -- add your common_on_attach here
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
