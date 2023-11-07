return {
  "mfussenegger/nvim-dap-python",
  config = function()
    require("dap-python").setup("~/mambaforge/envs/debugpy/bin/python")
  end,
}
