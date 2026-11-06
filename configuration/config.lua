Config = {}

-- false: a headshot does the same damage as a shot to the body, so it no longer kills in one shot.
-- true: GTA's normal headshot damage. Leave it false; the SetHeadshots export can change it for one
-- player at a time.
Config.CriticalHeadshots = false

-- How often, in seconds, the setting is applied again. A player's character is replaced when they
-- respawn or change model, and a new character starts with GTA's defaults.
Config.ReapplySeconds = 1.0

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
