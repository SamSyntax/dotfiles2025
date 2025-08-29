-- ~/.config/nvim/lua/user/lsp/csharp.lua
local lspconfig = require("lspconfig")


lspconfig.omnisharp.setup({
  on_attach = function()
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
  settings = {
    OmniSharp = {
      enableRoslynAnalyzers = true,
      organizeImportsOnFormat = true,
    },
  },
})

-- Which-key mappings
local wk = require("which-key")
wk.add({
  { "<leader>?",  group = "C# Actions" },
  { "<leader>?g", vim.lsp.buf.code_action,                           desc = "Generate Getter/Setter" },
  { "<leader>?c", vim.lsp.buf.code_action,                           desc = "Create Class" },

  { "<leader>d",  group = "debug" },
  { "<leader>dc", function() require("dap").continue() end,          desc = "Continue" },
  { "<leader>di", function() require("dap").step_into() end,         desc = "Step Into" },
  { "<leader>do", function() require("dap").step_over() end,         desc = "Step Over" },
  { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
  { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle UI" },
})

-- Treesitter: ensure C# parser
require("nvim-treesitter.configs").setup({
  ensure_installed = { "c_sharp" },
  auto_install = true,
  ignore_install = {},
  sync_install = true,
  modules = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
