local M = {}

function M.setup()
  require('lualine').setup {
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = { left = '▒', right = '▒'},
      section_separators = { left = '▒', right = '▒'},
    },
    sections = {
      lualine_x = { "import" },
      -- lualine_c = { require('auto-session.lib').current_session_name }
    }
  }
  require("nvim-web-devicons").refresh()
end

M.setup()

return M
