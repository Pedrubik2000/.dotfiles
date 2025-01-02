return{
	"chrisgrieser/nvim-scissors",
  cmd = {
    "ScissorsAddNewSnippet",
    "ScissorsEditSnippet"
  },
	dependencies = "nvim-telescope/telescope.nvim", 
	opts = {
		snippetDir = "../snippets",
    backdrop = {
      enabled = false,
    }
	} 
}
