local config = function()
  local nvterm = require('nvterm')
  local opts = { noremap = true, silent = true }
  local toggle_modes = { 'n', 't' }

  nvterm.setup({
    terminals = {
      shell = vim.o.shell,
      list = {},
      type_opts = {
        float = {
          relative = 'editor',
          row = 0.25,
          col = 0.17,
          width = 0.65,
          height = 0.5,
          border = "rounded",
        },
        horizontal = { location = "rightbelow", split_ratio = .3, },
        vertical = { location = "rightbelow", split_ratio = .5 },
      }
    },
    behavior = {
      autoclose_on_quit = {
        enabled = false,
        confirm = true,
      },
      close_on_exit = true,
      auto_insert = true,
    }
  })

  vim.keymap.set(toggle_modes, '<A-a>', function() require("nvterm.terminal").toggle('float') end)
  vim.keymap.set(toggle_modes, '<A-z>', function() require("nvterm.terminal").toggle('horizontal') end)
  vim.keymap.set(toggle_modes, '<A-q>', function() require("nvterm.terminal").toggle('vertical') end)
end

return {
  {
    "NvChad/nvterm",
    config = config
  },

}
