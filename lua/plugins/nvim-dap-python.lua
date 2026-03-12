return {
    "mfussenegger/nvim-dap-python",
    config = function()
        require("dap-python").setup(vim.fn.expand("$HOME/miniforge3/bin/python3"))
    end,
}
