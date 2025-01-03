vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzz", { desc = "Find next and center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Find previous and center" })
vim.keymap.set("n", "G", "Gzz", { desc = "Go to end of file and center" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank from cursor to end of line to system clipboard" })

-- vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
-- vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
-- vim.keymap.set('n', 'grr', vim.lsp.buf.references)
-- vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)

vim.keymap.set("i", "<C-l>", "<CR><Esc>O")
vim.keymap.set("i", "{", "{}<kLeft>")
vim.keymap.set("i", "[", "[]<kLeft>")
vim.keymap.set("i", "(", "()<kLeft>")
vim.keymap.set("i", "'", "''<kLeft>")
vim.keymap.set("i", '"', '""<kLeft>')
vim.keymap.set("i", "`", "``<kLeft>")

vim.keymap.set("n", "<leader>tf", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>tg", ":Telescope live_grep<CR>", { desc = "Pick live grep" })
vim.keymap.set("n", "<leader>th", ":Telescope help_tags<CR>", { desc = "Pick help" })

vim.keymap.set({ "n", "v" }, "<leader>sa", ":ScissorsAddNewSnippet<CR>", { desc = "Add new snippet" })
vim.keymap.set("n", "<leader>se", ":ScissorsEditSnippet<CR><Esc>", { desc = "Edit snippets" })
