-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>t", ":TestNearest <CR>")
map("n", "<leader>T", ":TestFile<CR>")
map("n", "<leader>a", ":TestSuite<CR>")
