return {
   "mfussenegger/nvim-lint",
   config = function()
      local shellcheck = require("lint").linters.shellcheck
      shellcheck.args = {
         "-x",
         "--format",
         "json",
         "-",
      }
      require("lint").linters_by_ft = {
         lua = { "luacheck" },
         bash = { "bash", "shellcheck" },
         javascript = { "biomejs" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
         callback = function()
            require("lint").try_lint()
         end,
      })
   end,
}
