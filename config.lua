-- general
vim.o.guifont = "FiraCode NF:h10"

vim.cmd [[set mouse=a]]
-- Enable powershell as your default shell
-- vim.opt.shell = "pwsh.exe -NoLogo"
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<CR>"
lvim.keys.normal_mode["<F1>"] = "<cmd>lua vim.diagnostic.open_float()<CR>"
lvim.keys.normal_mode["<F2>"] = ":WhichKey<CR>"
lvim.keys.normal_mode["<F3>"] = ":Telescope live_grep_args<CR>"
--lvim.keys.normal_mode["<F4>"] = ":AerialToggle<CR>"
lvim.keys.normal_mode["<F4>"] = ":SymbolsOutline<CR>"
lvim.keys.normal_mode["<F5>"] = "<Esc>:Telescope treesitter<CR>"
lvim.keys.normal_mode["<F6>"] = ":terminal<CR>"
lvim.keys.normal_mode["Z"] = ":ZenMode<CR>"

lvim.builtin.which_key.mappings["P"] = {
  "<CMD>Telescope projects<CR>", "Projects"
}
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
-- set keymap with custom opts
-- lvim.keys.insert_mode["po"] = {'<ESC>', { noremap = true }}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- Configure builtin plugins
lvim.builtin.alpha.active = true
-- lvim.builtin.which_key.setup.plugins.marks =false
-- lvim.builtin.which_key.setup.plugins.registers  = false
lvim.builtin.which_key.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.open_on_setup = true
lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.view.auto_resize = true


lvim.builtin.telescope.defaults.vimgrep_arguments = {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--smart-case",
}



-- Treesitter parsers change this to a table of the languages you want i.e. {"java", "python", javascript}
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "go",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.lsp.automatic_servers_installation = true


-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = true

-- Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black" },
  {
    command = "prettier",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact" },
  },
}


require("builtin").config()
require("plugins").config()
require("lualine").config()
-- lvim.builtin.telescope.on_config_done = function(telescope)
-- pcall(telescope.load_extension, "ag")
-- any other extensions loading
-- end
-- Buffer Line
lvim.builtin.bufferline.options.numbers = "ordinal"
lvim.builtin.bufferline.options.separator_style = { '|', '|' }



