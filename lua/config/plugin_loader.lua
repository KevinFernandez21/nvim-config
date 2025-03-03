local M = {}

function M.get_plugin_files()
    local plugin_files = {}
    local base_path = vim.fn.stdpath("config") .. "/lua/plugins/"

    -- Agregar la carpeta base "plugins" primero (para mantener el comportamiento anterior)
    table.insert(plugin_files, { import = "plugins" })

    -- Buscar archivos .lua en `plugins/` y sus subdirectorios
    for _, file in ipairs(vim.fn.glob(base_path .. "**/*.lua", false, true)) do
        -- Convertir la ruta en un módulo Lua válido
        local relative_path = file:sub(#base_path + 1, -5) -- Remueve el prefijo del path y `.lua`
        local module_name = "plugins." .. relative_path:gsub("[/\\]", "."):gsub("%.init$", "")

        -- Evitar insertar duplicados si ya está en `import = "plugins"`
        if module_name ~= "plugins" then
            table.insert(plugin_files, { import = module_name })
        end
    end

    return plugin_files
end

return M

