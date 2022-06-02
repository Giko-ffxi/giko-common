local common  = require('lib.giko.common')
local monster = {}

monster.notorious = 
{
    { names = {nq = {"Adamantoise", "Ada"}, hq = {"Aspidochelone", "Aspi"}}, sets = {"Kings"}, windows = {"21h", "30m", "30m", "30m", "30m", "30m", "30m"}},
    { names = {nq = {"Behemoth", "Behe"}, hq = {"King Behemoth", "Kb"}}, sets = {"Kings"}, windows = {"21h", "30m", "30m", "30m", "30m", "30m", "30m"}},
    { names = {nq = {"Fafnir", "Faf"}, hq = {"Nidhogg", "Nid"}}, sets = {"Kings"}, windows = {"21h", "30m", "30m", "30m", "30m", "30m", "30m"}},
    { names = {nq = {"King Arthro", "KA", "Arthro"}}, sets = {"Kings"}, windows = {"21h5m", "30m", "30m", "30m", "30m", "30m", "30m"}},
    { names = {nq = {"Cerberus", "Cerb"}}, sets = {"ToAU"}, windows = {"48h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h"}},
    { names = {nq = {"Hydra"}}, sets = {"ToAU"}, windows = {"48h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h"}},
    { names = {nq = {"Khimaira", "Khim"}}, sets = {"ToAU"}, windows = {"48h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h"}},
    { names = {nq = {"Jormungand", "Jorm"}}, sets = {"CoP"}, windows = {"72h", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m"}},
    { names = {nq = {"Tiamat", "Tia"}}, sets = {"CoP"}, windows = {"72h", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m"}},
    { names = {nq = {"Vrtra"}}, sets = {"CoP"}, windows = {"72h", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m"}}

}

monster.get = function(key)

    for k,mob in ipairs(monster.notorious) do
        for k,v in ipairs(common.flatten(mob.names)) do  
            if string.gsub(string.lower(key), '%s', '-') == string.gsub(string.lower(v), '%s', '-') then   
                return mob
            end
        end
    end

end

return monster
