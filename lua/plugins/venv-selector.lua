return {
    "linux-cultist/venv-selector.nvim",

    opts = {
        anaconda_base_path = vim.fn.expand("$HOME/miniforge3"),
        anaconda_envs_path = vim.fn.expand("$HOME/miniforge3/envs"),
    },
}
