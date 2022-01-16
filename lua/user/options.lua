local options = {
	backup = false,					-- Make no backups before overwriting file
	writebackup = false,
	cmdheight = 2, 					-- more space for command window to display messages
	completeopt = {"menuone", "noselect"}, 		-- For cmp (completion engine)
	conceallevel = 0,				-- "" must be visible in  markdown
	fileencoding = "utf-8", 		-- encoding written to file
	hlsearch = false, 				-- highlight all matches on previous search pattern
	ignorecase = true, 				-- ignore case during search
	mouse = "a",					-- enable mouse
	pumheight = 20, 				-- pop up menu height
	showmode = false,				-- remove mode from command line, since lualine shows the same
	showtabline = 2,				-- always show tabs
	expandtab = true, 				-- expand tab to spaces
	shiftwidth = 4,					-- number of spaces per indent
	tabstop = 4, 					-- insert 4 spaces per tab
	cursorline = true, 				-- highlight the current line
	number = true,					-- enable line numbers
	relativenumber = true, 			-- enable relative line numbers
	signcolumn = "yes", 			-- always show sign column (used by gitsigns)
	scrolloff = 20,					-- keep cursor centered for 20 lines
	splitbelow = true,				-- split window below
	splitright = true, 				-- split window right
	swapfile = true,				-- create swap file
	updatetime = 300, 				-- length of time nvim waits to trigger commands after typing stops
    timeoutlen = 300,               -- Required timeoutlen to trigger which-key appropriately
    termguicolors = true,           -- Enable term gui colors
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append('c')
vim.opt.clipboard:append("unnamedplus")	-- allow neovim to access system clipboard
