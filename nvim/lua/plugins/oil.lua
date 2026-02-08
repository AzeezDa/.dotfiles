return {
	"stevearc/oil.nvim",
	tag = "v2.15.0",
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, bufnr)
					return name:match("^%.%.")
				end,
			},
		})

		-- For opening oil
		vim.keymap.set("n", "-", "<cmd>Oil<CR>")
		vim.keymap.set("n", "<leader>cv", "<cmd>Oil ~/.config/nvim<CR>")
	end,
}
