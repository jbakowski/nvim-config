-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- STM32 Embedded Development Configuration

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox", -- Cyberpunk/Unix aesthetic
  transparency = false,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "round",

    -- Custom statusline modules
    overriden_modules = function(modules)
      -- Add BSP indicator for F4 projects
      local bsp_indicator = function()
        if vim.g.stm32_project == "f4" and vim.g.stm32_bsp then
          return " BSP:" .. vim.g.stm32_bsp .. " "
        end
        return ""
      end

      -- Add project type indicator
      local project_indicator = function()
        if vim.g.stm32_project == "f4" then
          return " F4 "
        elseif vim.g.stm32_project == "h7" then
          return " H7 "
        end
        return ""
      end

      -- Insert custom modules into statusline
      table.insert(modules, 4, bsp_indicator())
      table.insert(modules, 5, project_indicator())
    end,
  },

  tabufline = {
    enabled = true,
    lazyload = false,
  },

  nvdash = {
    load_on_startup = false,
  },
}

M.nvdash = {
  load_on_startup = false,
}

-- Terminal settings
M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    width = 0.5,
    height = 0.4,
    border = "single",
  },
}

return M
