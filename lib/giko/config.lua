local common   = require('common')
local filepath = _addon.path .. 'config\\' .. string.lower(_addon.name) .. '.json'
local config   = ashita.settings.load_merged(filepath, {})

config.save = function()   
    config.save = nil ashita.settings.save(filepath, config)
end

return config