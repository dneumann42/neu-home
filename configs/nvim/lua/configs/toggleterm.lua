local M = {}

function M.setup()
  local status_ok, toggleterm = pcall(require, "toggleterm")

  if not status_ok then
    return
  end

  toggleterm.setup {
    size = 10,
    open_mapping = [[<C-Space>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    close_on_exit = true,
    shell = vim.o.shell,
  }

  function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  end

  vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
end

return M
