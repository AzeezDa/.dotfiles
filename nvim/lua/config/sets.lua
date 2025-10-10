vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"
vim.opt.textwidth = 100

vim.opt.isfname:append("@-@")


vim.opt.showmode = false

vim.g.netrw_banner = false
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]() .. [[,.git/]]
vim.g.netrw_liststyle = 3
vim.g.netrw_hide = true
