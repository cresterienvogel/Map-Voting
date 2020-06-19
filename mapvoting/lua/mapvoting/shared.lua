MapVoting = MapVoting or {}
MapVoting.Maps = MapVoting.Maps or {}
MapVoting.Timer = 25

local maps = file.Find("maps/*", "GAME")
for _, map in pairs(maps) do
    if string.find(map, "ttt") and string.find(map, ".bsp") then
        MapVoting.Maps[string.StripExtension(map)] = 0
    end
end