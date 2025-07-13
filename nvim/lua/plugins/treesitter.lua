return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").compilers = { "gcc-12" }

        require("nvim-treesitter.configs").setup({
            ensure_installed = { "bash", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

            sync_install = false,
            auto_install = false,
            ignore_install = {},
            modules = {},

            highlight = {
                enable = true,

                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>tn",
                    node_incremental = "<leader>ti",
                    scope_incremental = "<leader>ts",
                    node_decremental = "<leader>td",
                },
            },
        })
    end
}
