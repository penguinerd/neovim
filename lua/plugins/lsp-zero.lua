return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x", 
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		"hrsh7th/nvim-cmp",            
		"hrsh7th/cmp-nvim-lsp",       
		"hrsh7th/cmp-buffer",        
		"hrsh7th/cmp-path",         
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local lsp = require('lsp-zero').preset({})

		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({buffer = bufnr})
		end)

		require("mason").setup({
			ensure_installed = {
				"prettierd",
				"stylua",
				"black",
				"eslint_d"
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"pyright", -- python

				"clangd", -- C/C++

				"ts_ls", -- javascript/typescript
				"tailwindcss",
			},
		})

		lsp.setup()
	
	end
}
