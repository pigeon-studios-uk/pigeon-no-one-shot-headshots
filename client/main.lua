--[[
    Pigeon No One-Shot Headshots: client.

    GTA multiplies the damage of a shot to the head, so most guns kill in one headshot. That
    "critical hit" multiplier is a per-character setting: SetPedSuffersCriticalHits(ped, false) makes a
    headshot do the same damage as a shot to the body.

    It's set on each player's own character, the one their game controls. Every player runs the
    resource, so no player can be killed by one headshot. Other resources can turn headshots back on for
    one player with the SetHeadshots export.
]]

local RESOURCE = GetCurrentResourceName()

local critical = Config.CriticalHeadshots == true       -- what's set on the player's character

local function apply()
    SetPedSuffersCriticalHits(PlayerPedId(), critical)
end

CreateThread(function()
    while true do
        apply()
        Wait(math.floor((Config.ReapplySeconds or 1.0) * 1000))
    end
end)

-- A new character after respawning: apply straight away rather than waiting for the next pass.
AddEventHandler('playerSpawned', apply)

-- Give headshots back their extra damage when the resource stops.
AddEventHandler('onResourceStop', function(resource)
    if resource == RESOURCE then SetPedSuffersCriticalHits(PlayerPedId(), true) end
end)

--- true: this player takes GTA's full headshot damage again, such as inside a hardcore zone.
--- false: back to no one-shot headshots. nil: back to Config.CriticalHeadshots.
exports('SetHeadshots', function(enabled)
    if enabled == nil then critical = Config.CriticalHeadshots == true else critical = enabled == true end
    apply()
end)

--- true if this player currently takes GTA's full headshot damage.
exports('HasHeadshots', function()
    return critical
end)
