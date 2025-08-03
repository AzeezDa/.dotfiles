return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        pcall(require('telescope').load_extension, 'fzf')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope files' })
        vim.keymap.set('n', '<leader>pgf', builtin.git_files, { desc = 'Telescope git files' })
        vim.keymap.set('n', '<leader>pgs', "<cmd>Telescope git_status <CR>", { desc = 'Telescope git status' })
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope grep' })
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = 'Telescope word grep' } )
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = 'Telescope Word grep' } )

        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope keymaps' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Telescope resume' })
        vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = 'Telecope old files' })
        vim.keymap.set('n', '<leader>std', '<cmd> TodoTelescope <CR>', { desc = 'Telescope TODO' })

        vim.keymap.set('n', '<leader>cf', "<cmd> :Telescope find_files cwd=~/.config/nvim<CR>")

    end
}
