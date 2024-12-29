return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      vim.env.ESLINT_D_PPID = vim.fn.getpid()
      require('lint').linters_by_ft = {
        javascript = { 'quick-lint-js' },
        typescript = { 'quick-lint-js' },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
      -- Show linters for the current buffer's file type
      vim.api.nvim_create_user_command("LintInfo", function()
        local filetype = vim.bo.filetype
        local linters = require("lint").linters_by_ft[filetype]

        if linters then
          print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
        else
          print("No linters configured for filetype: " .. filetype)
        end
      end, {})
    end
  }
}
