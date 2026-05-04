-- ============================================================
-- Example mod for Quest for the Chalice
-- Place this file at: lua542Linux/mod.lua
--
-- This script runs once at game startup (before the title
-- screen). Use it to log info or adjust game behavior.
--
-- Available API functions registered by the C host:
--   get_room_count() -> number   (returns 10)
--
-- Extended mod support can be added by registering more
-- functions in lua_load_mod() inside quest_for_chalice.c
-- ============================================================

local count = get_room_count()
print(string.format("[MOD] Quest for the Chalice loaded. Rooms: %d", count))

-- Example: you could print a custom message at startup
print("[MOD] Good luck finding the chalice!")

-- Tracks previous state so we only print on change
local last_room = -1
local was_jumped = false

function tick()
    local room    = get_current_room()
    local jumped  = get_player_jumped()

    -- Print when room changes
    if room ~= last_room then
        print(string.format("[MOD] Entered room %d", room))
        last_room = room
    end

    -- Print when player leaves the ground
    if jumped and not was_jumped then
        print(string.format("[MOD] Player jumped! (room %d)", room))
    end

    was_jumped = jumped
end
