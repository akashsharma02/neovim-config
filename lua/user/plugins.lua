local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(
    function(use)
        -- My plugins here
        use "wbthomason/packer.nvim" -- Have packer manage itself
        use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
        use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
        use {
            'numToStr/comment.nvim',
            tag = 'v0.6'
        } -- Easily comment stuff
        use 'kyazdani42/nvim-web-devicons'
        use 'kyazdani42/nvim-tree.lua'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'christoomey/vim-tmux-navigator'
        use 'ray-x/lsp_signature.nvim'
        use 'lervag/vimtex'
        use 'windwp/nvim-autopairs'

        -- Colorscheme
        use "flazz/vim-colorschemes"
        use 'rebelot/kanagawa.nvim'

        -- Completion plugins
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/cmp-nvim-lsp"
        use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }
        use "saadparwaiz1/cmp_luasnip"


        -- snippets
        use "L3MON4D3/LuaSnip"
        use "rafamadriz/friendly-snippets"

        -- LSP
        use "neovim/nvim-lspconfig"
        use "williamboman/nvim-lsp-installer"
        use "jose-elias-alvarez/null-ls.nvim"

        -- Telescope
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"

        -- TreeSitter
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
        use({ "yioneko/nvim-yati", requires = "nvim-treesitter/nvim-treesitter" })


        -- Git
        use "lewis6991/gitsigns.nvim"

        -- LuaLine
        use "nvim-lualine/lualine.nvim"

        -- which-key
        use "folke/which-key.nvim"

        use {
            'iamcco/markdown-preview.nvim',
            run = function() vim.fn['mkdp#util#install']() end,
            ft = { 'markdown' }
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end)
