return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  config = function()
    require("telescope").setup()
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")

    vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Files" })
    vim.keymap.set("n", "<leader>e", function() builtin.find_files({ cwd = utils.buffer_dir() }) end,
      { desc = "Files (current dir)" })
    vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Grep search" })

    vim.keymap.set('n', '<leader>d', function()
      require('telescope.builtin').diagnostics({
        bufnr = 0,
        severity_limit = "WARN",
      })
    end, { desc = "Telescope Buffer Diagnostics" })
    vim.keymap.set('n', '<leader>D', function()
      require('telescope.builtin').diagnostics({
        severity_limit = "WARN",
      })
    end, { desc = "Telescope Project Diagnostics" })

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        vim.keymap.set('n', 'gr', builtin.lsp_references, {
          buffer = event.buf,
          desc = 'Find LSP references'
        })

        vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {
          buffer = event.buf,
          desc = 'Buffer symbols'
        })

        vim.keymap.set('n', '<leader>S', builtin.lsp_dynamic_workspace_symbols, {
          buffer = event.buf,
          desc = 'Workspace symbols'
        })
      end,
    })
  end
}
