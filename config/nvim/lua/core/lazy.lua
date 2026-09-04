-- lua/core/lazy.lua
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Si la carpeta no existe todavía, clonamos lazy.nvim
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none", -- clona más rápido, sin bajar todo el historial
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Le decimos a Neovim que agregue esa carpeta a su "runtimepath"
-- (donde busca plugins) antes de intentar usarla
vim.opt.rtp:prepend(lazypath)

-- "import = 'plugins'" le dice a lazy.nvim: entra a lua/plugins/
-- y trata cada archivo .lua ahí como la definición de un plugin distinto.
-- Así, para agregar un plugin nuevo en el futuro, solo creas un archivo
-- más en esa carpeta, no tocas este archivo.
require("lazy").setup("plugins", {
  install = { colorscheme = { "catppuccin" } }, -- colorscheme a usar mientras instala todo la primera vez
  checker = { enabled = false }, -- no chequear updates automáticamente en cada arranque
  change_detection = { notify = false }, -- no molestar con notificaciones si editas un plugin file a mano
})
