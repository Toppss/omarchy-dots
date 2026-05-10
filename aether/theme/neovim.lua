return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "#121212",
        dark_bg    = "#0e0e0e",
        darker_bg  = "#090909",
        lighter_bg = "#2a2a2a",

        fg         = "#ffffff",
        dark_fg    = "#bfbfbf",
        light_fg   = "#ffffff",
        bright_fg  = "#ffffff",
        muted      = "#9e9e9e",

        red        = "#8d6cc8",
        yellow     = "#6576d2",
        orange     = "#9e82d0",
        green      = "#7579d3",
        cyan       = "#7579d3",
        blue       = "#7579d2",
        purple     = "#8b6cc8",
        brown      = "#5f4e7d",

        bright_red    = "#b58aff",
        bright_yellow = "#8896ff",
        bright_green  = "#9999ff",
        bright_cyan   = "#9999ff",
        bright_blue   = "#9999ff",
        bright_purple = "#b38aff",

        accent               = "#7579d2",
        cursor               = "#ffffff",
        foreground           = "#ffffff",
        background           = "#121212",
        selection             = "#2a2a2a",
        selection_foreground = "#ffffff",
        selection_background = "#2a2a2a",
      },
    },
    -- set up hot reload
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
      require("aether.hotreload").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
