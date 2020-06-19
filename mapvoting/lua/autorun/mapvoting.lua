AddCSLuaFile("mapvoting/client.lua")
AddCSLuaFile("mapvoting/shared.lua")
include("mapvoting/shared.lua")

if SERVER then
    include("mapvoting/server.lua")
else
    include("mapvoting/client.lua")
end