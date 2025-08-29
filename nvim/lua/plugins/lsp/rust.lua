-- ~/.config/lvim/lua/user/lsp/rust.lua
local function enable_pretty_inlay_hints(bufnr)
  local client = vim.lsp.get_clients({ bufnr = bufnr })[1]
  if not client then
    return
  end

  local ns = vim.api.nvim_create_namespace("PrettyInlayHints")
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  client.request("textDocument/inlayHint", {
    textDocument = vim.lsp.util.make_text_document_params(bufnr),
    range = {
      start = { line = 0, character = 0 },
      ["end"] = {
        line = vim.api.nvim_buf_line_count(bufnr),
        character = 0,
      },
    },
  }, function(err, result)
    if err or not result then
      return
    end
    for _, hint in ipairs(result) do
      local label = hint.label
      if type(label) == "string" then
        if hint.kind == 2 then -- Parameter hint
          label = "<- " .. label
        elseif hint.kind == 1 then -- Type hint
          label = "=> " .. label
        end
      elseif type(label) == "table" then
        -- Concatenate label parts if it's a table
        local str = ""
        for _, part in ipairs(label) do
          str = str .. part.value
        end
        if hint.kind == 2 then
          label = "<- " .. str
        elseif hint.kind == 1 then
          label = "=> " .. str
        else
          label = str
        end
      end

      vim.api.nvim_buf_set_extmark(bufnr, ns, hint.position.line, hint.position.character, {
        virt_text = { { label, "Comment" } },
        virt_text_pos = "eol",
      })
    end
  end, bufnr)
end

-- Setup rustaceanvim
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      -- Enable pretty inlay hints
      enable_pretty_inlay_hints(bufnr)

      -- Refresh hints on save or cursor hold
      vim.api.nvim_create_autocmd({ "BufWritePost", "CursorHold" }, {
        buffer = bufnr,
        callback = function()
          enable_pretty_inlay_hints(bufnr)
        end,
      })

      -- Keymaps for Rust
      local opts = { buffer = bufnr, silent = true }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rr", "<cmd>RustLsp runnables<CR>", opts)
      vim.keymap.set("n", "<leader>rd", "<cmd>RustLsp debuggables<CR>", opts)
    end,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = true,
        check = { command = "clippy" },
        cargo = { allFeatures = true },
        procMacro = { enable = true },
        diagnostics = { enable = true },
        inlayHints = {
          bindingModeHints = { enable = true },
          chainingHints = { enable = true },
          closingBraceHints = { enable = true },
          closureReturnTypeHints = { enable = "always" },
          lifetimeElisionHints = {
            enable = "always",
            useParameterNames = true,
          },
          parameterHints = { enable = true },
          reborrowHints = { enable = "always" },
          typeHints = { enable = true },
        },
      },
    },
  },
}
