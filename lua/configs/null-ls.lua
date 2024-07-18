local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local eslint = require "none-ls.diagnostics.eslint"
local null_ls_utils = require "null-ls.utils"

null_ls.setup {
  autostart = true, -- Ensure autostart is set to true
  root_dir = null_ls_utils.root_pattern "package.json",
  sources = {
    -- ESLint code actions and diagnostics for JavaScript and TypeScript
    require("none-ls.code_actions.eslint").with {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
    },
    eslint.with {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
    },
    -- Prettier for JavaScript, TypeScript, and Svelte
    require("null-ls.builtins").formatting.prettier.with {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
      extra_args = { "--plugin-search-dir=." },
    },
    -- Stylua for Lua
    require("null-ls.builtins").formatting.stylua.with {
      filetypes = { "lua" },
    },
    -- Go formatters
    null_ls.builtins.formatting.gofmt.with {
      filetypes = { "go" },
      extra_args = { "-w" },
    },
    null_ls.builtins.formatting.gofumpt.with {
      filetypes = { "go" },
    },
    null_ls.builtins.formatting.goimports_reviser.with {
      filetypes = { "go" },
      extra_args = { "-set-alias", "-format" }, -- Ensure output is set to stdout
    },
    null_ls.builtins.formatting.golines.with {
      filetypes = { "go" },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return null_ls
