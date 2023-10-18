local M = {}
local K = require("keybindings")

function M.setup()
  local neo = require("neogit").setup { }

  vim.keymap.set('n', '<C-x>g', function()
    require("neogit").open({ kind = "split" })
  end, { noremap = true })
end

return M
