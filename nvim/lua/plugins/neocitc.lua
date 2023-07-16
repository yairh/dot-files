local config = function()
    require('neocitc').setup()
    vim.keymap.set('n', '<leader>fw', require('neocitc').pick_workspace)
end

return {
    { url = 'sso://googler@team/neovim-dev/neocitc', config = config }
}
