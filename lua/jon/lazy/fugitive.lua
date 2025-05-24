return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Run git" })

    local Jon_Fugitive = vim.api.nvim_create_augroup("Jon_Fugitive", {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = Jon_Fugitive,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set("n", "<leader>p", function()
          vim.cmd.Git("push")
        end, { buffer = bufnr, remap = false, desc = "Git push" })

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
          vim.cmd.Git({ "pull", "--rebase" })
        end, { buffer = bufnr, remap = false, desc = "Git pull" })

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", { buffer = bufnr, remap = false });
      end,
    })

    vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "Diffget 2" })
    vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "Diffget 3" })
  end
}
