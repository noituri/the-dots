local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "gh", "^", { desc = "Go to the start of the line" })
map("n", "gl", "$", { desc = "Go to the end of the line" })
map("n", "ge", "G", { desc = "Go to the bottom of the buffer" })
map({ "n", "v" }, "<C-c>", "<cmd>normal gcc<cr>", { desc = "Go to the bottom of the buffer" })

map("n", "U", ":redo<cr>", { desc = "Redo" })

map("n", "<C-s>", ":w<cr>", { desc = "Save buffer" })

map("n", "x", "V", { noremap = true, desc = "Select whole line" })
map('v', 'x', function()
    if vim.fn.mode() == 'V' then
        return 'j'
    else
        return 'V'
    end
end, { expr = true, noremap = true, desc = "Select whole line" })

map("n", "d", "x", { desc = "Delete character under the selection" })

map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("v", "p", '"_dP', { desc = "Paste" })
map("v", "<leader>p", '"_d"+P', { desc = "Paste from system clipboard" })
map("v", "R", '"_dP', { desc = "Replace selection with local yank register" })
map("v", "<leader>R", '"_d"+P', { desc = "Replace selection with system yank register" })

map('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  end
  return '<Tab>'
end, { expr = true, replace_keycodes = true })

map('i', '<S-Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  end
  return '<S-Tab>'
end, { expr = true, replace_keycodes = true })

map({ "x", "o", "n" }, '<M-o>', function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_parent(vim.v.count1)
  else
    vim.lsp.buf.selection_range(vim.v.count1)
  end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

map({ "x", "o", "n" }, "<M-i>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_child(vim.v.count1)
  else
    vim.lsp.buf.selection_range(-vim.v.count1)
  end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', '<leader>r', vim.lsp.buf.rename, opts)
    map({ "n", "v" }, "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

map('n', 'E', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
