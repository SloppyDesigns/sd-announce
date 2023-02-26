Config = {}

if GetResourceState('es_extended') == 'started' then
    Config.Framework = "ESX"
elseif GetResourceState('qb-core') == 'started' then
    Config.Framework = "QBCore"
end

-- Announcement Trigger
Config.Announcement = function(message)
    TriggerClientEvent('sd-notify:Notify', -1, 'Server Announcement', message, 8000, 'announce', 'top-center', true)
end

-- Notification Trigger
Config.Notification = function(source, title, message, length, type)
    TriggerClientEvent('sd-notify:Notify', source, title, message, length, type, 'top-center')
end

-- TxAdmin
Config.Webhook = ''
Config.TxAdmin = {
    ['ScheduledRestart'] = true,
    ['PlayerKicked'] = true,
    ['PlayerWarned'] = true,
    ['PlayerBanned'] = true,
    ['DirectMessage'] = true,
    ['Healed'] = true,
    ['Announcement'] = true,
}