return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { ";e", "<cmd>lua vim.diagnostic.open_float()<CR>" }
  end,
  opts = {
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
    },
    diagnostics = {
      virtual_text = false,
    },
  },
}
