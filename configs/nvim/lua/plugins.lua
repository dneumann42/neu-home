local M = {}

function M.bootstrap()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  return M
end

function M.setup()
  require("lazy").setup {
    -- theming
    "xiyaowong/transparent.nvim",
    "rebelot/kanagawa.nvim",
    "sainnhe/everforest",
    {
      "bluz71/vim-moonfly-colors",
      name = "moonfly",
      lazy = false,
      priority = 1000,
    },
    { 'nvim-lualine/lualine.nvim',
      dependencies = { "nvim-tree/nvim-web-devicons" } },
    "stevearc/dressing.nvim",

    -- UI utility
    'MunifTanjim/nui.nvim',

    -- utility
    "chentoast/marks.nvim",
    "folke/which-key.nvim",
    "kylechui/nvim-surround",
    "nvim-tree/nvim-tree.lua",
    "m4xshen/autoclose.nvim",
    "norcalli/nvim-colorizer.lua",

    "lukas-reineke/indent-blankline.nvim",

    -- filemanager

    -- lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {}, },

    -- completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    {
    "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" }
    },

    -- project management
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "ahmedkhalf/project.nvim",
    "nvim-telescope/telescope-project.nvim",

    -- terminals
    {'akinsho/toggleterm.nvim', version = "*", config = true},

    -- buggy in newer versions of neovim
    -- "nvim-treesitter/nvim-treesitter",

    -- git
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim",        -- optional
        "ibhagwan/fzf-lua",              -- optional
      },
      config = true
    },

    -- langauge specific
    "jparise/vim-graphql",
  }
end

return M
