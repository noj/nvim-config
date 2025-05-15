vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- moves block of text in visual mode with J and K:
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- Neomake
vim.keymap.set("n", "<leader>m", ":Neomake!<CR>")

-- nvim-tree
vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>A", ":ClangdSwitchSourceHeader<CR>")
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- LSP
-- vim.keymap.set("n", "gr", "", {
--   callback = require("telescope.builtin").lsp_references
-- })
-- vim.keymap.set("n", "'", "", {
--   callback = require("telescope.builtin").lsp_dynamic_workspace_symbols
-- })
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

-- Quick current-word-under-cursor highlighting toggle, toggle via space bar
vim.keymap.set("n", " ", "", {
  callback = function()
    local current_word = vim.call('expand','<cword>')

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
