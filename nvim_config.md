-- ============================================
--  Neovim Configuration – Beginner
-- ============================================
--  Location: ~/.config/nvim/init.lua
--  Windows:  ~\AppData\Local\nvim\init.lua


-- ── Line Numbers ─────────────────────────────
vim.opt.number         = true   -- Show absolute line numbers
vim.opt.relativenumber = true   -- Show relative line numbers (useful for jumps)


-- ── Indentation ──────────────────────────────
vim.opt.tabstop        = 2      -- A tab equals 4 spaces
vim.opt.shiftwidth     = 2      -- Indentation width
vim.opt.expandtab      = true   -- Convert tabs to spaces
vim.opt.autoindent     = true   -- Copy indentation from the previous line


-- ── Display ──────────────────────────────────
vim.opt.wrap           = false  -- Disable line wrapping
vim.opt.cursorline     = true   -- Highlight the current line
vim.opt.termguicolors  = true   -- Enable full terminal color support
vim.opt.scrolloff      = 8      -- Keep at least 8 lines visible when scrolling
vim.opt.signcolumn     = "yes"  -- Always show the sign column (for diagnostics etc.)


-- ── Search ───────────────────────────────────
vim.opt.ignorecase     = true   -- Ignore case when searching
vim.opt.smartcase      = true   -- Override ignorecase if uppercase letters are used
vim.opt.hlsearch       = true   -- Highlight search results
vim.opt.incsearch      = true   -- Show matches while typing


-- ── Interaction ──────────────────────────────
vim.opt.mouse          = "a"    -- Enable mouse support
vim.opt.clipboard      = "unnamedplus" -- Use system clipboard (copy/paste)
vim.opt.backspace      = "indent,eol,start" -- Allow backspace across everything
vim.opt.splitright     = true   -- Open vertical splits to the right
vim.opt.splitbelow     = true   -- Open horizontal splits below


-- ── Files ────────────────────────────────────
vim.opt.swapfile       = false  -- Disable swap files
vim.opt.backup         = false  -- Disable backup files
vim.opt.undofile       = true   -- Enable persistent undo history
vim.opt.encoding       = "utf-8"


-- ── Status Line ──────────────────────────────
vim.opt.showmode       = true   -- Display the current mode (INSERT, NORMAL, etc.)
vim.opt.ruler          = true   -- Show cursor position (line/column)


-- ============================================
--  Keybindings
-- ============================================
--  <leader> is the prefix key, here mapped to Space
vim.g.mapleader = " "

local map = vim.keymap.set

-- Clear search highlighting with <leader>h
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Save file with <leader>w
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Quit with <leader>q
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Navigate between split windows using Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })

-- Indent selected text in visual mode
map("v", "<Tab>",   ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })
