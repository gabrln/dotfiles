local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#181212",
    base01 = "#251e1e",
    base02 = "#2f2828",
    base03 = "#a08c8b",
    base04 = "#d8c1c0",
    base05 = "#ede0de",
    base06 = "#ede0de",
    base07 = "#ede0de",
    base08 = "#ffb4ab",
    base09 = "#e2c28c",
    base0A = "#e7bdba",
    base0B = "#ffb3af",
    base0C = "#e2c28c",
    base0D = "#ffb3af",
    base0E = "#e7bdba",
    base0F = "#93000a",
  })
end

-- reload automático via SIGUSR1
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
