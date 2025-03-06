vim.g.mapleader = ' '

vim.keymap.set('n', '-', vim.cmd.Ex)
vim.opt.ruler = true

-- Why a command used so much needs more keystroke than a barely known command?
vim.keymap.set('n', ':', ';')
vim.keymap.set('n', ';', ':')

-- better ESC
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('t', 'jk', "<C-\\><C-N>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<Leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<Leader>y", [["+y]])
vim.keymap.set("n", "<Leader>Y", [["+Y]])

vim.keymap.set("n", "<Leader><Leader>", function()
    vim.cmd("so")
end)

-- Emacs bindings in command line mode
vim.keymap.set('c', '<C-A>', '<Home>')
vim.keymap.set('c', '<C-E>', '<End>')

-- Beginning & End of line in mode
vim.keymap.set('n', '<C-A>', '^')
vim.keymap.set('n', '<C-E>', 'g_')
vim.keymap.set('v', '<C-A>', '^')
vim.keymap.set('v', '<C-E>', '$')

-- Make u/U behave for undo like n/N does for search
vim.keymap.set('n', 'U', '<C-R>')

-- You want to be part of the gurus? Time to get in serious stuff and stop using
-- arrow keys. Learn the Hard Way!
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- Yank from current cursor position to end of line
vim.keymap.set('', 'Y', 'y$')

-- Fast saving and closing current buffer without closing windows displaying
-- the buffer
vim.keymap.set('n', '<Leader>wq', ':w!<CR>:<C-U>bprevious <bar> bdelete #<CR>')
vim.keymap.set('n', '<Leader>bc', ':<C-U>bprevious <bar> bdelete #<CR>')

-- Make copy/paste from system clip easier
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('v', '<Leader>p', '"+p')

vim.keymap.set('n', '<Leader>u', 'yypVr-')
vim.keymap.set('n', '<Leader>U', 'yypVr=')

-- pretty print JSON using python native tools
vim.keymap.set('n', '<Leader>pp', ':%!python3 -m json.tool<CR>')

-- URL encode/decode selection
vim.keymap.set('v', '<leader>uen', ":!python3 -c 'import sys,urllib;print urllib.quote(sys.stdin.read().strip())'<cr>")
vim.keymap.set('v', '<leader>ude', ":!python3 -c 'import sys,urllib;print urllib.unquote(sys.stdin.read().strip())'<cr>")

-- Instead of :tag jumping to first match definition, it jumps to the
-- definition if there is only one match. Else, it displays a list of all
-- matching tags.
vim.keymap.set('n', '<C-]>', 'g<C-]>')

-- Seriously, guys. It's not like :W is bound to anything anyway.
vim.api.nvim_create_user_command('W', ":w", { bang = true })
vim.api.nvim_create_user_command('Wq', ":wq", { bang = true })
vim.api.nvim_create_user_command('Q', ":q", { bang = true })

-- Reselect visual block after indent/outdent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- sane regexes
vim.keymap.set('n', '/', "/\\v")
vim.keymap.set('v', '/', "/\\v")

-- clear search matching
vim.keymap.set('', '<Leader>/', ':noh<CR>:call clearmatches()<CR>')

-- Keep search matches in the middle of the window.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Same when jumping around
vim.keymap.set('n', 'g;', 'g;zz')
vim.keymap.set('n', 'g,', 'g,zz')

-- Open a Quickfix window for the last search.
vim.keymap.set('n', '<Leader>?', ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Copy the file name of the file in the current buffer to the unnamed register
vim.keymap.set('n', ':let @" = expand("%")<cr>')
