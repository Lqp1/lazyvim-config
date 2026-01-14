-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- <Leader>f: Smart Files (Git or standard)
map("n", "<leader>f", function()
  -- Check if inside git repo
  local is_git = vim.fn.system("git rev-parse --is-inside-work-tree"):match("true")
  if is_git then
    Snacks.picker.git_files()
  else
    Snacks.picker.files()
  end
end, { desc = "Find Files (Smart)" })

-- <Leader>b: Buffers
map("n", "<leader>b", function() Snacks.picker.buffers() end, { desc = "Buffers" })

-- <Leader>a: Rg (Live Grep)
map("n", "<leader>a", function() Snacks.picker.grep() end, { desc = "Grep (Rg)" })

-- <Leader>r: History (Recent Files)
map("n", "<leader>r", function() Snacks.picker.recent() end, { desc = "Recent" })

-- <Leader>*: Grep word under cursor
map("n", "<leader>*", function() Snacks.picker.grep_word() end, { desc = "Grep Word" })

-- K: Show documentation
-- Checks if LSP hover is available, otherwise falls back to 'K' (keywordprg)
map("n", "K", function()
  local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/hover" })
  if #clients > 0 then
    vim.lsp.buf.hover()
  else
    vim.cmd("normal! K")
  end
end, { desc = "Hover Documentation" })
