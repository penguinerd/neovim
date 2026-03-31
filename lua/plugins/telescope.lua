return {
	'nvim-telescope/telescope.nvim', 
	tag = 'v0.2.0',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')

		-- <space> binds
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope system find files' })
		vim.keymap.set('n', '<leader>gf', function()
			-- fallback if not in git repo
			local ok = pcall(builtin.git_files)
			if not ok then
				builtin.find_files()
			end
		end, { desc = 'Telescope git find files' })
		vim.keymap.set('n', '<leader>fp', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end, { desc = 'Telescope find project via grep search' })

		-- : binds
		vim.api.nvim_create_user_command('FF', builtin.find_files, { desc = 'Telescope system find files' })
		vim.api.nvim_create_user_command('GF', function()
			-- fallback if not in git repo
			local ok = pcall(builtin.git_files)
			if not ok then
				builtin.find_files()
			end
		end, { desc = 'Telescope git find files' })
		vim.api.nvim_create_user_command('FP', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end, { desc = 'Telescope find project via grep search' })
	end,
}
