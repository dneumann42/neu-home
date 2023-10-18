require("plugins")
  .bootstrap()
  .setup()

require("keybindings").setup()
require("config").setup()
require("configs/config")
require("autocommands").setup()
require("theme").setup()
