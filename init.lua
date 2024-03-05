vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    branch = "starter",
    import = "nvchad.plugins",
    config = function()
      require "options"
      dofile(vim.g.base46_cache .. "defaults")
    end,
  },

  { import = "plugins" },
}, lazy_config)

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
