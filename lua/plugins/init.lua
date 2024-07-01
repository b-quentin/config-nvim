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
   			"vim", "lua", "vimdoc",
        "html", "css"
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
  }
}
