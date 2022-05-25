local common   = require('common')
local filepath = _addon.path .. 'config\\' .. string.lower(_addon.name) .. '.json'
local config   = ashita.settings.load_merged(filepath, {})

config.save = function()   

	local data = {}
	
	for k,v in pairs(config) do
		if k ~= 'save' then
			data[k] = v
		end
	end
	
    ashita.settings.save(filepath, data)
	
end

return config
