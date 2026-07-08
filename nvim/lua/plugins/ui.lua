return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			-- Enable True Color support inside the setup function
			vim.opt.termguicolors = true

			-- Configure Rose Pine Moon
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					transparency = true, -- Matches WezTerm transparency if you use it
				},
			})

			-- Load the theme
			vim.cmd("colorscheme rose-pine")
		end
	},
  {
    'folke/which-key.nvim',
    lazy = false,
    config = true, -- popup that shows what my leader keys do
  },
}
