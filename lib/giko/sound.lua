local config  = require('lib.giko.config')
local common  = require('lib.giko.common')
local monster = require('lib.giko.monster')
local cache   = require('lib.giko.cache')
local json    = require('json.json')
local sound   = { storage = string.format('%s..\\giko-common\\sounds\\', _addon.path) }

sound.call = function(id, volume, library)

    local file = string.format('%s\\%s\\%02d\\%s.%02d.%02d.wav', sound.storage, library or 'giko.call', volume, library or 'giko.call', id, volume)

    if common.file_exists(file) then        
        ashita.timer.create('sound', 1, 1, function() ashita.misc.play_sound(file) end)
    end

end

return sound