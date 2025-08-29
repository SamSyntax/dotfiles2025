return {
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup({
        menu = { width = vim.api.nvim_win_get_width(0) - 20 },
      })
    end,
  },

  -- Go
  {
    "olexsmir/gopher.nvim",
    enabled = false,
    lazy = false,
    config = function()
      require("gopher").setup({
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
          iferr = "iferr",
        },
      })
    end,
    ft = "go",
  },
  -- Elixir
  { "elixir-editors/vim-elixir", ft = { "elixir", "eelixir", "heex", "surface" } },
  {
    "mhanberg/elixir.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("elixir").setup()
    end,
    ft = { "elixir", "eelixir", "heex", "surface" },
  },

  {
    "dawsers/telescope-file-history.nvim",
    config = function()
      require("telescope").load_extension("file_history")
    end,
  },

  -- SQL
  "nanotee/sqls.nvim",

  -- Secrets
  "laytan/cloak.nvim",

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_browser = ""
      vim.g.mkdp_open_to_the_world = 0
    end,
  },
  -- LaTeX
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-file-line-error",
          "-synctex=1",
        },
      }
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_syntax_conceal_disable = 1
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_view_zathura = {
        options = "--synctex-forward-search @tex @line @pdf",
        copy_sync = 1,
        refresh_rate = 60,
      }
    end,
  },

  -- Which-key (optional)
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>l", group = "latex" },
      },
    },
  },

  -- C#
  "Hoffs/omnisharp-extended-lsp.nvim",

  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "mbbill/undotree",

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({})
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "nvim-neotest/nvim-nio" },
  { "microsoft/vscode-htmlhint", ft = { "html" } },
  { "mpeterv/luacheck" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- use HEAD, not a release tag
    build = ":TSUpdate", -- you can still run :TSUpdate manually
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "go",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "scss",
          "toml",
          "tsx",
          "typescript",
          "yaml",
          "zig",
          "c_sharp",
          "latex",
        },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = false, -- ← disable installing missing parsers
        sync_install = false, -- ← disable synchronous installs
        -- any other modules you need…
      })
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- already in your list, that's fine
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfile = false,
            hide_gitignored = false,
          },
        },
      })
    end,
  },
  { "rafamadriz/friendly-snippets" },
  { "js-everts/cmp-tailwind-colors" },
  { "roobert/tailwindcss-colorizer-cmp.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "mattn/emmet-vim" },
  {
    "laytan/cloak.nvim",
    config = function()
      require("cloak").setup({
        enabled = true,
        cloak_character = "*",
        highlight_group = "Comment",
        cloak_length = nil,
        try_all_patterns = true,
        cloak_telescope = true,
        cloak_on_leave = false,
        patterns = {
          {
            file_pattern = ".env*",
            cloak_pattern = "=.+",
            replace = nil,
          },
        },
      })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- load when you first enter insert mode
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
    },
    config = function()
      -- your existing cmp config can live in user/cmp.lua
      require("user.cmp")
    end,
  },

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        enabled = false, -- Disable scrolling animations
      },
    },
  },

  { "tahayvr/matteblack.nvim", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "matteblack",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- Disable rust_analyzer setup by nvim-lspconfig, as rustaceanvim handles it
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
      },
      setup = {
        rust_analyzer = function()
          return true -- Prevent lspconfig from setting up rust_analyzer
        end,
      },
    },
  },
}
