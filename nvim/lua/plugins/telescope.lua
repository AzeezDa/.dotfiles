return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files)
        vim.keymap.set('n', '<leader>pgf', builtin.git_files)
        vim.keymap.set('n', '<leader>pgs', "<cmd>Telescope git_status <CR>")
        vim.keymap.set('n', '<leader>ps', builtin.live_grep)
        vim.keymap.set('n', '<leader>pb', builtin.buffers)
        vim.keymap.set('n', '<leader>ph', builtin.help_tags)
        vim.keymap.set('n', '<leader>cf', "<cmd> :Telescope find_files cwd=~/.config/nvim<CR>")
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>lr', builtin.lsp_references)
        vim.keymap.set('n', '<leader>lic', builtin.lsp_incoming_calls)
        vim.keymap.set('n', '<leader>loc', builtin.lsp_outgoing_calls)
        vim.keymap.set('n', '<leader>lds', builtin.lsp_document_symbols)
        vim.keymap.set('n', '<leader>lss', builtin.lsp_dynamic_workspace_symbols)
        vim.keymap.set('n', '<leader>ld', builtin.diagnostics)
    end
}
