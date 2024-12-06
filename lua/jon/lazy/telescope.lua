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
        vim.keymap.set("n", ";", builtin.buffers, {})
        vim.keymap.set("n", "<C-f>", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "gr", "", {
          callback = require("telescope.builtin").lsp_references
        })
        vim.keymap.set("n", "'", "", {
          callback = require("telescope.builtin").lsp_dynamic_workspace_symbols
        })
        vim.keymap.set("n", "<C-i>", function() builtin.lsp_workspace_symbols("query=S") end, {})
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end
}
