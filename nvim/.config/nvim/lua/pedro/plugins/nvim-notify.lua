return {
  'rcarriga/nvim-notify',
  lazy = false,
  priority = 1000,
  init = function()
    vim.notify = require("notify")
  end
}
