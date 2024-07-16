local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local eslint = require("none-ls.diagnostics.eslint")
local null_ls_utils = require("null-ls.utils")

null_ls.setup {
    autostart = true,  -- Ensure autostart is set to true
    root_dir = null_ls_utils.root_pattern("package.json"),
    sources = {
      require("none-ls.code_actions.eslint"),
      require("null-ls.builtins").formatting.stylua,
      require("null-ls.builtins").formatting.prettier,
      null_ls.builtins.formatting.gofmt.with({
          extra_args = { "-w" }
      }),
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.goimports_reviser.with({
          extra_args = { "-rm-unused" }
      }),
      null_ls.builtins.formatting.golines,
      null_ls.builtins.formatting.prettier.with({
          filetypes = { "svelte", "javascript", "javascriptreact", "typescript", "typescriptreact" },
          extra_args = { "--plugin-search-dir=." }
      }),
      eslint.with({
          filetypes = { "svelte", "javascript", "javascriptreact", "typescript", "typescriptreact" }
      }),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

return null_ls
