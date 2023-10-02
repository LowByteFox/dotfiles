vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.bg = "light"
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 150
vim.g.mapleader = " "

vim.cmd.set("clipboard+=unnamedplus")

vim.cmd[[au VimLeave * set guicursor=a:ver25]]
vim.cmd[[hi CursorLineNr cterm=none ctermbg=4 ctermfg=0]]
vim.cmd[[hi CursorLine cterm=none ctermbg=0]]

vim.cmd[[hi Visual ctermbg=8]]
vim.cmd[[hi ModeMsg cterm=none]]
vim.cmd[[hi MatchParen ctermbg=4 ctermfg=0]]
vim.cmd[[hi EndOfBuffer ctermfg=7]]
vim.cmd[[hi Pmenu ctermfg=white ctermbg=none]]
vim.cmd[[hi LineNr ctermfg=7]]

vim.cmd[[hi TabLine cterm=none ctermbg=0 ctermfg=7]]
vim.cmd[[hi TabLineFill cterm=none ctermbg=0]]
vim.cmd[[hi TabLineSel cterm=none ctermfg=15]]

vim.cmd[[hi StatusLine cterm=none ctermbg=0 ctermfg=7]]
vim.cmd[[hi StatusLineNC cterm=none ctermbg=0 ctermfg=7]]

vim.g.zig_fmt_autosave = 0

vim.keymap.set("n", "<leader>pc", function()
	vim.cmd.enew()
	vim.cmd.Ex()
end)

vim.keymap.set("n", "<leader>tt", function()
	vim.cmd[[botright new]]
	vim.cmd.terminal()
	vim.cmd[[setlocal nonumber norelativenumber]]
	vim.cmd[[startinsert]]
end)

vim.cmd[[autocmd TermClose * lua send_exit() ]]

function send_exit()
    if vim.bo.buftype == 'terminal' then
		vim.cmd[[q!]]
    end
end
