local map = vim.keymap.set

-- Both visual and normal mode for each, so you can open with a visual selection or without.
map({'n', 'v'}, '<leader>g', ':Gen <CR>', { noremap = true, silent = true })

-- Set the key mapping to call the Telescope picker
vim.api.nvim_set_keymap(
  'n', -- mode (normal mode)
  '<leader>ms', -- shortcut (leader key + 'ms' for "model select")
  ':lua telescope_list_models()<CR>', -- command
  { noremap = true, silent = true } -- options (non-recursive, silent)
)

-- Naviguer entre les liens Markdown
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
