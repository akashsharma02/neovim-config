return {
    "mfussenegger/nvim-dap-python",
    config = function()
        require("dap-python").setup("~/miniforge3/envs/debugpy/bin/python")
    end,
}
