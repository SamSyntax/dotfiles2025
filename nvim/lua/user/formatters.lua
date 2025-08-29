local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.mix.with({
      extra_args = { "format", "-" },
    }),
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "yaml",
        "css",
        "scss",
        "json",
        "javascript",
        "typescript",
        "jsx",
        "tsx",
        "svelte",
        "markdown",
        "html",
      },
    }),
    null_ls.builtins.formatting.beautysh,
    null_ls.builtins.formatting.sql_formatter,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.csharpier,
    null_ls.builtins.formatting.terraform_fmt,
  },
})
