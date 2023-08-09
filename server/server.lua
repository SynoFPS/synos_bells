local QBCore = exports['qb-core']:GetCoreObject()
local bellRinged = false

RegisterNetEvent('synos_bells:server:notify', function(name)
	local src = source

    if bellRinged then 
        TriggerClientEvent('ox_lib:notify', src, { type = 'inform', description = 'Someone is on the way!'})
        return 
    end

    bellRinged = true
    TriggerClientEvent('ox_lib:notify', src, {type = 'success', title = 'You rang the bell', description = 'Someone will be with you shortly'})
    
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then -- if you want a specific job/s adjust to name insted of type
            TriggerClientEvent('ox_lib:notify', v.PlayerData.source, {type = 'inform', description = 'There is someone waiting at: '.. name})
        end
    end
    SetTimeout(Config.Cooldown * 60000, function() -- cooldown in mins
		bellRinged = false
	end)
end)

