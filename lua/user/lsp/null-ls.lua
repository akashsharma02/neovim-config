local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with(
            {
                filetypes = { "html", "json", "yaml", "markdown" },
                extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }
            }),
		formatting.yapf,
        formatting.isort,
        formatting.cmake_format,
        diagnostics.flake8,
    -- diagnostics.flake8
	},
})
