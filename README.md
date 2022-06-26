# lvim

Custom lvim config

lvim 自定义配置

  ```
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
  ```
## Install Instructions

- Copy in command line:

  ```
  cd ~/.config && rm -rf lvim && git clone https://github.com/daodao2007/lvim.git
  ```

- Enter lvim (I made an alias `alias vim="lvim"` in my .zshrc file)
- Enter command:

  ```
  :PackerSync
  ```

- Exit vim and it should be good to go!
- Thanks for using!