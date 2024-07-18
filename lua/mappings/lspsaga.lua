local map = vim.keymap.set

-- Key mappings for lspsaga incoming_calls and outgoing_calls
map("n", "<leader>li", ":Lspsaga incoming_calls<CR>", { noremap = true, silent = true, desc = "Lspsaga Incoming Calls" })
map("n", "<leader>lo", ":Lspsaga outgoing_calls<CR>", { noremap = true, silent = true, desc = "Lspsaga Outgoing Calls" })

-- Key mappings for lspsaga code_action
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { noremap = true, silent = true, desc = "Lspsaga Code Action" })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { noremap = true, silent = true, desc = "Lspsaga Range Code Action" })

-- Peek definition
map("n", "<leader>pd", ":Lspsaga peek_definition<CR>", { noremap = true, silent = true, desc = "Lspsaga Peek Definition" })
-- Peek type definition
map("n", "<leader>pt", ":Lspsaga peek_type_definition<CR>", { noremap = true, silent = true, desc = "Lspsaga Peek Type Definition" })
-- Go to definition
map("n", "<leader>gd", ":Lspsaga goto_definition<CR>", { noremap = true, silent = true, desc = "Lspsaga Go to Definition" })
-- Go to type definition
map("n", "<leader>gt", ":Lspsaga goto_type_definition<CR>", { noremap = true, silent = true, desc = "Lspsaga Go to Type Definition" })

-- Key mapping for Lspsaga finder
map('n', '<leader>sf', ':Lspsaga finder<CR>', { noremap = true, silent = true, desc = "Lspsaga Finder" })

-- Key mapping for Lspsaga hover_doc
map('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true, desc = "Lspsaga Hover Doc" })

-- Key mapping for Lspsaga outline
map('n', '<leader>so', ':Lspsaga outline<CR>', { noremap = true, silent = true, desc = "Lspsaga Outline" })

-- Key mapping for Lspsaga rename
map('n', '<leader>sr', ':Lspsaga rename<CR>', { noremap = true, silent = true, desc = "Lspsaga Rename" })

-- Key mappings for Lspsaga diagnostic navigation
map('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true, desc = "Lspsaga Next Diagnostic" })
map('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true, desc = "Lspsaga Previous Diagnostic" })

map('n', '<leader>sd', ":lua vim.diagnostic.open_float()<CR>",  { noremap = true, silent = true, desc = "Diagnostic Open Float Window" })
map('n', '<leader>sbf', ":lua vim.lsp.buf.format()<CR>",  { noremap = true, silent = true, desc = "Formatting" })
