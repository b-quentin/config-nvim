local markdown = require "render-markdown"

markdown.setup {
  indent = {
    enabled = true,
    per_level = 2,
    skip_level = 1,
    skip_heading = false,
  },
  heading = {
    enabled = true,
    sign = true,
    position = "overlay",
    icons = { "󰼏 ", "󰎨  ", "󰼑  ", "󰎲  ", "󰼓  ", "󰎴  " },
    signs = { "󰫎 " },
    width = "full",
    left_pad = 0,
    right_pad = 0,
    min_width = 0,
    border = false,
    border_prefix = false,
    above = "▄",
    below = "▀",
    backgrounds = {
      "RenderMarkdownH1Bg",
      "RenderMarkdownH2Bg",
      "RenderMarkdownH3Bg",
      "RenderMarkdownH4Bg",
      "RenderMarkdownH5Bg",
      "RenderMarkdownH6Bg",
    },
    foregrounds = {
      "RenderMarkdownH1",
      "RenderMarkdownH2",
      "RenderMarkdownH3",
      "RenderMarkdownH4",
      "RenderMarkdownH5",
      "RenderMarkdownH6",
    },
  },
}

vim.cmd [[
  " Heading 1 Background
  highlight clear RenderMarkdownH1Bg
  highlight RenderMarkdownH1Bg guibg=NONE guifg=#82aaff

  " Heading 2 Background
  highlight clear RenderMarkdownH2Bg
  highlight RenderMarkdownH2Bg guibg=NONE guifg=#e2b86b

  " Heading 3 Background
  highlight clear RenderMarkdownH3Bg
  highlight RenderMarkdownH3Bg guibg=NONE guifg=#8ebd6b

  " Heading 4 Background
  highlight clear RenderMarkdownH4Bg
  highlight RenderMarkdownH4Bg guibg=NONE guifg=#48b0bd

  " Heading 5 Background
  highlight clear RenderMarkdownH5Bg
  highlight RenderMarkdownH5Bg guibg=NONE guifg=#a291e1

  " Heading 6 Background
  highlight clear RenderMarkdownH6Bg
  highlight RenderMarkdownH6Bg guibg=NONE guifg=#d27e99

  " Heading 1
  highlight clear RenderMarkdownH1
  highlight RenderMarkdownH1 guibg=NONE guifg=#82aaff

  " Heading 2
  highlight clear RenderMarkdownH2
  highlight RenderMarkdownH2 guibg=NONE guifg=#e2b86b

  " Heading 3
  highlight clear RenderMarkdownH3
  highlight RenderMarkdownH3 guibg=NONE guifg=#8ebd6b

  " Heading 4
  highlight clear RenderMarkdownH4
  highlight RenderMarkdownH4 guibg=NONE guifg=#48b0bd

  " Heading 5
  highlight clear RenderMarkdownH5
  highlight RenderMarkdownH5 guibg=NONE guifg=#a291e1

  " Heading 6
  highlight clear RenderMarkdownH6
  highlight RenderMarkdownH6 guibg=NONE guifg=#d27e99
]]
