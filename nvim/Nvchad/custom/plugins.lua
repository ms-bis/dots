local plugins = {
  {
    "sitiom/nvim-numbertoggle",
    lazy = false
  },
  {
    "stevearc/dressing.nvim",
    lazy = false
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require'nvim-lastplace'.setup{}
    end,
  },
}

return plugins
