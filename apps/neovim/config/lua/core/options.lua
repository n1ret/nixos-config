local opt = vim.opt

-- tabs & indentation
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2

-- line wrapping
opt.wrap = true
opt.linebreak = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- other
opt.number = true
opt.iskeyword:append("-") -- consider string-string as whole word
opt.undofile = true

