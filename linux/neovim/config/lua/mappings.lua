require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "v" }, "d", '"_d')
map({ "n", "v" }, "c", '"_c')
map({ "n", "v" }, "x", '"_x')
map({ "n", "v" }, "s", '"_s')
map("n", "D", '"_D')
map("n", "C", '"_C')
map("n", "S", '"_S')
map("n", "X", '"_X')

map({ "n", "v" }, "<leader>d", "d")
map({ "n", "v" }, "<leader>c", "c")
map({ "n", "v" }, "<leader>x", "x")
map("n", "<leader>D", "D")
map("n", "<leader>C", "C")

map("v", "p", '"_dP')
