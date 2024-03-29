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
return packer.startup(function(use)
  -- My plugins here

  -- Dependancies of plugins
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  use 'christoomey/vim-tmux-runner'
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- File Explorer
  use 'kyazdani42/nvim-tree.lua'
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Buffer bye for better buffer close
  use 'moll/vim-bbye'

  -- Auto pairs for "(" "[" "{"
  use "windwp/nvim-autopairs"

  -- Ui stuff
  use "kyazdani42/nvim-web-devicons"
  use "ryanoasis/vim-devicons"
  use 'norcalli/nvim-colorizer.lua'

  -- Themes
  use "lunarvim/darkplus.nvim"
  use 'navarasu/onedark.nvim'

  --Statusline and bufferline
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'

  --Syntax
  use "sheerun/vim-polyglot"
  use 'uiiaoo/java-syntax.vim' --Java syntax
  use 'luochen1990/rainbow' --Rainbow {}, (), []

  -- Lsp
  use "williamboman/nvim-lsp-installer"
  use "neovim/nvim-lspconfig"

  --Auto complete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  use 'goolord/alpha-nvim'

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
