local packer = {}

packer.get_action = function(packet)

    local act = {targets = {}, type = ashita.bits.unpack_be(packet, 82, 4)} 
    local nt  = struct.unpack('b', packet, 0x09 + 1)
    local of  = 150

    for i = 1, nt do

        act.targets[i]         = {}
        act.targets[i].id      = ashita.bits.unpack_be(packet, of, 32)
        act.targets[i].ncounts = ashita.bits.unpack_be(packet, of + 32, 4)
        act.targets[i].actions = {}
        of = of + 36
        
        for j = 1, act.targets[i].ncounts do

            act.targets[i].actions[j] = {}
            act.targets[i].actions[j].reaction = ashita.bits.unpack_be(packet, of + 0, 5)
            act.targets[i].actions[j].animation = ashita.bits.unpack_be(packet, of + 5, 11)
            act.targets[i].actions[j].sfx = ashita.bits.unpack_be(packet, of + 16, 5)
            act.targets[i].actions[j].stagger = ashita.bits.unpack_be(packet, of + 21, 6)
            act.targets[i].actions[j].parameter = ashita.bits.unpack_be(packet, of + 27, 17)
            act.targets[i].actions[j].message = ashita.bits.unpack_be(packet, of + 44, 10)
            act.targets[i].actions[j].unknown = ashita.bits.unpack_be(packet, of + 54, 31)
            act.targets[i].actions[j].extra_effect = ashita.bits.unpack_be(packet, of + 85, 1)
            of = of + 86
            
            if (act.targets[i].actions[j].extra_effect == 1) then

                act.targets[i].actions[j].extra_effect_animation = ashita.bits.unpack_be(packet, of + 0, 6)
                act.targets[i].actions[j].extra_effect_effect = ashita.bits.unpack_be(packet, of + 6, 4)
                act.targets[i].actions[j].extra_effect_parameter = ashita.bits.unpack_be(packet, of + 10, 17)
                act.targets[i].actions[j].extra_effect_messsage = ashita.bits.unpack_be(packet, of + 27, 10)
                of = of + 37         

            end

            act.targets[i].actions[j].spike_effect = ashita.bits.unpack_be(packet, of, 1)
            of = of + 1

            if (act.targets[i].actions[j].spike_effect == 1) then

                act.targets[i].actions[j].spike_effect_animation = ashita.bits.unpack_be(packet, of + 0, 6)
                act.targets[i].actions[j].spike_effect_effect = ashita.bits.unpack_be(packet, of + 6, 4)
                act.targets[i].actions[j].spike_effect_parameter = ashita.bits.unpack_be(packet, of + 10, 14)
                act.targets[i].actions[j].spike_effect_message = ashita.bits.unpack_be(packet, of + 24, 10)
                of = of + 34

            end
            
        end

    end

    return act

end

return packer