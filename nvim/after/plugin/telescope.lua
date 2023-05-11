local builtin = require('telescope.builtin')
local map = vim.keymap.set
map('n', '<leader>sf', builtin.find_files, {desc = '[S]earch [F]iles'} )
map('n', '<leader>sg', builtin.live_grep, {desc= '[S]earch [G]rep'} )
map('n', '<leader>sb', builtin.buffers, {desc ='[S]earch [B]uffers'} )
map('n', '<leader>sh', builtin.help_tags, {desc = '[S]earch [H]elp'} )
map('n', '<leader>sc', builtin.colorscheme,{desc = '[S]elect [C]olorchemes'} )
map('n', '<leader>rf', builtin.oldfiles, {desc = '[R]ecent [F]iles'} )
map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sy', builtin.treesitter, {desc = '[S]earch s[y]mbol'})
map('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {desc = '[F]ind in [B]uffer'})


