local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
    transparent_background = true,
    integrations = {
        nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = true
        },
        which_key = true,
    }
})

local kanagawa = require("kanagawa")
kanagawa.setup({
    undercurl = true,
    transparent = true,
})


vim.cmd("colorscheme kanagawa")

