local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


-- install gofumpt and goimports_reviser and golines with yay
local opts = {
  sources = {
    null_ls.builtins.formatting.gofmt.with({
      extra_args = { "-w" }
    }),
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser.with({
      extra_args = { "-rm-unused" }
    }),
    null_ls.builtins.formatting.golines,
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
return opts
