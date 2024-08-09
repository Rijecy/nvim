return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function ()
  	local wk = require("which-key")
	wk.add({
  		{ "<leader>f", group = "file" }, -- group
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
		{ "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", mode = "n" },
		{
    		mode = { "n", "v" }, -- NORMAL and VISUAL mode
		    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
		    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
		}
})
  end
}
