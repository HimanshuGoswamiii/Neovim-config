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
  -- vim.cmd [[packadd packer.nvim]]
end

-- I personally don't need this
-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd [[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "Packer.nvim not found"
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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  -- So many plugins relies on the two plugins below
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  use "akinsho/toggleterm.nvim" -- Terminal integration
  use "lukas-reineke/indent-blankline.nvim" -- Indentation
  use "windwp/nvim-autopairs" -- For autopairs
  use "goolord/alpha-nvim"  -- we don't need the function because we're defining our alpha.lua

  --             THEMES
  -- Chris at Machine colorschemes
  use {"lunarvim/colorschemes",opt=true} -- Lazy Loading
  -- To use these themes first :PackerLoad colorschemes

  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'tanvirtin/monokai.nvim'
  -- use "lunarvim/synthwave84.nvim"

  -- Vim-airline for tabs , Now we are using a lua alternative for this
  -- use 'vim-airline/vim-airline'
  use {
    'nvim-lualine/lualine.nvim',
    -- requires = { 'kyazdani42/nvim-web-devicons', opt=true}
    requires = { 'kyazdani42/nvim-web-devicons'}
  }
  -- BufWinEnter : After a Buffer is displayed in a window
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}, event='BufWinEnter'
  }

  -- Comments in Neovim
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- Code Completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine (Important for completion)
  --use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "hrsh7th/cmp-nvim-lsp" -- code Completion for LSP
  use "hrsh7th/cmp-nvim-lua"
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer


  -- TreeSitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  -- Colorizer for showing colors when using HexCode and other things
   use {
    "norcalli/nvim-colorizer.lua",
    config=function() require'colorizer'.setup() end
   }

  -- Telescope Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    cmd="Telescope"
  }

  -- nnn File Explorer
  use {
    "luukvbaal/nnn.nvim",
    config = function() require("nnn").setup() end
  }

-- TODO
  --[[ use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  } ]]


  -- +----------------------------------------------------
  -- plugins related to different languages

  -- emmet for Web Development
  use {"mattn/emmet-vim",ft={'html','css','js'}} -- Only load it during these files

  -- Java
  use {"mfussenegger/nvim-jdtls",ft={'java'}} -- Before installing this install jdtls server

  -- Competitive Programming : Needed by firefox plugin : Competitive-Companion
  use {"p00f/cphelper.nvim"}


  -- R Programming in Neovim
  -- use {'jalvesaq/Nvim-R',branch='stable',ft={'r','R','Rnw','Rmd','rmd','Rd','Rrst'} }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
