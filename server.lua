ESX	= nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fetch_water:tryFetch')
AddEventHandler('fetch_water:tryFetch', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local sourceItem = xPlayer.getInventoryItem(Config.itemName)

    if Config.ESXVersion == '1.2' then
        if xPlayer.canCarryItem(Config.itemName, Config.itemCount) then
            xPlayer.addInventoryItem(Config.itemName, Config.itemCount)
            TriggerClientEvent('esx:showNotification', source, _U('you_got', sourceItem.label, Config.itemCount))
        else
            TriggerClientEvent('esx:showNotification', source, _U('not_enough_space'))
        end
    elseif Config.ESXVersion == '1.1' then
        if sourceItem.weight ~= -1 and (sourceItem.count + Config.itemCount) > sourceItem.weight then
            TriggerClientEvent('esx:showNotification', source, _U('not_enough_space'))
        else
            xPlayer.addInventoryItem(Config.itemName, Config.itemCount)
            TriggerClientEvent('esx:showNotification', source, _U('you_got', sourceItem.label, Config.itemCount))
        end
    end
    
end)

