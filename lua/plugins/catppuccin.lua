return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	opts = {
		no_italic = true,
		term_colors = true,
		transparent_background = false,
		styles = {
			comments = {},
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
		},
		color_overrides = {
			mocha = {
				base = "#000000",
				mantle = "#000000",
				crust = "#000000",
				red = "#FF6F6F", -- optional, a nice reddish
				blue = "#6A9EFF", -- keep blue for react components
			},
		},
		integrations = {
			telescope = {
				enabled = true,
				style = "nvchad",
			},
			dropbar = {
				enabled = true,
				color_mode = true,
			},
		},
	},
	config = function()
		vim.cmd.colorscheme("catppuccin")

		vim.api.nvim_set_hl(0, "@tag.builtin", { fg = "#FF7A86" })
		vim.api.nvim_set_hl(0, "@tag.javascript", { fg = "#8DB4FF" })
		vim.api.nvim_set_hl(0, "@tag.attribute", { fg = "#FFB86C" })
	end,
}
