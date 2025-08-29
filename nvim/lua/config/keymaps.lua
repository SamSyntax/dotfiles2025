-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Navigate Left" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Navigate Down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Navigate Up" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Navigate Right" })

-- ~/.config/nvim/lua/user/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- DAP (debug) ---------------------------------------------------------------
-- Register under <leader>d
local wk = require("which-key")
wk.add({
  { "<leader>d", group = "debug" },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
  },
  {
    "<leader>du",
    function()
      require("dapui").toggle()
    end,
    desc = "Toggle UI",
  },
})

-- General -------------------------------------------------------------------
map("n", "<leader>gf", function()
  vim.lsp.buf.format({ async = true })
end, opts)

map("n", ",", function()
  vim.lsp.buf.code_action()
end, opts)

-- Buffer-kill (replace with your preferred close-buffer command)
map("n", "<A-w>", ":bdelete<CR>", opts)

-- Harpoon --------------------------------------------------------------------
map("n", "<C-m>", function()
  require("harpoon.mark").add_file()
end, opts)
map("n", "<C-o>", function()
  require("harpoon.ui").toggle_quick_menu()
end, opts)
map("n", "<leader>1", function()
  require("harpoon.ui").nav_file(1)
end, opts)
map("n", "<leader>2", function()
  require("harpoon.ui").nav_file(2)
end, opts)
map("n", "<leader>3", function()
  require("harpoon.ui").nav_file(3)
end, opts)
map("n", "<leader>4", function()
  require("harpoon.ui").nav_file(4)
end, opts)
map("n", "<leader>5", function()
  require("harpoon.ui").nav_file(5)
end, opts)

-- Movement in Insert mode -----------------------------------------------------
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-l>", "<Right>", opts)

-- Telescope ------------------------------------------------------------------
map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep({ hidden = true })
end, opts)

map("n", "<leader><leader>", function()
  require("telescope.builtin").live_grep({ hidden = true })
end, opts)

map("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    hidden = true,
    no_ignore = true,
    cwd = vim.fn.expand("%:p:h"),
  })
end, opts)

-- Select all in Normal mode --------------------------------------------------
map("n", "<C-s>", function()
  local save_pos = vim.fn.getpos(".")
  vim.cmd("normal! ggVG")
  vim.fn.setpos(".", save_pos)
end, opts)

-- Undo tree ------------------------------------------------------------------
map("n", "<leader>bq", "<cmd>UndotreeToggle<CR>", opts)

vim.keymap.set(
  "n",
  "<leader>e",
  "<cmd>Neotree toggle<CR>",
  { noremap = true, silent = true, desc = "Neo-tree Explorer" }
)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })

-- Next/prev buffer
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

-- Close buffer
vim.keymap.set("n", "<A-w>", "<cmd>BufferLineCycleNext<CR>:bdelete #<CR>", { desc = "Delete buffer and go to next" })

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
end, { silent = true, buffer = bufnr })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.keymap.set(
      "n",
      "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
      function()
        vim.cmd.RustLsp({ "hover", "actions" })
      end,
      { silent = true, buffer = 0 }
    )
  end,
})
