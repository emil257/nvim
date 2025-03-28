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
    -- vim.cmd.colorscheme "catppuccin-macchiato"
    vim.cmd.colorscheme "catppuccin"
  end
}
