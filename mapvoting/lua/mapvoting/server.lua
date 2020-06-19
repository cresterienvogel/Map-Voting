util.AddNetworkString("Send Voting")
util.AddNetworkString("Send Voting Choice")

net.Receive("Send Voting Choice", function(_, pl)
    local choice = net.ReadString()
    if not pl.CanVote or not MapVoting.Maps[choice] then
        return
    end

    pl.CanVote = false
    MapVoting.Maps[choice] = MapVoting.Maps[choice] + 1
end)

function MapVoting.Start()
    for _, pl in pairs(player.GetAll()) do
        pl.CanVote = true
        net.Start("Send Voting")
            net.WriteTable(MapVoting.Maps)
        net.Send(pl)
    end

    timer.Simple(MapVoting.Timer, function()
        RunConsoleCommand("changelevel", table.GetWinningKey(MapVoting.Maps))
    end)
end