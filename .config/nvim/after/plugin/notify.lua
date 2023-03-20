local notify = require("notify")

notify.setup({
    background_colour = "#000000",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "slide",
    timeout = 5000,
    top_down = true
})

vim.notify = notify;
