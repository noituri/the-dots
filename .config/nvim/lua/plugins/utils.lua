return {
  {
    "theKnightsOfRohan/hexer.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>co", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
      require("outline").setup()
    end,
  },
  {
    "j-hui/fidget.nvim"
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    config = function()
      vim.keymap.set("n", "<leader>-", "<cmd>Yazi<CR>", { desc = "Yazi" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Git blame" })
      require('gitsigns').setup({
        current_line_blame_opts = {
          delay = 0,
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.keymap.set("n", "<leader>", "<cmd>WhichKey <lt>leader><CR>", { desc = "Keymap" })
      require("which-key").setup()
    end
  },
  {
    "folke/trouble.nvim",
    config = function()
      vim.keymap.set("n", "<leader>cx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
      vim.keymap.set("n", "<leader>cX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
        { desc = "Diagnostics (buffer)" })
      require("trouble").setup()
    end
  },
  {
    "https://codeberg.org/andyg/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      vim.keymap.set({ 'n', 'x', 'o' }, 'gw', '<Plug>(leap)', { desc = "Go to word" })
    end
  },
  {
    "nvim-mini/mini.surround",
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = 'ms',        -- Add surrounding in Normal and Visual modes
          delete = 'md',     -- Delete surrounding
          find = 'mf',       -- Find surrounding (to the right)
          find_left = 'mF',  -- Find surrounding (to the left)
          highlight = 'mh',  -- Highlight surrounding
          replace = 'mr',    -- Replace surrounding

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
      })
    end
  },
  {
    "nvim-mini/mini.pairs",
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "<leader>a", require("actions-preview").code_actions)
    end
  }
}
