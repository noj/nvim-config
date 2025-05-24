return {
  'Vonr/align.nvim',
  branch = "v2",
  lazy = true,

  -- Defines mappings
  init = function()
    local NS = { noremap = true, silent = true }

    -- Aligns to 1 character
    vim.keymap.set(
      'x',
      'aa',
      function()
        require'align'.align_to_char({
          length = 1,
        })
      end,
      NS
    )

    -- Aligns to 2 characters with previews
    vim.keymap.set(
      'x',
      'ad',
      function()
        require'align'.align_to_char({
          preview = true,
          length = 2,
        })
      end,
      NS
    )

    -- Aligns to a string with previews
    vim.keymap.set(
      'x',
      'aw',
      function()
        require'align'.align_to_string({
          preview = true,
          regex = false,
        })
      end,
      NS
    )

  end
}
