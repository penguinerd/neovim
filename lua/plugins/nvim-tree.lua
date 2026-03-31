return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", 
	},
	version = "*",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
						folder_arrow = true,
					},
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
			git = {
				enable = true,
			},
		})
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
		vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { silent = true })

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				require("nvim-tree.api").tree.open()
			end,
		})

	end,
}
