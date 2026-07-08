-- lua/core/options.lua
--
-- "vim.opt" es la forma moderna (Lua) de escribir lo que antes en
-- vimscript era ":set numero". Cada línea de acá reemplaza una línea
-- de un .vimrc clásico.

local opt = vim.opt

-- Números de línea
opt.number = true -- muestra el número de línea actual
opt.relativenumber = true -- y el resto relativo a esa (útil para "5j", "3dd", etc)

-- Indentación: 2 espacios, sin tabs reales (más predecible entre archivos)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Que el cursor nunca quede pegado arriba/abajo del todo al hacer scroll
opt.scrolloff = 8

-- Búsqueda
opt.ignorecase = true -- ignora mayúsculas/minúsculas...
opt.smartcase = true -- ...salvo que escribas alguna mayúscula tú mismo
opt.hlsearch = false -- no dejar resaltado el resultado de la búsqueda anterior
opt.incsearch = true -- pero sí ir mostrando resultados mientras escribes

-- Apariencia (parte de la "estética" que pediste)
opt.termguicolors = true -- colores de 24 bits, necesario para que el colorscheme se vea bien
opt.signcolumn = "yes" -- columna fija para signos de git/LSP (evita que el texto "salte" al aparecer)
opt.cursorline = true -- resalta sutilmente la línea donde está el cursor
opt.pumheight = 10 -- máximo de items visibles en el menú de autocompletado

-- Splits: que se abran donde uno espera (a la derecha/abajo)
opt.splitright = true
opt.splitbelow = true

-- Archivos
opt.undofile = true -- historial de undo persistente entre sesiones (cierras nvim y el undo sigue ahí)
opt.swapfile = false -- nadie extraña los .swp
opt.updatetime = 250 -- más rápido para que git-signs, LSP, etc reaccionen (default 4000ms es lento)

-- Portapapeles del sistema: yank/paste comparte con el clipboard normal (útil en Wayland/Hyprland)
opt.clipboard = "unnamedplus"

-- Que las líneas largas no se corten a mitad de palabra
opt.wrap = false

-- Con qué caracteres se ve un tab, espacio final, etc. Da un toque minimalista
-- similar a "mostrar invisibles" sin ser ruidoso
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- Leader key: la tecla "prefijo" para tus atajos personalizados.
-- Se define ANTES de cargar cualquier plugin, si no algunos atajos no funcionan.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
