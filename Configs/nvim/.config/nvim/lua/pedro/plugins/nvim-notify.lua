return {
  'rcarriga/nvim-notify',
  lazy = false,
  priority = 1000,
  opts = {
    background_colour = "#000000",
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
  end,
}
