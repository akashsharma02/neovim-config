return {
    {
        "alexghergh/nvim-tmux-navigation",
        config = true,
        keys = {
            { "<C-h>",     "<cmd>NvimTmuxNavigateLeft<cr>",       desc = "Move to tmux pane left" },
            { "<C-j>",     "<cmd>NvimTmuxNavigateDown<cr>",       desc = "Move to tmux pane down" },
            { "<C-k>",     "<cmd>NvimTmuxNavigateUp<cr>",         desc = "Move to tmux pane up" },
            { "<C-l>",     "<cmd>NvimTmuxNavigateRight<cr>",      desc = "Move to tmux pane right" },
            { "<C-\\>",    "<cmd>NvimTmuxNavigateLastActive<cr>", desc = "Move to tmux pane last active" },
            { "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>",       desc = "Move to tmux pane next" },
        }
    }
}
