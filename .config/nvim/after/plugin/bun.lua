local bun = require("bun")

bun.setup({
    close_on_exit = true,
    cwd = "current"
})

vim.keymap.set("n", "<leader>br", bun.run_current)
