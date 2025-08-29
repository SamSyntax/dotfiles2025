local lspconfig = require("lspconfig")

-- golangci-lint language server
lspconfig.golangci_lint_ls.setup({
  on_init = function() end,          -- add your common_on_init here
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- gopls
lspconfig.gopls.setup({
  on_attach = function(bufnr)
    -- common_on_attach equivalent
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    end

    -- Go-specific keymaps
    map("n", "<leader>Ci", "<cmd>GoInstallDeps<CR>", "Install Go Dependencies")
    map("n", "<leader>Ct", "<cmd>GoMod tidy<CR>", "Tidy")
    map("n", "<leader>Ca", "<cmd>GoTestAdd<CR>", "Add Test")
    map("n", "<leader>CA", "<cmd>GoTestsAll<CR>", "Add All Tests")
    map("n", "<leader>Ce", "<cmd>GoTestsExp<CR>", "Add Exported Tests")
    map("n", "<leader>Cg", "<cmd>GoGenerate<CR>", "Go Generate")
    map("n", "<leader>Cf", "<cmd>GoGenerate %<CR>", "Go Generate File")
    map("n", "<leader>Cc", "<cmd>GoCmt<CR>", "Generate Comment")
    map("n", "<leader>DT", function() require("dap-go").debug_test() end, "Debug Test")

    -- Refresh codelens
    pcall(vim.lsp.codelens.refresh)
  end,
  on_init = function() end,          -- add your common_on_init here
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
})
