-- ~/.config/nvim/init.lua
--
-- Este es el primer archivo que Neovim carga. Su único trabajo es
-- ir a buscar el resto de la configuración en orden. Así evitamos
-- tener un archivo gigante de 500 líneas y en cambio separamos
-- todo por temas (opciones, atajos, plugins).
--
-- require("core.options") busca el archivo lua/core/options.lua
-- (el punto sustituye a la barra "/", es la sintaxis de Lua para
-- ese "path" de módulos)

require("core.options") -- opciones generales de vim (numeros, tabs, etc)
require("core.keymaps") -- atajos de teclado que no dependen de ningún plugin
require("core.lazy") -- descarga/instala lazy.nvim y carga todos los plugins
