local M = {}

local K = require("keybindings")

function M.setup()
  require("project_nvim").setup {}

  K.map('n', '<leader>f', ':Telescope find_files<cr>')
  K.map('n', '<C-x>b', ':Telescope buffers<cr>')
  K.map('n', '<leader>g', ':Telescope live_grep<cr>')
  K.map('n', '<leader>b', ':Telescope buffers<cr>')

  K.map('n', '<leader>p', ':Telescope project<cr>')

  require("telescope").load_extension('project')

  K.map('n', '<C-p>', ':lua require("telescope").extensions.project.project{  }<cr>')
end

M.setup()

return M
