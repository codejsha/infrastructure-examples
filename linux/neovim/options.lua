require "nvchad.options"

-- --- clipboard ---
vim.opt.clipboard = "unnamedplus"

if vim.env.SSH_TTY then
  local osc52 = require "vim.ui.clipboard.osc52"
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy "+",
      ["*"] = osc52.copy "*",
    },
    paste = {
      ["+"] = osc52.paste "+",
      ["*"] = osc52.paste "*",
    },
  }
end

-- --- mouse ---
vim.opt.mousescroll = "ver:2,hor:6"
