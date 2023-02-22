local inventory = { }

inventory.get_item_by_slot = function(slot)

    local item = AshitaCore:GetDataManager():GetInventory():GetEquippedItem(slot)
    return item ~= nil and inventory.get_item_by_index(item.ItemIndex) or nil

end

inventory.get_item_by_index = function(index)

    local item = nil
    local thresholds = {2048, 2560, 2816, 3072, 3328}
    local locations = {0, 8, 10, 11, 12}

    for n,p in pairs(thresholds) do   
        if index > 0 and index < p then 
            item = AshitaCore:GetDataManager():GetInventory():GetItem(locations[n], index - (n > 1 and thresholds[n - 1] or 0)); break
        end
    end

    return item

end

return inventory