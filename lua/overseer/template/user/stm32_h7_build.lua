-- ~/.config/nvim/lua/overseer/template/user/stm32_h7_build.lua
-- STM32 H7 Docker build template

return {
  name = "STM32 H7 Build (Docker)",
  builder = function()
    -- Check if docker_build_cmd.sh exists in project root
    local docker_script = vim.fn.getcwd() .. "/docker_build_cmd.sh"
    local has_docker_script = vim.fn.filereadable(docker_script) == 1

    if has_docker_script then
      return {
        cmd = { docker_script },
        args = { "make", "all" },
        components = {
          { "on_output_quickfix", open = true },
          "default",
        },
        metadata = {
          priority = 50,
        },
      }
    else
      -- Fallback to direct docker command
      return {
        cmd = { "docker" },
        args = {
          "run",
          "--rm",
          "-v",
          vim.fn.getcwd() .. ":/workspace",
          "-w",
          "/workspace",
          "stm32-h7-builder",
          "make",
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
    end
  end,
  condition = {
    filetype = { "c", "cpp", "h", "hpp" },
    callback = function()
      return vim.g.stm32_project == "h7"
    end,
  },
}
