vim.cmd [[
    nnoremap <C-n> :NvimTreeToggle<CR>
    nnoremap <leader>n :NvimTreeFindFile<CR>
]]
require('nvim-tree').setup({})
