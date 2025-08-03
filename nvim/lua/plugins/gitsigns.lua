return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup {
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                -- Actions
                map('n', '<leader>ghs', gitsigns.stage_hunk)
                map('n', '<leader>ghr', gitsigns.reset_hunk)

                map('v', '<leader>ghs', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)

                map('v', '<leader>ghr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)

                map('n', '<leader>ghp', gitsigns.preview_hunk)
                map('n', '<leader>ghi', gitsigns.preview_hunk_inline)

                map('n', '<leader>ghb', function()
                    gitsigns.blame_line({ full = true })
                end)

                map('n', '<leader>gd', gitsigns.diffthis)

                map('n', '<leader>gD', function()
                    gitsigns.diffthis('~')
                end)

                map('n', '<leader>ghQ', function() gitsigns.setqflist('all') end)
                map('n', '<leader>ghq', gitsigns.setqflist)

                -- Toggles
                map('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
                map('n', '<leader>gtw', gitsigns.toggle_word_diff)

                -- Text object
                map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
            end
        }
    end
}
