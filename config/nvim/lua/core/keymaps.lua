-- lua/core/keymaps.lua
-- vim.keymap.set(modo, tecla, acción, opciones)
-- modo: "n" normal, "i" insert, "v" visual, "x" visual block, etc.
-- Con leader = espacio (definido en options.lua), "<leader>w" = "Espacio + w"

local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar archivo" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Cerrar ventana" })

-- Moverse entre ventanas (splits) con Ctrl + hjkl en vez de Ctrl+w+h
map("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana de la izquierda" })
map("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana de abajo" })
map("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana de arriba" })
map("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana de la derecha" })

-- Mover líneas seleccionadas hacia arriba/abajo en modo visual
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover selección hacia abajo" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover selección hacia arriba" })

-- Mantener el cursor centrado al buscar o hacer scroll de media página
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Quitar el resaltado de búsqueda con Escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Pegar sin perder lo que tenías copiado antes (el clásico "pegué y perdí mi yank")
map("x", "<leader>p", '"_dP', { desc = "Pegar sin sobrescribir el registro" })

-- Copiar/eliminar sin afectar el registro por defecto (útil junto al de arriba)
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copiar al portapapeles del sistema" })
map("n", "<leader>Y", '"+Y', { desc = "Copiar línea al portapapeles del sistema" })

-- Navegación entre buffers (archivos abiertos)
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Buffer anterior" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Buffer siguiente" })

map("n", "<leader>m", ":make<CR>", { desc = "Compilar (make)" })
map("n", "]q", ":cnext<CR>", { desc = "Siguiente error" })
map("n", "[q", ":cprev<CR>", { desc = "Error anterior" })
