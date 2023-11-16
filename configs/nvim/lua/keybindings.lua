local M = { }

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.setup()
  local map = M.map

  vim.g.mapleader = ","

  map('', '<up>', '<nop>')
  map('', '<down>', '<nop>')
  map('', '<left>', '<nop>')
  map('', '<right>', '<nop>')

  -- Clear's highlight
  map('n', '<leader>c', ':nohl<cr>')

  -- moving around splits
  map('n', '<C-h>', '<C-w>h')
  map('n', '<C-j>', '<C-w>j')
  map('n', '<C-k>', '<C-w>k')
  map('n', '<C-l>', '<C-w>l')
  
  vim.dn = vim.dn or {}
  vim.dn.unsplit = function()
    -- check if nvim tree is open
    -- if so re-open after unsplit
    local tree_view = require("nvim-tree.view")
    local vis = tree_view.is_visible()

    vim.cmd ":only"

    if vis then
      tree_view.open { focus_tree = false }
    end
  end

  -- creating splits like a filthy emacs user
  map('n', '<C-x>2', '<C-w>S')
  map('n', '<C-x>3', '<C-w>S<C-w>L')
  map('n', '<C-x>0', '<C-w>q')

  vim.keymap.set('n', '<C-x>1', vim.dn.unsplit)

  map('n', '<leader>w', ':w<cr>')
  map('n', '<leader>q', ':qa<cr>')

  -- tabs
  map('n', '<leader>tt', ':tabnew<cr>')
  map('n', '<leader>tn', ':tabnext<cr>')
  map('n', '<leader>tp', ':tabprevious<cr>')
  map('n', '<leader>tc', ':tabclose<cr>')
end

M.setup()

return M
