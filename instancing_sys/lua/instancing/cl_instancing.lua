concommand.Add("instance", function()

    local f = vgui.Create("DFrame")
    f:SetSize(200, 100)
    f:Center()
    f:MakePopup()

    local n = vgui.Create("DTextEntry", f)
    n:Dock(TOP)
    n:SetTall(50)
    n:SetFont("CloseCaption_Normal")
    n:SetNumeric(true)
    n:SetText(LocalPlayer():GetNWInt("Instance", 1))

    local b = vgui.Create("DButton", f)
    b:Dock(FILL)
    b:SetText("Change")
    b.DoClick = function()
        f:Remove()
        net.Start("Yolo.Instancing")
        net.WriteInt(n:GetInt() or 1, 4)
        net.SendToServer()
    end

end)