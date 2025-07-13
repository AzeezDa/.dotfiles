return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        indent = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        { "<leader>bd", function() Snacks.bufdelete() end,          desc = "Delete Buffer" },
        { "<leader>br", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        { "<leader>D",  function() Snacks.dashboard() end,          desc = "Rename File" },
    },
}
