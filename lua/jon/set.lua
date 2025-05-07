vim.cmd.colorscheme("vesper")

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.textwidth = 80

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true

vim.opt.spell = true

vim.opt.backspace = "indent,eol,start"

vim.opt.wrap = false

-- netrw
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0

vim.cmd([[ nnoremap <leader>dd :Lexplore %:p:h<CR> ]])
vim.cmd([[ nnoremap <Leader>da :Lexplore<CR>]])

-- auto commands
vim.cmd([[ autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab ]])
vim.cmd([[ autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab ]])

vim.cmd([[ augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END
]])

-- vim.api.nvim_create_autocmd({"LspAttach"}, {
--   callback = function()
--     wk.register({
--       g = {
--         name = "Goto"
--         d = { vim.lsp.buf.definition, "Go to definition" },
--         r = { require("telescope.builtin").lsp_references,
--           "Open a telescope window with references" },
--       },
--     }, { buffer = 0 })
--   end
-- })
