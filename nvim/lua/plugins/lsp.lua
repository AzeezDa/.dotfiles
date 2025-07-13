return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls"
            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                vim.keymap.set('n', 'K', function()
                    vim.lsp.buf.hover {
                        border = 'rounded',
                    }
                end, { buffer = event.buf })
                vim.keymap.set('n', '<leader>ff', function()
                    vim.lsp.buf.format({ async = true })
                end, { buffer = event.buf })
                vim.keymap.set('n', '<leader>lh', function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end, { buffer = event.buf })
                vim.lsp.inlay_hint.enable(true)
                vim.lsp.codelens.refresh();
                vim.diagnostic.config({
                    underline = true,
                    update_in_insert = true,
                    float = {
                        focusable = false,
                        style = "minimal",
                        border = "rounded",
                        source = true,
                        header = "",
                        prefix = ""
                    }
                })
            end,

        })

        vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost', 'TextChanged' }, {
            callback = function()
                vim.schedule(function()
                    vim.lsp.codelens.refresh();
                end)
            end
        })
    end
}
