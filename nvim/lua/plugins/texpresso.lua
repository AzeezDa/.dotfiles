return {
    "let-def/texpresso.vim",
    config = function()
        require('texpresso').texpresso_path = "/home/azeez/apps/texpresso/build/texpresso";
        vim.keymap.set('n', '<leader>tex', "<cmd>TeXpresso % <CR>")
    end
}
