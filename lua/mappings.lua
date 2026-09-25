require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move lines down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move lines up' })

map("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git blame line" })
map("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle inline blame" })
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview git hunk" })

map("n", "<F2>", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Lspsaga Hover Doc" })

map("n", "<F3>", "<cmd>Lspsaga peek_definition<CR>", { silent = true, desc = "Lspsaga Peek Definition" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
