vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter,BufRead,BufNewFile,FileType * setlocal formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter *.tpp setlocal filetype=cpp
    autocmd BufEnter *.tcu setlocal filetype=cuda
  augroup end
]]
-- some command
