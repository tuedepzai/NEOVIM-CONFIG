vim.cmd([[
    cd ~/Desktop/Code
    set hls
    set is
        set cb=unnamed
    set gfn=Fixedsys:h10
    set ts=4
    set sw=4
    set si
    au GUIEnter * simalt ~x
    set number

    inoremap { {}<Left>
    inoremap {<CR> {<CR>}<Esc>O
    inoremap {{ {
    inoremap {} {}
]])



-- Packer stuff

vim.cmd([[
    packadd packer.nvim
]])

local packer, error = pcall(function()
    require('packer')
end)

if(error) then
      print("error loading packer")
end


require('packer').startup(function(use)
print("using packer")
use 'wbthomason/packer.nvim'
use { "ellisonleao/gruvbox.nvim" }

use {'sainnhe/everforest'}
use {"xero/miasma.nvim"}

--cp
use 'neoclide/coc.nvim'
--set up plugin
vim.cmd([[
    set background=dark
    colorscheme everforest
    let b:coc_diagnostic_disable=1

]])
--tree
use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }

  vim.cmd([[
  inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

  ]])


end)

vim.keymap.set('n', '<tab>', function()
  local neotree_open = vim.fn.exists('t:neotree')
  
  if neotree_open == 1 then
    vim.cmd('Neotree close')
  else
    local file_path = vim.fn.expand('%:p:h')  
    vim.cmd('Neotree position=current')
    vim.api.nvim_set_var('neotree', true)  
  end
end, { silent = true })

vim.keymap.set('n', '<C-B>', function()
  vim.cmd([[
    !g++ % -o -Wall -Wextra -pedantic -std=c++17 -O3 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC && -Wall.exe < in > out
  ]])
end, {silent = true})
