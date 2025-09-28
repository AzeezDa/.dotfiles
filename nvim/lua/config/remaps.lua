-- For opening netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>cv", "<cmd>Ex ~/.config/nvim<CR>")

-- Moving visual selected up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centering when going up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste/delete but don't save overwritten to the yank register
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Switch between vim windows
vim.keymap.set("n", "<tab>", "<C-w>w")

-- Easier exit from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.api.nvim_create_user_command('W', 'write', {})
