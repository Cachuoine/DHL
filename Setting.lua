local FishHub = getgenv().FishHub
if not FishHub then
    return
end
FishHub.ClearContent()
local page = FishHub.pageContainer
local UIS = game:GetService("UserInputService")
textbox.Focused:Connect(function()
    local conn
    conn = UIS.InputBegan:Connect(function(input,gp)
        if gp then return end
        if input.UserInputType==Enum.UserInputType.Keyboard then
            FishHub.HotkeyConfig.Key=input.KeyCode
            textbox.Text=input.KeyCode.Name
            textbox:ReleaseFocus()
            conn:Disconnect()
        end
    end)
end)
HotkeyConfig.Key
