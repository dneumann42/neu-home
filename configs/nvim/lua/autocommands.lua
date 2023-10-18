local M = {}

function M.setup()
  -- when nvim resizes it balances the splits
  vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
      vim.cmd "tabdo wincmd ="
    end,
  })

  -- flashes the selection after a yank
  vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
      vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
    end,
  })
end

M.setup()

return M
