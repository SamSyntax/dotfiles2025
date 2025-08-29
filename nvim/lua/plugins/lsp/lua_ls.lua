-- ~/.config/lvim/lua/user/lsp/lua_ls.lua

local lsp_manager = require("lspconfig")

lsp_manager.lua_ls.setup({
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim', 'lvim' } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})
