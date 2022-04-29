
local common = require('lib.giko.common')
local cache  = {}

cache.get = function(path, key)

    local reader = io.open(path, 'r') or io.open(path, 'w+')
    local value  = nil

    if reader ~= nil then
            
        for line in reader:lines() do        
            if (string.lower(string.gsub(line, '|.*', '')) == string.lower(key)) then
                value = (string.gsub(line, '.*|', ''))
                break
            end
        end      
                
        reader:close()

    end

    return value

end

cache.get_all = function(path)

    local reader = io.open(path, 'r')
    local values = {}
 
    if reader ~= nil then

        for line in reader:lines() do
            values[(string.gsub(line, '|.*', ''))] = (string.gsub(line, '.*|', ''))
        end      
                
        reader:close()

    end

    return values

end

cache.set = function(path, arg1, arg2)

    local set = false

    if type(arg1) == 'string' and type(arg2) == 'string' then
        set = cache.set_multiple(path, {[arg1] = arg2}) 
    end

    if type(arg1) == 'table' and arg2 == nil then 
        set = cache.set_multiple(path, arg1) 
    end

    return set

end

cache.set_multiple = function(path, tbl)

    local values = cache.get_all(path)
    local setter = function(v,k) return string.format('%s|%s', k, v) end
    local writer = nil

    for k,v in pairs(tbl) do
        values[string.lower(k)] = v
    end
    
    writer = io.open(path, 'w')
    writer:write(table.concat(common.map(values, setter), '\n'))
    writer:flush()
    writer:close()

    return true

end

cache.remove = function(path, arg1)

    local rm = false

    if type(arg1) == 'string' then 
        rm = cache.remove_multiple(path, {arg1}) 
    end

    if type(arg1) == 'table' then 
        rm = cache.remove_multiple(path, arg1) 
    end

    return rm

end

cache.remove_multiple = function(path, keys)

    local values = cache.get_all(path)
    local setter = function(v,k) return string.format('%s|%s', string.lower(k), v) end
    local writer = nil

    for n,k in pairs(keys) do
        values[string.lower(k)] = nil
    end
    
    writer = io.open(path, 'w')
    writer:write(table.concat(common.map(values, setter), '\n'))
    writer:flush()
    writer:close()

    return true

end

return cache