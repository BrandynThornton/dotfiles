vim.g.mapleader = ' '

-- Highlight the line your cursor is currently on
vim.opt.cursorline = true

-- Enable mouse support in all modes (click to place cursor, scroll, etc.)
vim.opt.mouse = "a"

-- Show a vertical column at 80 characters as a formatting guide
vim.opt.colorcolumn = "80"

-- Fast updates (improves responsiveness of diagnostics and signs)
vim.opt.updatetime = 250

-- Highlight all matches when searching with /
vim.opt.hlsearch = true

-- Ignore case when searching...
vim.opt.ignorecase = true
-- ...unless the search query contains an uppercase letter
vim.opt.smartcase = true

-- Don't wrap long lines automatically onto a new visual line
vim.opt.wrap = false

-- Keep 8 lines visible above/below the cursor when scrolling
vim.opt.scrolloff = 16

-- Set indentation to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers (highly recommended for Vim navigation)
vim.opt.relativenumber = true

-- Sync Neovim clipboard with Windows system clipboard
vim.opt.clipboard = 'unnamedplus'

vim.opt.undofile = true -- persistent undo across sessions
