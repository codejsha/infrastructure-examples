require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "v" }, "d", '"_d')
map({ "n", "v" }, "c", '"_c')
map({ "n", "v" }, "x", '"_x')
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
map({ "n", "v" }, "<leader>d", "d")
map("n", "D", '"_D')
map("n", "C", '"_C')

