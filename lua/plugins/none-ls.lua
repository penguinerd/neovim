return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        -- create an augroup for format-on-save
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
            sources = {
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.eslint,
            },
        })
    end,
}
