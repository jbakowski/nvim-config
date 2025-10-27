-- .nvim.lua - Project-specific configuration template
-- Copy this file to your project root and customize as needed

-- For STM32 F4 Projects
-- Set your default BSP variant
vim.g.stm32_bsp = ""

-- Project-specific settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Custom build command overrides (optional)
-- vim.g.build_cmd = "make -j8 all"

-- Add project-specific paths to LSP (optional)
-- vim.lsp.buf.add_workspace_folder(vim.fn.getcwd() .. "/external/includes")

-- Custom autocommands for this project (optional)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.c",
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })
