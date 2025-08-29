-- ~/.config/nvim/lua/user/latex.lua
local lspconfig = require("lspconfig")
local wk        = require("which-key")

-- 2. configure texlab
lspconfig.texlab.setup({
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      build = {
        args = {
          "-pdf", "-interaction=nonstopmode", "-file-line-error",
          "-synctex=1", "%f",
        },
        executable = "latexmk",
        forwardSearchAfter = true,
        onSave = true,
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  },
})

-- 3. treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = { "latex" },
  highlight = { enable = true },
  ignore_install = {},
  sync_install = true,
  modules = {},
  indent = {
    enable = true,
  },
  auto_install = false,
})

-- 4. which-key
wk.add({
  { "<leader>l",  group = "LaTeX" },
  { "<leader>lc", "<cmd>VimtexCompile<CR>",   desc = "Compile Document" },
  { "<leader>lv", "<cmd>VimtexView<CR>",      desc = "View PDF" },
  { "<leader>ls", "<cmd>VimtexTocToggle<CR>", desc = "Toggle TOC" },
  { "<leader>ll", "<cmd>VimtexErrors<CR>",    desc = "Show Errors" },
  { "<leader>lq", "<cmd>VimtexStop<CR>",      desc = "Stop Compilation" },
  { "<leader>lx", "<cmd>VimtexClean<CR>",     desc = "Clean Aux Files" },
  { "<leader>lr", "<cmd>VimtexCompileSS<CR>", desc = "Recompile" },
})
