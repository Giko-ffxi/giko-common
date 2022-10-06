local config  = require('lib.giko.config')
local common  = require('lib.giko.common')
local monster = require('lib.giko.monster')
local cache   = require('lib.giko.cache')
local json    = require('json.json')
local death   = { memory = {}, cache = string.format('%s\\..\\giko-cache\\cache\\giko.tod.csv', _addon.path) }

death.get_tod = function(name)

    local mob = monster.get(name)
    local tod = mob ~= nil and common.in_array_key(death.memory, name) and death.memory[name] or cache.get(death.cache, mob.names.nq[1])

    if mob ~= nil then

        death.memory[mob.names.nq[1]] = tod ~= nil and tod or json:encode(nil)

        if tod ~= nil then
            return tod ~= nil and json:decode(tod) or nil
        end

    end
    
end

death.get_day = function(name)

    local win = death.get_window(name)
    local mob = monster.get(name)

    if win ~= nil and mob.names.hq and #mob.names.hq then
        return win.day
    end

end

death.set_tod = function(name, gmt, day)

    local tod = {}
    local pre = death.get_tod(name)
    local mob = monster.get(name)
    local day = day or (pre and mob.names.hq and not common.in_array(mob.names.hq, name) and pre.day + 1 or 0)

    if mob ~= nil then

        death.memory[mob.names.nq[1]] = json:encode({name = mob.names.nq[1], gmt = gmt, day = day, created_at = os.time()})
        cache.set(death.cache, mob.names.nq[1], death.memory[mob.names.nq[1]])

    end

end

death.set_day = function(name, day)

    local tod = death.get_tod(name);
    local mob = monster.get(name)

    if mob ~= nil and tod ~= nil then

        death.memory[mob.names.nq[1]] = json:encode({name = tod.name, gmt = tod.gmt, day = day, created_at = os.time()})
        cache.set(death.cache, mob.names.nq[1], death.memory[mob.names.nq[1]])
        
    end

end

death.get_window = function(name, offset)

    local tod    = death.get_tod(name)
    local offset = offset or 1

    if tod ~= nil then
    
        local time = common.gmt_to_local_time(tod.gmt);
        local mob  = monster.get(name)

        if mob ~= nil then
            for n, delay in pairs(mob.windows.at) do
                time = time + common.to_seconds(delay)
                if os.difftime(time, os.time()) > (0 - common.to_seconds(mob.windows.length)) then
                    return {name = mob.names.nq[1], time = os.date('%Y-%m-%d %H:%M:%S', time - offset), day = mob.names.hq and #mob.names.hq and tod.day + 1 or nil, count = n, countdown = os.difftime(time - offset, os.time())}
                end
            end
        end
    end

end

return death