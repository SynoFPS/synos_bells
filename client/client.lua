for _, v in pairs(Config.Locations) do 
    exports.ox_target:addSphereZone({
        coords = v.coords,
        radius = v.radius,
        debug = false,
        options = {
            {
                icon = 'fa-solid fa-bell',
                label = 'Ring bell',
                onSelect = function()
                    TriggerServerEvent('synos_bells:server:notify', v.label)
                end,
                distance = 2,
            }
        }
    })
end
