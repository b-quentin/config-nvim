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
        "gopls",
      },
    },
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
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    event = "VeryLazy",
    config = function()
      require "configs.null-ls"
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
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "configs.lspsaga"
    end,
  },
  {
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.gen"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "html",
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "terraform",
        "tsx",
        "typescript",
        "javascript",
        "svelte",
        "graphql",
        "rust",
        "dart",
      },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
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
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    version = "2.0.0",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "configs.gitsigns"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      require "configs.render-markdown"
    end,
  },
  -- yay imagemagick
  -- yay luarocks
  -- yay lua51
  -- sudo luarocks --lua-version=5.1 install magick
  -- yay ueberzugpp
  {
    "3rd/image.nvim",
    event = "BufEnter",
    config = function()
      require "configs.image"
    end,
  },
  {
    "3rd/diagram.nvim",
    event = "VeryLazy",
    dependencies = {
      "3rd/image.nvim",
    },
    config = function()
      require "configs.diagram"
    end,
  },
  {
    "exafunction/codeium.vim",
    keys = { '<C-p>' },
  },
  {
    "laytan/tailwind-sorter.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && CI=true pnpm install && pnpm run build",
    config = true,
  },
}
