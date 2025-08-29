local lsp_manager = require("lspconfig")

lsp_manager.zls.setup({
  on_attach = function() end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "zig" },
  auto_install = true,
  ignore_install = {},
  sync_install = true,
  modules = {},
})
vim.g.zig_fmt_autosave = 0
