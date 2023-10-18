local M = {}

function M.setup()
  local opt = vim.opt -- options

  vim.cmd "set nowrap"

  opt.mouse = 'a'
  opt.clipboard = 'unnamedplus'
  opt.swapfile = false
  opt.completeopt = 'menuone,noinsert,noselect'

  vim.o.timeout = true
  vim.o.timeoutlen = 300

  opt.number = true
  opt.showmatch = true
  opt.foldmethod = 'marker'
  opt.splitright = true
  opt.splitbelow = true
  opt.ignorecase = true
  opt.smartcase = true
  opt.linebreak = true
  opt.termguicolors = true
  opt.laststatus = 3

  opt.expandtab = true
  opt.shiftwidth = 2
  opt.tabstop = 2
  opt.smartindent = true
  opt.signcolumn = 'yes'

  opt.hidden = true -- enables buffers running in the background
  opt.history = 1000
  -- opt.lazyredraw = true
  opt.updatetime = 250

  opt.shortmess:append "sI"

  vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

  vim.cmd [[
  au BufNewFile,BufRead *.star set filetype=stardust
  au Syntax *.star runtime! syntax/stardust.vim
  ]]

  return M
end

function M.setup_plugins()
  require("configs/config")()
  return M
end

return M
