vim.cmd([[
    cd C:\Users\Admin\Desktop\code
    set hls
    set is
        set cb=unnamed
    set gfn=Fixedsys:h10
    set ts=4
    set sw=4
    set si
    au GUIEnter * simalt ~x

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


--cp
use 'neoclide/coc.nvim'
--set up plugin
vim.cmd([[
    set background=light
    colorscheme gruvbox
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


end)

vim.keymap.set('n', '<tab>', function()
  local neotree_open = vim.fn.exists('t:neotree')
  
  if neotree_open == 1 then
    vim.cmd('Neotree close')
  else
    local file_path = vim.fn.expand('%:p:h')  
    vim.cmd('Neotree position=current ' .. file_path)
    vim.api.nvim_set_var('neotree', true)  
  end
end, { silent = true })


