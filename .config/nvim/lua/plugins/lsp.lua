return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client:supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          end
        end,
      })

      vim.lsp.config('*', {
        root_markers = { '.git' },
      })
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      vim.lsp.enable("clangd")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("wgsl_analyzer")
      vim.lsp.enable("zls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("nushell")
      vim.lsp.enable("slang")
      vim.lsp.enable("lua_ls")
    end
  },
  {
    "saghen/blink.cmp",
    version = "v1",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "default",
          ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
          ['<CR>'] = { 'accept', 'fallback' },
        }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
  }
};
