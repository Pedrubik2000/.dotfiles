return {
   {
      "stevearc/oil.nvim",
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
   },
   {
      "Mofiqul/dracula.nvim",
      opts = {
         transparent_bg = true,
      },
   },
   {
      "f4z3r/gruvbox-material.nvim",
      name = "gruvbox-material",
      lazy = false,
      priority = 1000,
      opts = {
         italics = true, -- enable italics in general
         contrast = "medium", -- set contrast, can be any of "hard", "medium", "soft"
         comments = {
            italics = true, -- enable italic comments
         },
         background = {
            transparent = true, -- set the background to transparent
         },
         float = {
            force_background = false, -- force background on floats even when background.transparent is set
            background_color = nil, -- set color for float backgrounds. If nil, uses the default color set
            -- by the color scheme
         },
         signs = {
            highlight = true, -- whether to highlight signs
         },
      },
   },
   {
      "barrett-ruth/live-server.nvim",
      build = "npm add -g live-server",
      cmd = { "LiveServerStart", "LiveServerStop" },
      config = true,
   },
}
