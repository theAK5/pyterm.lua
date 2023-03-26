# pyterm.lua
Lua script to run currently open python file in a split terminal in neovim.


Currently in development!

# Installation

Copy 'pyterm.lua' to nvim config and require it.

# Usage

Use the following vim command while a python script is currently open in a buffer.

`:lua Pyterm()`

<img src = https://user-images.githubusercontent.com/90126164/227781215-a5632917-61f3-4a78-b50a-d3f68679f562.png width = "900" height ="500">

For ease of access, it would be better to map it to any preferred key(s). For example, use this autocmd to map it to f5:

`vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = [[nnoremap <f5> :lua Pyterm()<Cr>]] })`

# Features
- If an existing terminal is open in a split buffer that is visible, the script will not open another terminal instead run in the already open terminal

More features to be added soon!

# Dependencies
`python3`
