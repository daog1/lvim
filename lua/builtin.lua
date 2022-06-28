local M = {}
local actions = require("telescope.actions")
M.pastfn = function(prompt_bufnr)
  local action_state = require "telescope.actions.state"
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  current_picker:reset_prompt()
  local entry = vim.fn.getreg("*")
  if entry ~= nil then
    current_picker:set_prompt(entry)
  end
end
M.config = function()
  lvim.builtin.project.active = true
  lvim.builtin.project.detection_methods = { "lsp", "pattern" }
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-v>"] = M.pastfn --actions.cycle_history_prev
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
  require 'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        node_incremental = '<CR>',
        node_decremental = '<BS>',
        scope_incremental = '<TAB>',
      }
    },
  }
  lvim.builtin.treesitter.textobjects.move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]f"] = "@function.outer",
      ["]]"] = "@class.outer",
    },
    goto_next_end = {
      ["]F"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[f"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[F"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  }

end
return M
