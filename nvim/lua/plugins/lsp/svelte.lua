-- ~/.config/lvim/lua/user/lsp/svelte.lua

local lsp_manager = require("lspconfig")

lsp_manager.svelte.setup({
  on_attach = function() end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
