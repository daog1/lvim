local M = {}

M.config = function()
    lvim.plugins = {
        { "lunarvim/colorschemes" },
        { 'ellisonleao/gruvbox.nvim' },
        {
          "nvim-telescope/telescope-project.nvim",
          event = "BufWinEnter",
          setup = function()
            vim.cmd [[packadd telescope.nvim]]
          end,
        },
        {
          'fgheng/winbar.nvim',
          config = function()
            require('winbar').setup{
              enabled = true,

              show_file_path = true,
              show_symbols = true,
          
            }
            --require("winb").config()
          end,
        },{
          "folke/trouble.nvim",
          config = function()
            require("trouble").setup {
              mode="document_diagnostics",
              auto_preview = true,
            }
          end,
        },
        {
          "kevinhwang91/nvim-bqf",
          event = { "BufRead", "BufNew" },
          config = function()
            require("bqf").setup({
              auto_enable = true,
              preview = {
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
              },
              func_map = {
                vsplit = "",
                ptogglemode = "z,",
                stoggleup = "",
              },
              filter = {
                fzf = {
                  action_for = { ["ctrl-s"] = "split" },
                  extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                },
              },
            })
          end,
        },
        {
          "nvim-telescope/telescope-live-grep-args.nvim",
          config =function()
            require("telescope").load_extension("live_grep_args")
            vim.api.nvim_set_keymap("n", "<C-S-F>", "<CMD>Telescope live_grep_args<CR>", { noremap = true })
          end,
        },
        { "folke/tokyonight.nvim" },
        {
          "tpope/vim-repeat",
        },
        { "ur4ltz/surround.nvim",
          config = function()
            require"surround".setup {mappings_style = "surround"}
          end
        },
        {
          "stevearc/aerial.nvim",
          config = function()
            require("aerial").setup()
          end,
        },
        {
          "p00f/nvim-ts-rainbow",
        },
        {
          "simrat39/symbols-outline.nvim",
          config = function()
            require("symbols-outline").setup()
          end,
        },
        {
          "ray-x/lsp_signature.nvim",
        },
        { "j-hui/fidget.nvim" },
        {
          "folke/twilight.nvim",
          event = "BufRead",
        },
        {
          "folke/zen-mode.nvim",
          event = "BufRead",
        }, {
          "nvim-treesitter/nvim-treesitter-textobjects",
        }
      }
end
return M