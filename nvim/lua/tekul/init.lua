require("tekul.options")
require("tekul.keymap")

-- Don't load packages if the file is large
if require("tekul.utils").is_huge_file() then
	return
end

require("tekul.lazy")
