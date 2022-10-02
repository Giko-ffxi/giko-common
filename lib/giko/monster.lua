local common  = require('lib.giko.common')
local monster = {}

monster.notorious = 
{
    { names = {nq = {"Adamantoise", "Ada"}, hq = {"Aspidochelone", "Aspi"}}, sets = {"Kings"}, windows = {at = {"21h", "30m", "30m", "30m", "30m", "30m", "30m"}, length = "10s"}},
    { names = {nq = {"Argus", "Leech King"}}, sets = {"NM"}, windows = {at = {"18h"}, length = "12h"}},
    { names = {nq = {"Behemoth", "Behe"}, hq = {"King Behemoth", "Kb"}}, sets = {"Kings"}, windows = {at = {"21h", "30m", "30m", "30m", "30m", "30m", "30m"}, length = "10s"}},
    { names = {nq = {"Capricious Cassie", "Capricious", "Cassie", "CC"}}, sets = {"NM"}, windows = {at = {"21h"}, length = "3h"}},
    { names = {nq = {"Carmine Dobsonfly", "Carmine", "Dobsonfly"}}, sets = {"NM"}, windows = {at = {"21h"}, length = "3h"}},
    { names = {nq = {"Cerberus", "Cerb"}}, sets = {"ToAU"}, windows = {at = {"48h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h"}, length = "10s"}},
    { names = {nq = {"Devil Manta", "DM"}}, sets = {"NM"}, windows = {at = {"10m"}, length = "10m"}},
    { names = {nq = {"Fafnir", "Faf"}, hq = {"Nidhogg", "Nid"}}, sets = {"Kings"}, windows = {at = {"21h", "30m", "30m", "30m", "30m", "30m", "30m"}, length = "10s"}},
    { names = {nq = {"Hydra"}}, sets = {"ToAU"}, windows = {at = {"48h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h"}, length = "10s"}},
    { names = {nq = {"Jormungand", "Jorm"}}, sets = {"CoP"}, windows = {at = {"72h", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m"}, length = "10s"}},
    { names = {nq = {"King Arthro", "KA", "Arthro"}}, sets = {"Kings"}, windows = {at = {"21h5m", "30m", "30m", "30m", "30m", "30m", "30m"}, length = "10s"}},
    { names = {nq = {"King Vinegarroon", "KV"}}, sets = {"NM"}, windows = {at = {"21h"}, length = "3h"}},
    { names = {nq = {"Khimaira", "Khim"}}, sets = {"ToAU"}, windows = {at = {"48h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h", "1h"}, length = "10s"}},
    { names = {nq = {"Kreutzet"}}, sets = {"NM"}, windows = {at = {"9h"}, length = "3h"}},
    { names = {nq = {"Padfoot"}}, sets = {"NM"}, windows = {at = {"21h"}, length = "3h"}},
    { names = {nq = {"Roc"}}, sets = {"NM"}, windows = {at = {"21h"}, length = "3h"}},
    { names = {nq = {"Serket"}}, sets = {"NM"}, windows = {at = {"21h"}, length = "3h"}},
    { names = {nq = {"Simurgh"}}, sets = {"NM"}, windows = {at = {"21h"}, length = "3h"}},
    { names = {nq = {"Tiamat", "Tia"}}, sets = {"CoP"}, windows = {at = {"72h", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m"}, length = "10s"}},
    { names = {nq = {"Voluptuous Vivian", "Voluptuous", "Vivian", "VV"}}, sets = {"NM"}, windows = {at = {"16h"}, length = "8h"}},
    { names = {nq = {"Vrtra"}}, sets = {"CoP"}, windows = {at = {"72h", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m", "30m"}, length = "10s"}},
    { names = {nq = {"Xolotl"}}, sets = {"NM"}, windows = {at = {"21h"}, length = "3h"}},
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
