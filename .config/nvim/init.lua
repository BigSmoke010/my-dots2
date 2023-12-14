require('plugs')
require('leap').add_default_mappings()
require('nvim-ts-autotag').setup()
require('lspsetup')
require('treesetup')
require('indentblankline')
require('colpick')
require('lualineconf')
require('colorscheme')
require('nvim-highlight-colors').setup {}
require('Comment').setup()
local builtin = require('telescope.builtin')

vim.g.mapleader = " "

require("telescope").load_extension "file_browser"
vim.keymap.set('n', '<leader>pp', ':Telescope file_browser<CR>', {})
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>pf', ':Telescope find_files<CR>', {})

vim.keymap.set('n', '<leader>pb', ':Telescope buffers<CR>', {})
vim.keymap.set('n', '<leader>pg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>pd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, {})
-- Lua
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true }
)
vim.cmd("nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.format{ sync = true }<CR>")
vim.cmd("autocmd BufWritePre *.go lua vim.lsp.buf.format{ sync = true}")
vim.cmd(":let g:colorizer_auto_color = 1")
vim.cmd("autocmd FileType python xmap <buffer> <Leader>f <plug>(BlackMacchiatoSelection)")
vim.cmd("autocmd FileType python nmap <buffer> <Leader>f <plug>(BlackMacchiatoCurrentLine)")
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format{ sync = true }]]
vim.cmd("let g:move_key_modifier_visualmode = 'S'")
vim.keymap.set('i', 'jk', '<ESC>', {})
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<leader>bn', ':bn<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bk', ':bdelete<CR>', { noremap = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- adapted from https://github.com/ethanholz/nvim-lastplace/blob/main/lua/nvim-lastplace/init.lua
local ignore_buftype = { "quickfix", "nofile", "help" }
local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

local function run()
  if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
    return
  end

  if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
    -- reset cursor to first line
    vim.cmd [[normal! gg]]
    return
  end

  -- If a line has already been specified on the command line, we are done
  --   nvim file +num
  if vim.fn.line(".") > 1 then
    return
  end

  local last_line = vim.fn.line([['"]])
  local buff_last_line = vim.fn.line("$")

  -- If the last line is set and the less than the last line in the buffer
  if last_line > 0 and last_line <= buff_last_line then
    local win_last_line = vim.fn.line("w$")
    local win_first_line = vim.fn.line("w0")
    -- Check if the last line of the buffer is the same as the win
    if win_last_line == buff_last_line then
      -- Set line to last line edited
      vim.cmd [[normal! g`"]]
      -- Try to center
    elseif buff_last_line - last_line > ((win_last_line - win_first_line) / 2) - 1 then
      vim.cmd [[normal! g`"zz]]
    else
      vim.cmd [[normal! G'"<c-e>]]
    end
  end
end

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'FileType' }, {
  group    = vim.api.nvim_create_augroup('nvim-lastplace', {}),
  callback = run
})

vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undodir = os.getenv("HOME") .. "/.undo/"
vim.o.undofile = true
vim.o.backup = false

vim.o.nu = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.autochdir = true
vim.o.wrap = false
vim.o.mouse = "a"
vim.o.scrolloff = 10

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.hlsearch = false
vim.o.incsearch = true
