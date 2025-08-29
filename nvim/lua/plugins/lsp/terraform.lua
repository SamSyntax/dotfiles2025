local lsp_manager = require("lspconfig")

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "terraformls" })

lsp_manager.terraformls.setup({
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "tf", "terraform-vars" },
  root_dir = require("lspconfig.util").root_pattern(".terraform", ".git"),
  settings = {
    terraformls = {
      experimentalFeatures = {
        validateOnSave = true,
        prefillRequiredFields = true,
      },
    },
  },
})
