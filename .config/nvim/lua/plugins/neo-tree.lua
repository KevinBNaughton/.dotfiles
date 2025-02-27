-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- See `# Preview Mode` for more information
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = function(_, opts)
    opts.filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    }

    return opts
  end,
  -- TODO - Figure out how to get 3rd/image.nvim to work
  -- config = function()
  --   require('lazy').setup({
  --     {
  --       '3rd/image.nvim',
  --       opts = {},
  --     },
  --   }, {
  --     rocks = {
  --       hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
  --     },
  --   })
  -- end,
}
