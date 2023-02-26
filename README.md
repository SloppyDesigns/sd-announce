# sd-announce
Simple Resource to add announce System to your Server with Discord Logging

## Command
/announce for Admins only

## Protection
All events are protected and cannot be called directly.

## Notify
The Resource is setup to use sd-notify but configurable in the config

Add the following Notify to sd-notify/config.lua in Config.Notifcations if you would like to use the same message
```lua
['announce'] = {
    icon = 'fa-solid fa-bullhorn',
    color = '#f1c40f',
    type = 'warning',
}
```

## Global
All Messages get send globally including TxAdmin messages.

## Discord
Discord Webhook to have the messages send to discord

## TxAdmin Disable Defaults
To Disable TxAdmin Default Messages add the following to your server.cfg file

```
set txAdmin-hideDefaultAnnouncement "true"
set txAdmin-hideDefaultDirectMessage "true"
set txAdmin-hideDefaultWarning "true"
set txAdmin-hideDefaultScheduledRestartWarning "true"
```
