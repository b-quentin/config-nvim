-- we need to install package with yay beacause mason doesnt work
local options = {
  ensure_installed = {
  "lua-language-server",
  'stylua',
  "gopls",
  "terraform-ls"
  }
}

return options
