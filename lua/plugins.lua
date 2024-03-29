local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that sources plugins.lua whenever you save it
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

    -- Packer stuff
	use "wbthomason/packer.nvim" -- Packager itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by plugins

    -- Completion
    use {"hrsh7th/nvim-cmp", config = [[require'cfg.cmp']]} -- The completion plugin
    use "hrsh7th/cmp-nvim-lsp" -- Actual completions from LSP
    use {"hrsh7th/cmp-buffer", after="nvim-cmp"} -- Buffer completions
    use {"hrsh7th/cmp-path", after="nvim-cmp"} -- Path completions
    use {"hrsh7th/cmp-cmdline", after="nvim-cmp"} -- Commandline completions
    use "L3MON4D3/LuaSnip" -- Snippet engine

    -- LSP
    use "neovim/nvim-lspconfig" -- Enable LSP
    use "williamboman/nvim-lsp-installer" -- Easify lang server installs

    -- Telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'plenary.nvim'}
    use {'nvim-telescope/telescope.nvim', config="require('cfg.telescope')", 
        after= 'telescope-fzf-native.nvim' }

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate",}
    use {
        'Fymyte/rasi.vim',
        ft = 'rasi',
    }

    -- Toggleterm
    use "akinsho/toggleterm.nvim"

    -- Commentary
    use {'numToStr/Comment.nvim', config = require('Comment').setup()}

    -- Firenvim
    use {'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end}

    -- Lualine & Barbar
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- Colors
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use {'norcalli/nvim-colorizer.lua', config="require'colorizer'.setup()"}

    -- Latex
    use 'lervag/vimtex'

    -- use 'tpope/vim-surround'
    -- use 'tpope/vim-repeat'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
