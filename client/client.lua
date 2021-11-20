RegisterCommand("animfix", function(source, args, rawCommand)
    local ped = PlayerPedId()
    local isDead = false

    if not IsEntityInAir(ped) then
        if not IsPedRagdoll(ped) then
            if not IsPedInAnyVehicle(ped) then
                ClearPedTasksImmediately(ped)
                ClearPedSecondaryTask(ped)
                SetPedCanPlayGestureAnims(ped, true)
            else
                exports.pNotify:SendNotification({text = 'You can only use this command when outside the vehicle.', timeout = 5500, layout = "bottomCenter"})
            end
        else
            exports.pNotify:SendNotification({text = 'You can only use this command while standing.', timeout = 5500, layout = "bottomCenter"})
        end
    else
        exports.pNotify:SendNotification({text = 'You can only use this command while on the ground.', timeout = 5500, layout = "bottomCenter"})
    end

end, false)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/animfix', 'Use this command if you\'re stuck somehow.')
end)
