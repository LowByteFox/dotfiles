local bun = require("bun")
local bun_tests = require("bun.tests")

bun.setup({
    close_on_exit = false,
    cwd = "current"
})

vim.keymap.set("n", "<leader>br", bun.run_current)
vim.keymap.set("n", "<leader>bt", bun_tests.handler)
