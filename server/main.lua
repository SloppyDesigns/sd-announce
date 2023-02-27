
if Config.Framework == 'QBCore' then
    QBCore = exports['qb-core']:GetCoreObject()

    QBCore.Commands.Add('announce', 'Send Server Announcement', {{  name = 'message', help = 'Announcement Message' }}, true, function(source, args)
        if source > 0 then
            local message
            if args[1] then message = table.concat(args, " ") end
            Config.Announcement(message)
            if Config.Webhook ~= '' then
                exports['sd-announce']:CreateLog(Config.Webhook, 'Server Announcement', "**" .. message .. "**", 12010050)
            end
        end
    end, 'admin')
end

if Config.Framework == 'ESX' then
    ESX.RegisterCommand('announce', 'admin', function(xPlayer, args, showError)
        if xPlayer.source > 0 then
            local message
            if args[1] then message = table.concat(args.message, " ") end
            Config.Announcement(message)
            if Config.Webhook ~= '' then
                exports['sd-announce']:CreateLog(Config.Webhook, 'Server Announcement', "**" .. message .. "**", 12010050)
            end
        end
    end, false, { help = 'Send Server Announcement', arguments = { { name = 'message', help = 'Announcement Message', type = 'string' } }})
end

if Config.TxAdmin['ScheduledRestart'] then
    AddEventHandler('txAdmin:events:scheduledRestart', function(data)
        if GetInvokingResource() ~= "monitor" or type(data) ~= "table" then return end
        Config.Announcement(data.translatedMessage)
    end)
end

if Config.TxAdmin['PlayerKicked'] then
    AddEventHandler('txAdmin:events:playerKicked', function(data)
        if GetInvokingResource() ~= "monitor" or type(data) ~= "table" then return end
        Config.Announcement(('%s Has Been Kicked By %s <br> Reason: %s'):format(GetPlayerName(data.target), data.author, data.reason))
        if Config.Webhook ~= '' then
            exports['sd-announce']:CreateLog(Config.Webhook, 'Player Kicked', "Player: **" .. GetPlayerName(data.target) .. "** \nAutor: **" .. data.author .. "** \nReason: **" .. data.reason .. "**", 16769280)
        end
    end)
end

if Config.TxAdmin['PlayerWarned'] then
    AddEventHandler('txAdmin:events:playerWarned', function(data)
        if GetInvokingResource() ~= "monitor" or type(data) ~= "table" then return end
        Config.Announcement(('%s Has Been Warned By %s <br> Reason: %s'):format(GetPlayerName(data.target), data.author, data.reason))
        if Config.Webhook ~= '' then
            exports['sd-announce']:CreateLog(Config.Webhook, 'Player Warned', "Player: **" .. GetPlayerName(data.target) .. "** \nAutor: **" .. data.author .. "** \nReason: **" .. data.reason .. "**", 16772608)
        end
    end)
end

if Config.TxAdmin['PlayerBanned'] then
    AddEventHandler('txAdmin:events:playerBanned', function(data)
        if GetInvokingResource() ~= "monitor" or type(data) ~= "table" then return end
        Config.Announcement(('%s Has Been Banned By %s <br> Reason: %s'):format(GetPlayerName(data.targetNetId), data.author, data.reason))
        if Config.Webhook ~= '' then
            exports['sd-announce']:CreateLog(Config.Webhook, 'Player Banned', "Player: **" .. GetPlayerName(data.targetNetId) .. "** \nAutor: **" .. data.author .. "** \nReason: **" .. data.reason .. "**", 16722688)
        end
    end)
end

if Config.TxAdmin['Healed'] then
    AddEventHandler('txAdmin:events:healedPlayer', function(data)
        if GetInvokingResource() ~= "monitor" or type(data) ~= "table" then return end
        Config.Notification(data.id, '', 'You Where Healed By An Admin', 8000, 'success')
        if Config.Webhook ~= '' then
            if data.id == -1 then
                exports['sd-announce']:CreateLog(Config.Webhook, 'Players Healed', "**All Players Healed**", 12010050)
            else
                exports['sd-announce']:CreateLog(Config.Webhook, 'Players Healed', "**Player " .. GetPlayerName(data.id) .. " Was Healed**", 12010050)
            end
        end
    end)
end

if Config.TxAdmin['Announcement'] then
    AddEventHandler('txAdmin:events:announcement', function(data)
        if GetInvokingResource() ~= "monitor" or type(data) ~= "table" then return end
        Config.Announcement(data.message)
        if Config.Webhook ~= '' then
            exports['sd-announce']:CreateLog(Config.Webhook, 'Server Announcement', "**" .. data.message .. "**", 12010050)
        end
    end)
end

if Config.TxAdmin['DirectMessage'] then
    AddEventHandler('txAdmin:events:playerDirectMessage', function(data)
        if GetInvokingResource() ~= "monitor" or type(data) ~= "table" then return end
        Config.Notification(data.target, data.author, data.message, 8000, 'info')
    end)
end