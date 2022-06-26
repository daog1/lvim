

local M = {}

M.config = function()
    lvim.builtin.lualine.style = "default"
    local components = require "lvim.core.lualine.components"
    lvim.builtin.lualine.sections = {
    lualine_a = {
        -- components.mode,
        "mode",
    },
    lualine_b = {
        components.branch,
        components.filename,
    },
    lualine_c = {
        components.diff,
        components.python_env,
    },
    lualine_x = {
        components.diagnostics,
        components.treesitter,
        components.lsp,
        components.filetype,
        "fileformat",
        components.encoding,
    },
    lualine_y = {
        components.progress,
    },
    lualine_z = {
        -- components.scrollbar,
        components.location,
    },
    }

end
return M