return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local default = require "nvchad.configs.nvimtree"
      local custom_conf = require "configs.nvim-tree"
      return vim.tbl_deep_extend("force", default, custom_conf)
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
        require "configs.lspsaga"
    end,
  },
  {
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "configs.gen"
    end,
  },
   {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
        "html",
        "vim",
        "lua", 
        "vimdoc",
        "html", 
        "css",
        "markdown",
        "terraform"
   		},
   	},
   },
  {
    "nvim-telescope/telescope-ui-select.nvim"
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      conf.extensions_list = { "themes", "terms", "ui-select" }
      return conf
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    'akinsho/git-conflict.nvim', 
    event = "VeryLazy",
    version = "2.0.0", 
    config = true
  }
}
