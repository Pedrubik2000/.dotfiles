return {
   "folke/lazydev.nvim",
   ft = "lua", -- only load on lua files
   opts = {
      library = {
         -- See the configuration section for more details
         -- Load luvit types when the `vim.uv` word is found
         { path = "${3rd}/luv/library", words = { "vim%.uv" } },
         vim.api.nvim_get_runtime_file("", true),
         vim.env.VIMRUNTIME,
         "${3rd}/busted/library",
      },
   },
}
