return {
  'Vonr/align.nvim',
  branch = "v2",
  lazy = true,

  -- Defines mappings
  init = function()
    -- Aligns to 1 character
    vim.keymap.set('x', 'aa',
      function()
        require 'align'.align_to_char({
          length = 1,
        })
      end,
      { noremap = true, silent = true, desc = "Align to 1 char" }
    )

    -- Aligns to 2 characters with previews
    vim.keymap.set('x', 'ad',
      function()
        require 'align'.align_to_char({
          preview = true,
          length = 2,
        })
      end,
      { noremap = true, silent = true, desc = "Align to 2 characters" }
    )

    -- Aligns to a string with previews
    vim.keymap.set('x', 'aw',
      function()
        require 'align'.align_to_string({
          preview = true,
          regex = false,
        })
      end,
      { noremap = true, silent = true, desc = "Align to string" }
    )
  end
}
