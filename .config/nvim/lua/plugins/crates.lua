local M = {
    "saecki/crates.nvim",
    dependencies = {
	"nvim-lua/plenary.nvim"
    }
}

M.config = function()
    require("crates").setup()
end

return M
