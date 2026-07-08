-- lua/core/lazy.lua
--
-- Este archivo hace DOS cosas:
--   1. Si "lazy.nvim" (el gestor de plugins) no está instalado en el
--      disco, lo clona automáticamente desde GitHub. Así, si algún día
--      reinstalas tu sistema, con clonar este repo y abrir nvim ya se
--      instala todo solo. Es el mismo truco que usan LazyVim, etc,
--      pero aquí lo controlas tú.
--   2. Le dice a lazy.nvim: "carga como plugins todo lo que encuentres
--      dentro de lua/plugins/". Cada archivo ahí adentro es UN plugin.

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
