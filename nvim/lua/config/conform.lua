require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    go = { "gofmt" },
    -- etc…
  },
  format_on_save = false, -- or false if you prefer manual
})
