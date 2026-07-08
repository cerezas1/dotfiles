## Instalación

1. Respalda tu config actual por si acaso:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```
2. Copia esta carpeta a `~/.config/nvim`.
3. Abre `nvim`. La primera vez vas a ver un montón de texto pasar rápido:
   es `lazy.nvim` clonándose a sí mismo y después instalando cada plugin
   listado en `lua/plugins/`. Espera a que termine (unos segundos) y
   reinicia nvim una vez.
4. Corre `:checkhealth` para confirmar que no falta nada (por ejemplo,
   si no tienes `git`, `ripgrep` o un compilador de C, algunas cosas
   fallan — el mensaje de error te dice exactamente qué falta).

### Dependencias del sistema (fuera de nvim)
- `git` (para que lazy.nvim clone los plugins)
- `ripgrep` (`rg`) — lo usa Telescope para `live_grep`
- Un compilador de C (`gcc`/`clang`) — lo necesita treesitter para compilar los parsers
- Una Nerd Font instalada 
## Estructura
nvim/
├── init.lua                  -- solo hace 3 "require", el punto de entrada
├── lua/
│   ├── core/
│   │   ├── options.lua       -- opciones generales (numbers, tabs, etc)
│   │   ├── keymaps.lua       -- atajos que no dependen de plugins
│   │   └── lazy.lua          -- instala lazy.nvim y carga lua/plugins/
│   └── plugins/
│       ├── colorscheme.lua   -- catppuccin mocha, con overrides a tu paleta
│       ├── treesitter.lua    -- resaltado de sintaxis real
│       ├── telescope.lua     -- buscador difuso (archivos, texto, etc)
│       ├── lsp.lua           -- mason + lspconfig (autocompletado inteligente, ir a definición...)
│       ├── cmp.lua           -- el popup de autocompletado en sí
│       ├── mini.lua          -- statusline, autopairs, indent guide (mini.nvim)
│       ├── gitsigns.lua      -- signos de git en el margen
│       ├── which-key.lua     -- popup que recuerda tus atajos
│       └── oil.lua           -- explorador de archivos minimalista

Cada archivo dentro de `lua/plugins/` es un plugin independiente. Para
agregar uno nuevo en el futuro: creas un archivo `lua/plugins/lo-que-sea.lua`
que devuelva una tabla `{ "usuario/repo", opts = {...} }` y listo, lazy.nvim
lo detecta solo la próxima vez que abras nvim.

## Atajos principales
| Atajo | Acción |
|---|---|
| `<leader>` = espacio | tecla líder de todos tus atajos |
| `<leader>ff` | buscar archivo |
| `<leader>fg` | buscar texto en el proyecto |
| `<leader>fb` | buscar entre buffers abiertos |
| `-` | abrir explorador de archivos (Oil) en el directorio actual |
| `gd` | ir a la definición (con LSP activo) |
| `K` | ver documentación del símbolo bajo el cursor |
| `<leader>rn` | renombrar símbolo |
| `<leader>ca` | acciones de código |
| `gcc` | comentar/descomentar línea (nativo de Neovim 0.10+, sin plugin extra) |
| `<leader>w` / `<leader>q` | guardar / cerrar ventana |

Presiona espacio y espera un segundo en cualquier momento: which-key
te va a mostrar qué puedes hacer después.
## Cómo agregar soporte para otro lenguaje
1. Abre `lua/plugins/lsp.lua` y agrega el nombre del servidor a
   `ensure_installed` (ej: `"pyright"` para Python). La lista completa
   de nombres está en `:Mason` o en el repo de mason-lspconfig.
2. Si el servidor necesita configuración especial, agrega un bloque
   `lspconfig.NOMBRE.setup({...})` igual al de `lua_ls`.
3. Opcional: agrega el parser de ese lenguaje a `ensure_installed` en
   `lua/plugins/treesitter.lua` para mejor resaltado de sintaxis.
## Paleta usada (por si quieres ajustar algo)
- `base` (#1e1e2e) y `mauve` (#cba6f7) — ya nativos de Catppuccin Mocha, calzan con tu waybar/workspaces
- `pink` (#f5c2e7) — nativo de Mocha, calza con tu `accent-line` de rofi
- `crust` sobreescrito a `#110f18` — el `bg-opaque` de tu `purp.rasi`

Si más adelante cambias algo de tu rice, el único archivo que tendrías
que tocar acá es `lua/plugins/colorscheme.lua` (bloque `color_overrides`).
