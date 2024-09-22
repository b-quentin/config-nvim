local map = vim.keymap.set

vim.g.codeium_disable_bindings = 1

-- Key mappings for Codeium in insert mode
-- Insert suggestion: <C-g>
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- Next suggestion: <C-;>
map("i", "<C-;>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })

-- Previous suggestion: <C-,>
map("i", "<C-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })

-- Clear current suggestion: <C-x>
map("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

map("i", "<C-w>", function()
  return vim.fn["codeium#AcceptNextWord"]()
end, { expr = true, silent = true })

map("i", "<C-l>", function()
  return vim.fn["codeium#AcceptNextLine"]()
end, { expr = true, silent = true })

map("i", "<C-c>", function()
  return vim.fn["codeium#Complete"]()
end, { expr = true, silent = true })
