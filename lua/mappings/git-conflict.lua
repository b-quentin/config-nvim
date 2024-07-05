local map = vim.keymap.set

-- Key mappings for Git conflict resolution
map("n", "<leader>go", ":GitConflictChooseOurs<CR>", { noremap = true, silent = true, desc = "Git Conflict Choose Ours" })
map("n", "<leader>gt", ":GitConflictChooseTheirs<CR>", { noremap = true, silent = true, desc = "Git Conflict Choose Theirs" })
map("n", "<leader>gb", ":GitConflictChooseBoth<CR>", { noremap = true, silent = true, desc = "Git Conflict Choose Both" })
map("n", "<leader>gn", ":GitConflictChooseNone<CR>", { noremap = true, silent = true, desc = "Git Conflict Choose None" })
map("n", "]c", ":GitConflictNextConflict<CR>", { noremap = true, silent = true, desc = "Git Conflict Next Conflict" })
map("n", "[c", ":GitConflictPrevConflict<CR>", { noremap = true, silent = true, desc = "Git Conflict Previous Conflict" })
map("n", "<leader>gq", ":GitConflictListQf<CR>", { noremap = true, silent = true, desc = "Git Conflict List Quickfix" })
