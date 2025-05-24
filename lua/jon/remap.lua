vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file exporer" })

-- moves block of text in visual mode with J and K:
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix navigation
vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>zz", { desc = "Quickfix next" })
vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>zz", { desc = "Quickfix prev" })

-- Neomake
vim.keymap.set("n", "<leader>m", ":make!<CR>", { desc = "Run make" })

-- nvim-tree
vim.keymap.set("n", "<leader>tf", ":NvimTreeToggle<CR>", { desc = "Toggle nvim tree" })

vim.keymap.set("n", "<leader>A", ":ClangdSwitchSourceHeader<CR>", { desc = "Toggle header/source files" })
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { desc = "Goto prev diagnostic" })

vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "Run LSP code actions" })

-- LSP
-- vim.keymap.set("n", "gr", "", {
--   callback = require("telescope.builtin").lsp_references
-- })
-- vim.keymap.set("n", "'", "", {
--   callback = require("telescope.builtin").lsp_dynamic_workspace_symbols
-- })
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = "Toggle diagnostics" })

-- TreeWalker
-- movement
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<cmd>Treewalker Up<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<cmd>Treewalker Down<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<cmd>Treewalker Left<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<cmd>Treewalker Right<cr>', { silent = true })

-- swapping
vim.keymap.set('n', '<C-S-k>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
vim.keymap.set('n', '<C-S-j>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
vim.keymap.set('n', '<C-S-h>', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
vim.keymap.set('n', '<C-S-l>', '<cmd>Treewalker SwapRight<cr>', { silent = true })

-- Quick current-word-under-cursor highlighting toggle, toggle via space bar
vim.keymap.set("n", " ", "", {
  callback = function()
    local current_word = vim.call('expand', '<cword>')

    if vim.o.hlsearch then
      -- if new word, we should clear and highlight again
      local pattern = '^\\<' .. current_word .. '\\>$'
      if string.match(vim.fn.getreg('/'), pattern) then
        -- not a new word, just turn highlighting off
        vim.o.hlsearch = false
        return
      end
    end

    vim.fn.setreg('/', '\\<' .. current_word .. '\\>')
    vim.o.hlsearch = true
  end,
  noremap = true,
  silent = true,
  desc = "Toggle highlighting current word under cursor",
})
