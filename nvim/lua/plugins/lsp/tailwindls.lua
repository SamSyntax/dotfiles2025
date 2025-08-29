local lspconfig = require("lspconfig")
lspconfig.tailwindcss.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css" },
})

