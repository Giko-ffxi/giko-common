require('common')
require('ffxi.targets')

local common  = {}

common.size = function(t)

    size = 0

    for k in pairs(t) do size = size + 1 end

    return size

end

common.flatten = function(t)

	local all = {}
	
	for k,v in pairs(t) do

		if type(v) == "table" then					
			for l,vi in pairs(common.flatten(v)) do
				table.insert(all, vi)
			end
		else
			table.insert(all, v)
		end

	end

	return all
    
end

common.in_array = function(array, val)

    for k, v in pairs(array) do        
        if string.lower(v) == string.lower(val) then
            return true
        end
    end

    return false
    
end

common.in_array_key = function(array, key)

    for k, v in pairs(array) do        
        if string.lower(k) == string.lower(key) then
            return true
        end
    end

    return false
    
end

common.extend = function(a, b)

    for k, v in pairs(b) do        
        a[k] = v
    end

    return a

end

common.file_exists = function(path)
    
    local f = io.open(path, "r")    
    return f ~= nil and io.close(f)

end

common.to_seconds = function(time)
    
    local d = string.match(time, '(%-?%d+)d')
    local h = string.match(time, '(%-?%d+)h')
    local m = string.match(time, '(%-?%d+)m')
    local s = string.match(time, '(%-?%d+)s')

    return ((d or 0) * 86400) + ((h or 0) * 3600) + ((m or 0) * 60) + ((s or 0) * 1)

end

common.to_time = function(time)
    
    local d = math.floor(math.abs(time) / 86400)
    local h = math.floor(math.mod(math.abs(time), 86400) / 3600)
    local m = math.floor(math.mod(math.abs(time), 3600) / 60)
    local s = math.floor(math.mod(math.abs(time), 60))

    return string.format("%d:%02d:%02d:%02d", d, h, m, s)

end

common.int_to_hex = function(i, l)
    return string.format(string.format("%%0%dx", l or 8), i)
end

common.hex_to_int = function(h)
    return tonumber(h, 16)
end

common.gmt_to_local_date = function(gmt)

    local Y, m, d, H, M, S = string.match(gmt or '0000-00-00 00:00:00', '^(%d%d%d%d)-(%d%d)-(%d%d) (%d%d):(%d%d):(%d%d)$')                
    local time = os.time({year=Y, month=m, day=d, hour=H, min=M, sec=S}) + common.offset_to_seconds(os.date('%z', os.time())) or 0   

    return time > 0 and os.date('%Y-%m-%d %H:%M:%S %z', time) or common.time_reduce(0) 

end

common.gmt_to_local_time = function(gmt)

    local Y, m, d, H, M, S = string.match(gmt or '0000-00-00 00:00:00', '^(%d%d%d%d)-(%d%d)-(%d%d) (%d%d):(%d%d):(%d%d)$')                
    local time = os.time({year=Y, month=m, day=d, hour=H, min=M, sec=S}) + common.offset_to_seconds(os.date('%z', os.time())) or 0   

    return time > 0 and time or 0

end

common.offset_to_seconds = function(z)

    local signum, hours, minutes = string.match(z, '([+-])(%d%d)(%d%d)')
    
    return (tonumber(signum..hours) * 3600 + tonumber(signum..minutes) * 60)

end

common.shortest = function(array)

    table.sort(array, function(a,b) return #a<#b end)

    return array[1]

end

common.split = function(str, sep)

    local split = {}

    for match in string.gmatch(str, "([^"..sep.."]+)") do
        table.insert(split, match)
    end

    return split

end

common.map = function(tbl, func)
    
    local map = {}

    for k,v in pairs(tbl) do
        table.insert(map, func(v, k))
    end

    return map

end

common.help = function(cmd, help)
    
    print('\31\200[\31\05' .. _addon.name .. '\31\200]\30\01 ' .. '\30\68Invalid format for command:\30\02 ' .. cmd .. '\30\01') 

    for k, v in pairs(help) do
        print('\31\200[\31\05' .. _addon.name .. '\31\200]\30\01 ' .. '\30\68Syntax:\30\02 ' .. v[1] .. '\30\71 ' .. v[2])
    end

end

return common