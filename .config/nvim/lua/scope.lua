local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ef', builtin.find_files, {})
vim.keymap.set('n', '<leader>eb', builtin.buffers, {})
vim.keymap.set('n', '<leader>eg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
