local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local isFetching = false

function NPCAndBlip()
    for k, v in pairs(Config.blips) do
        local blip = AddBlipForCoord(v.coords[1], v.coords[2], v.coords[3])

        SetBlipSprite(blip, v.Sprite)
        SetBlipDisplay(blip, v.Display)
        SetBlipScale(blip, v.Scale)
        SetBlipColour(blip, v.Colour)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(_U('blip_name'))
        EndTextCommandSetBlipName(blip)
    end
end

NPCAndBlip()


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        if (not isFetching) then
            for k, v in pairs(Config.blips) do
                local coords = GetEntityCoords(GetPlayerPed(-1))
                if (GetDistanceBetweenCoords(coords[1], coords[2], coords[3], v.coords[1], v.coords[2], v.coords[3], true) < v.distance) then
                    ESX.ShowHelpNotification(_U('press_to_fetch'))
                    if (IsControlPressed(0, 38) and not isFetching) then
                        isFetching = true
                        exports['mythic_progbar']:Progress({
                            name = "fetch_water:progress",
                            duration = Config.time * 1000,
                            label = _U('fetching'),
                            useWhileDead = true,
                            canCancel = false,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                        })
                        Wait(Config.time * 1000)
                        TriggerServerEvent('fetch_water:tryFetch')
                        isFetching = false
                    end
                end
            end
        end
    end
end)

