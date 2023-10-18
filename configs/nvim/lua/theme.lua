local M = {}

function M.setup()
  require("nvim-web-devicons").setup {
    color_icons = true;
    default = true;
  }

  vim.cmd [[
    set background=dark

    let g:moonflyTransparent = v:true
    let g:moonflyItalics = v:true
    " 0 - none, 1 - blocks, 2 - line
    let g:moonflyWinSeparator = 2

    colorscheme moonfly
  ]]

  require("transparent").setup {
    groups = { -- table: default groups
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLineNr', 'EndOfBuffer',
    },
    extra_groups = { -- table/string: additional groups that should be cleared
      -- In particular, when you set it to 'all', that means all available groups

      "all",

      "BufferLineTabClose",
      "BufferlineBufferSelected",
      "BufferLineFill",
      "BufferLineBackground",
      "BufferLineSeparator",
      "BufferLineIndicatorSelected",

      "TelescopeBorder",
      "FloatermBorder",
      "StatusLine",

      "DiagnosticsSignInfo",

    },
    exclude_groups = {}, -- table: groups you don't want to clear
  }

  vim.cmd("TransparentEnable")

  vim.cmd "highlight DiagnosticSignError guibg=NONE"
  vim.cmd "highlight DiagnosticSignWarn guibg=NONE"
  vim.cmd "highlight DiagnosticSignHint guibg=NONE"
  vim.cmd "highlight DiagnosticSignInfo guibg=NONE"

  vim.cmd "set fillchars=stl:\\ ,stlnc:=,vert:\\|,fold:-,diff:-"
end

M.setup()

return M
