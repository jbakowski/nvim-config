-- ~/.config/nvim/lua/configs/telescope_bsp.lua
-- BSP (Board Support Package) filtering for STM32 F4 projects

local M = {}

-- Available BSP options for F4 projects
M.bsp_options = {
  "nggsm-2wa-pa8",
  "nggsm-2wa-pa7",
  "nucleo",
}

-- Get file ignore patterns based on current BSP selection
function M.get_bsp_ignore_patterns()
  local current_bsp = vim.g.stm32_bsp
  if not current_bsp or vim.g.stm32_project ~= "f4" then
    return {}
  end

  local ignore_patterns = {}
  for _, bsp in ipairs(M.bsp_options) do
    if bsp ~= current_bsp then
      table.insert(ignore_patterns, "*/" .. bsp .. "/*")
      table.insert(ignore_patterns, "*/" .. bsp)
    end
  end

  return ignore_patterns
end

-- Select BSP interactively
function M.select_bsp()
  if vim.g.stm32_project ~= "f4" then
    vim.notify("BSP selection is only available for F4 projects", vim.log.levels.WARN)
    return
  end

  vim.ui.select(M.bsp_options, {
    prompt = "Select BSP:",
    format_item = function(item)
      if item == vim.g.stm32_bsp then
        return item .. " (current)"
      end
      return item
    end
  }, function(choice)
    if choice then
      vim.g.stm32_bsp = choice
      vim.notify("BSP set to: " .. choice, vim.log.levels.INFO)

      -- Save to project config if .nvim.lua exists
      local nvim_lua = vim.fn.getcwd() .. "/.nvim.lua"
      if vim.fn.filereadable(nvim_lua) == 1 then
        local content = vim.fn.readfile(nvim_lua)
        local found = false
        for i, line in ipairs(content) do
          if line:match("vim%.g%.stm32_bsp") then
            content[i] = 'vim.g.stm32_bsp = "' .. choice .. '"'
            found = true
            break
          end
        end
        if not found then
          table.insert(content, 1, 'vim.g.stm32_bsp = "' .. choice .. '"')
        end
        vim.fn.writefile(content, nvim_lua)
      end
    end
  end)
end

-- Get Telescope defaults with BSP filtering
function M.get_telescope_defaults()
  local ignore_patterns = M.get_bsp_ignore_patterns()

  return {
    file_ignore_patterns = vim.list_extend({
      "%.git/",
      "node_modules/",
      "build/",
      "%.o$",
      "%.a$",
      "%.bin$",
      "%.hex$",
      "%.elf$",
    }, ignore_patterns),
  }
end

-- Setup Telescope with BSP filtering
function M.setup()
  local telescope = require("telescope")
  local defaults = M.get_telescope_defaults()

  telescope.setup({
    defaults = defaults,
    pickers = {
      find_files = {
        hidden = false,
      },
      live_grep = {
        additional_args = function()
          return { "--hidden" }
        end,
      },
    },
  })
end

-- Command to select BSP
vim.api.nvim_create_user_command("SelectBSP", M.select_bsp, {})

return M
