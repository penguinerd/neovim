-- plugins/undotree.lua
return {
	'mbbill/undotree',
	lazy = false,  -- load immediately
	keys = {
		{ "<F5>", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
	},
	config = function()
		-- enable persistent undo
		vim.opt.undofile = true

		-- set undo directory
		local undo_dir = vim.fn.stdpath("data") .. "/undo"
		vim.opt.undodir = undo_dir

		-- make sure the undo directory exists
		vim.fn.mkdir(undo_dir, "p")
	end,
}
