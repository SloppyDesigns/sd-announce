-- Create Webhook Logs
local function CreateLog(url, title, message, color)
    local data = {
        {
            ['title'] = title,
            ['color'] = color,
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message
        } 
    }
    PerformHttpRequest(url, function() end, 'POST', json.encode({ username = 'Announce', embeds = data}), { ['Content-Type'] = 'application/json' })
end
exports('CreateLog', CreateLog)