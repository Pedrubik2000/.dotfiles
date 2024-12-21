return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				'folke/lazydev.nvim',
                ft = "lua",
				opts = {
					library = {
						vim.env.VIMRUNTIME,
						"${3rd}/luv/library",
						"${3rd}/busted/library",
					},
				},
			},
		},
		config = function()

			local lspconfig = require("lspconfig")
			local capabilities = require('blink.cmp').get_lsp_capabilities()
			lspconfig.ts_ls.setup {}
			lspconfig.lua_ls.setup {
				capabilities = capabilities
			}
		end,
	}
}
