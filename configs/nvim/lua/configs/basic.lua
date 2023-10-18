return function()
  require("which-key").setup {}
  require("nvim-surround").setup {}
  require("autoclose").setup()
  require('colorizer').setup()

  local highlight = {
    "CursorColumn",
  }

  require("ibl").setup {
    scope = { enabled = false }
  }
end
