return {
  {
    "rachartier/tiny-glimmer.nvim",
    config = function()
      require("tiny-glimmer").setup({
        enabled = true,
        overwrite = {
          auto_map = true,
          yank = {
            enabled = true,
            default_animation = "fade",
          },
          search = {
            enabled = false,
            default_animation = "pulse",
            next_mapping = "n", -- Key for next match
            prev_mapping = "N", -- Key for previous match
          },
          paste = {
            enabled = true,
            default_animation = "reverse_fade",
            paste_mapping = "p", -- Paste after cursor
            Paste_mapping = "P", -- Paste before cursor
          },
          undo = {
            enabled = false,
            default_animation = {
              name = "fade",
              settings = {
                from_color = "DiffDelete",
                max_duration = 500,
                min_duration = 500,
              },
            },
            undo_mapping = "u",
          },
          redo = {
            enabled = false,
            default_animation = {
              name = "fade",
              settings = {
                from_color = "DiffAdd",
                max_duration = 500,
                min_duration = 500,
              },
            },
            redo_mapping = "<c-r>",
          },
        },
      })
    end
  },
  {
    "goolord/alpha-nvim",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-mini/mini.icons'
    },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "nvim-mini/mini.indentscope",
  },
  {
    "AlexvZyl/nordic.nvim",
    config = function()
      local nordic = require('nordic')
      nordic.setup({
        transparent = {
          bg = true,
          float = false,
        }
      })
      nordic.load()
      vim.cmd("colorscheme nordic")
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- vim.opt.background = "dark"
      -- vim.cmd("colorscheme oxocarbon")
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      -- vim.cmd("colorscheme nord")
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    as = "dracula",
    config = function()
      require("dracula").setup({
        transparent_bg = true,
      })
      -- vim.cmd("colorscheme dracula")
    end,
  },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        }
      })
      -- vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        transparent_background = true,
        float = {
          transparent = true,
          solid = false,
        }
      })
      -- vim.cmd("colorscheme catppuccin-nvim")
    end,
  },
  {
    "https://codeberg.org/evergarden/nvim.git",
    as = "evergarden",
    config = function()
      require("evergarden").setup({
        theme = {
          variant = "winter",
          accent = "purple",
        },
        editor = {
          transparent_background = true,
        }
      })
      -- vim.cmd("colorscheme evergarden")
    end,
  }
}
