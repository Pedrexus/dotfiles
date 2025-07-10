return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function ()
    require("neo-tree").setup({
        window = {
            width = 30
        }
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left toggle<CR>', { silent = true })
  end
}