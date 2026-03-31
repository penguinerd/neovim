-- ("hello from penguinerd")

-- disable netrw (required by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Mapleader Keybind: <space>
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--[[ Project root
vim.keymap.set("n", "<leader>tp", function()
	local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

	if root and root ~= "" then
		vim.cmd("cd " .. root)
		require("nvim-tree.api").tree.change_root(root)
	else
		print("Not inside a git repository")
	end
end, { desc = "Tree + cwd: git root" })
--]]

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Copy Cut 
vim.api.nvim_set_keymap('v', '<C-y>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-x>', '"+d', { noremap = true, silent = true })

-- Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevel = 99
vim.o.foldenable = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup("plugins", {
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
