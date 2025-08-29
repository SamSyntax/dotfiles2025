require("lint").linters_by_ft = {
  python = { "flake8" },
  javascript = { "eslint" },
  lua = { "luacheck" },
  -- etc…
}
-- optionally auto-lint on save:
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
