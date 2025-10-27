-- ~/.config/nvim/lua/overseer/template/user/stm32_f4_build_quick.lua
-- Quick STM32 F4 build (no prompts, uses current settings)

return {
  name = "STM32 F4 Build (Quick)",
  builder = function()
    local bsp = vim.g.stm32_bsp or "nggsm-2wa-pa8"

    return {
      cmd = { "make" },
      args = {
        "MODE=debug",
        "DEBUG_IFF=cpp-uart",
        "BSP=" .. bsp,
        "-j4",
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
}
