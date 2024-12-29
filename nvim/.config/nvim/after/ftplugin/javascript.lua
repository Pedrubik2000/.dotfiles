-- Indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.api.nvim_create_autocmd("BufWritePost", {
  buffer = 0,
  command = 'silent! :Tsw'
})
