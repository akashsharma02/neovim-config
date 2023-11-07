return {
  "lervag/vimtex",
  init = function()
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",
      callback = 1,
      continuous = 1,
      hooks = {},
      options = {
        "-pdf",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-outdir=build",
      },
    }
  end,
}
