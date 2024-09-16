require("options")
require("keymap")

-- Don't load packages if the file is large
if require("utils").is_huge_file() then
    return
end

require("plugins")
require("lsp")
