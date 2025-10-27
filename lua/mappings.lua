require "nvchad.mappings"

-- STM32 Embedded Development Keybindings
local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

-- Build & Development
map("n", "<leader>bb", "<cmd>OverseerRun<CR>", { desc = "Build: Open build menu" })
map("n", "<leader>bt", "<cmd>OverseerToggle<CR>", { desc = "Build: Toggle panel" })
map("n", "<leader>bl", "<cmd>OverseerRestartLast<CR>", { desc = "Build: Restart last" })
map("n", "<leader>bs", function() require("configs.telescope_bsp").select_bsp() end, { desc = "Build: Select BSP" })

-- Git Workflow (additional to gitsigns mappings in plugins)
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git: Status" })
map("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git: Commit" })
map("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git: Push" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git: Diff view" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git: File history" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { desc = "Git: Project history" })
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Git: Close diffview" })

-- Telescope with BSP filtering
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find: Files (BSP filtered)" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find: Live grep (BSP filtered)" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find: Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find: Help" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find: Old files" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find: In buffer" })

-- TODO Comments
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find: TODOs" })
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous TODO" })

-- Diagnostics & Errors
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics: Toggle" })
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics: Buffer" })
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Diagnostics: Quickfix" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Diagnostics: Location list" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- Terminal
map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Terminal: Toggle" })
map("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Terminal: Toggle" })

-- Session Management
map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Session: Restore" })
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Session: Restore last" })
map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Session: Don't save" })

-- DAP (Debugging)
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Debug: Toggle breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Debug: Continue" })
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Debug: Step into" })
map("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "Debug: Step over" })
map("n", "<leader>dO", "<cmd>DapStepOut<CR>", { desc = "Debug: Step out" })
map("n", "<leader>dr", "<cmd>DapToggleRepl<CR>", { desc = "Debug: Toggle REPL" })
map("n", "<leader>dl", "<cmd>DapShowLog<CR>", { desc = "Debug: Show log" })
map("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Debug: Terminate" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Debug: Toggle UI" })

-- Buffer Navigation
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Buffer: Next" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Buffer: Previous" })
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Buffer: Close" })

-- Window Navigation (already defined in NvChad, but ensuring consistency)
map("n", "<C-h>", "<C-w>h", { desc = "Window: Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window: Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window: Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window: Right" })

-- Quickfix Navigation
map("n", "]q", "<cmd>cnext<CR>", { desc = "Quickfix: Next" })
map("n", "[q", "<cmd>cprev<CR>", { desc = "Quickfix: Previous" })
map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Quickfix: Open" })
map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Quickfix: Close" })

-- LSP (additional to NvChad defaults)
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP: References" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename" })
map("n", "<leader>lf", function() require("conform").format({ async = true, lsp_fallback = true }) end, { desc = "LSP: Format" })
