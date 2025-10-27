-- ~/.config/nvim/lua/overseer/template/user/stm32_f4_build.lua
-- Interactive STM32 F4 build template

return {
  name = "STM32 F4 Build",
  builder = function()
    -- Default values
    local defaults = {
      MODE = "debug",
      DEBUG_IFF = "cpp-uart",
      BSP = vim.g.stm32_bsp or "nggsm-2wa-pa8",
      JOBS = "4",
    }

    return {
      cmd = { "make" },
      args = {
        "MODE=" .. defaults.MODE,
        "DEBUG_IFF=" .. defaults.DEBUG_IFF,
        "BSP=" .. defaults.BSP,
        "-j" .. defaults.JOBS,
        "all",
      },
      components = {
        { "on_output_quickfix", open = true },
        "default",
      },
      metadata = {
        priority = 50,
      },
    }
  end,
  condition = {
    filetype = { "c", "cpp", "h", "hpp" },
    callback = function()
      return vim.g.stm32_project == "f4"
    end,
  },
  params = {
    MODE = {
      desc = "Build mode",
      type = "enum",
      default = "debug",
      choices = { "debug", "release" },
    },
    DEBUG_IFF = {
      desc = "Debug interface",
      type = "enum",
      default = "cpp-uart",
      choices = { "cpp-uart", "hibus-uart" },
    },
    BSP = {
      desc = "Board Support Package",
      type = "enum",
      default = function()
        return vim.g.stm32_bsp or "nggsm-2wa-pa8"
      end,
      choices = { "nggsm-2wa-pa8", "nggsm-2wa-pa7", "nucleo" },
    },
    JOBS = {
      desc = "Number of parallel jobs",
      type = "string",
      default = "4",
    },
  },
  on_params_set = function(params)
    -- Update global BSP if it changed
    if params.BSP and params.BSP ~= vim.g.stm32_bsp then
      vim.g.stm32_bsp = params.BSP
      vim.notify("BSP updated to: " .. params.BSP, vim.log.levels.INFO)
    end
  end,
}
