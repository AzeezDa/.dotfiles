return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        indent = { enabled = true },
        dashboard = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
    },
    keys = {
        { "<leader>br", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        { "<leader>D",  function() Snacks.dashboard() end,          desc = "Dashboard" },
    },
}
