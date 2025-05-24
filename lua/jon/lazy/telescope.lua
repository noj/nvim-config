return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require("telescope").setup({
      defaults = {
        border = false
      }
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", ";", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
    vim.keymap.set("n", "gr", "", {
      callback = require("telescope.builtin").lsp_references
    }, { desc = "LSP references" })
    vim.keymap.set("n", "gs", "", {
      callback = require("telescope.builtin").lsp_dynamic_workspace_symbols
    }, { desc = "LSP symbols" })
    vim.keymap.set("n", "<C-i>", function() builtin.lsp_workspace_symbols("query=S") end, { desc = "LSP symbols" })
    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, { desc = "Grep string under cursor" })
    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "Grep word under cursor" })
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Interactive grep" })
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Help tags" })
  end
}
