local lsp_manager = require("lspconfig")
local common = {
  on_attach = function() end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
lsp_manager.clangd.setup(vim.tbl_extend("force", common, {
  filetypes = { "c", "cpp", "objc", "objcpp" },
}))
