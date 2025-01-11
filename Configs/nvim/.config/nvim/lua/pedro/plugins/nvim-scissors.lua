return {
   "chrisgrieser/nvim-scissors",
   cmd = {
      "ScissorsAddNewSnippet",
      "ScissorsEditSnippet",
   },
   dependencies = "nvim-telescope/telescope.nvim",
   opts = {
      snippetDir = "~/.dotfiles/Configs/snippets/snippets/",
      backdrop = {
         enabled = false,
      },
   },
}
