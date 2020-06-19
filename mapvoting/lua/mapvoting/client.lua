net.Receive("Send Voting", function()
    local maps, time = net.ReadTable(), 25

    local fr = vgui.Create("XPFrame")
    fr:SetTitle("Map Voting")
    fr:SetSize(300, 300)
    fr:Center()

    local scroll = vgui.Create("XPScrollPanel", fr)
    scroll:Dock(FILL)
    scroll:DockMargin(2, 2, 2, 2)

    for map, _ in pairs(maps) do
        local btn = vgui.Create("XPButton", scroll)
        btn:Dock(TOP)
        btn:SetText(map)
        btn:SetTooltip("Choose " .. map)

        btn.DoClick = function()
            net.Start("Send Voting Choice")
                net.WriteString(map)
            net.SendToServer()
            fr:Remove()
        end
    end
end)