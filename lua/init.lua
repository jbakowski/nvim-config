-- ~/.config/nvim/lua/init.lua
-- Project detection and autocommands for STM32 development

-- Detect project type (F4 vs H7)
local function detect_stm32_project()
  local cwd = vim.fn.getcwd()
  if cwd:match("stm32f4") or cwd:match("STM32F4") then
    vim.g.stm32_project = "f4"
  elseif cwd:match("stm32h7") or cwd:match("STM32H7") then
    vim.g.stm32_project = "h7"
  else
    vim.g.stm32_project = nil
  end
end

-- Auto-detect on startup and directory change
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = detect_stm32_project,
})

-- Load project-specific config (.nvim.lua)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local nvim_lua = vim.fn.getcwd() .. "/.nvim.lua"
    if vim.fn.filereadable(nvim_lua) == 1 then
      dofile(nvim_lua)
    end
  end,
})

-- Auto-save sessions on exit (for persistence.nvim)
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.fn.argc() == 0 then -- Only auto-save if started without arguments
      pcall(function()
        require("persistence").save()
      end)
    end
  end,
})

-- Fix Docker build paths (if using Docker for H7)
-- Converts /workspace/... to actual project paths
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    local qflist = vim.fn.getqflist()
    local cwd = vim.fn.getcwd()
    local modified = false

    for _, item in ipairs(qflist) do
      if item.text and item.text:match("^/workspace/") then
        item.text = item.text:gsub("^/workspace/", cwd .. "/")
        modified = true
      end
    end

    if modified then
      vim.fn.setqflist(qflist, 'r')
    end
  end,
})

-- Initialize project detection
detect_stm32_project()
