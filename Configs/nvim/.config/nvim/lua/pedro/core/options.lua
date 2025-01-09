-- Colors
vim.api.nvim_set_hl(0, "NormalFloat", { guibg = none })
vim.api.nvim_set_hl(0, "PMenu", { guibg = none })
vim.api.nvim_set_hl(0, "TelescopeNormal", { guibg = none })
-- Rules
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Wrap
vim.opt.wrap = false

-- Search
vim.opt.hlsearch = false

vim.opt.incsearch = true

-- Terminal gui colors
vim.opt.termguicolors = true

-- Scroll
vim.opt.scrolloff = 8

-- Updatetime
vim.opt.updatetime = 50

-- Map leader
vim.g.mapleader = " "
vim.o.splitright = true

vim.diagnostic.config({ virtual_text = false })

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "",
   command = "set fo-=r fo-=o",
})
local border = "rounded"
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
   opts = opts or {}
   opts.border = opts.border or border
   return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
