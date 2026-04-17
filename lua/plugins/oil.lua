return {
  'stevearc/oil.nvim',
  lazy = false,  -- recommended by the author, don't lazy load this one
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' }, -- optional, for file icons
    { 'nvim-mini/mini.icons', version = false }
  },
  config = function()
    require('oil').setup({
      default_file_explorer = true,  -- replaces netrw
      view_options = {
        show_hidden = true,          -- show dotfiles
      },
    })
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set("n", "<leader>ol", function()
        vim.cmd("topleft vsplit | enew") -- Create a vertical split on the far left
        require("oil").open()
        end, { desc = "Open Oil to the left" })
  end,
}
