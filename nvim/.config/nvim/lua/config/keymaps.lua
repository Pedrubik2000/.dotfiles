-- Telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<leader>fc", function()
  builtin.find_files {
    cwd = vim.fn.stdpath("config")
  }
end)
vim.keymap.set("n", "<leader>ex", ":Ex <CR>")
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Cuando esta highlight mueve todo a la vez
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"+d")
vim.keymap.set("v", "<leader>d", "\"+d")

vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)
vim.keymap.set('i', '<C-l>', '<CR><Esc>O')
vim.keymap.set('i', '{', '{}<kLeft>')
vim.keymap.set('i', '[', '[]<kLeft>')
vim.keymap.set('i', '(', '()<kLeft>')
vim.keymap.set('i', "'", "''<kLeft>")
vim.keymap.set('i', '"', '""<kLeft>')
vim.keymap.set("i", "`", "``<kLeft>")
