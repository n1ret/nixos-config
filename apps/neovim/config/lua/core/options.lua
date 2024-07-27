local opt = vim.opt

local set_tab_size = function(spaces)
  opt.tabstop = spaces
  opt.shiftwidth = spaces
  opt.softtabstop = spaces
end

-- tabs & indentation
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
set_tab_size(4)

-- set 2 spaces tabs in files with this extensions
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "nix"},
  callback = function() set_tab_size(2) end
})

-- line wrapping
opt.wrap = false
opt.linebreak = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- current line highlight
opt.cursorline = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- number lines
opt.number = true

-- consider string-string as whole word
opt.iskeyword:append("-")

-- turn on undo file
opt.undofile = true

