-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd 'normal! g`"zz'
    end
  end,
})

-- -- Dim inactive windows
-- vim.cmd 'highlight default DimInactiveWindows guifg=#666666'
-- -- When leaving a window, set all highlight groups to a "dimmed" hl_group
-- vim.api.nvim_create_autocmd({ 'WinLeave' }, {
--   callback = function()
--     local highlights = {}
--     for hl, _ in pairs(vim.api.nvim_get_hl(0, {})) do
--       table.insert(highlights, hl .. ':DimInactiveWindows')
--     end
--     vim.wo.winhighlight = table.concat(highlights, ',')
--   end,
-- })
-- -- When entering a window, restore all highlight groups to original
-- vim.api.nvim_create_autocmd({ 'WinEnter' }, {
--   callback = function()
--     vim.wo.winhighlight = ''
--   end,
-- })

-- Show cursorline only on active windows
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = false
    end
  end,
})
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})
