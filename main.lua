local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/lime"))()
local w = Library:Window("Mega Hub")

local deletedDoors = {}

w:Toggle("Delete Doors", function(v)
    if v then
        for _, doors in pairs(workspace:GetChildren()) do
            if doors:IsA("Folder") and doors.Name == "Doors" then
                table.insert(deletedDoors, doors)
                doors.Parent = nil
            end
        end
    else
        for _, doors in pairs(deletedDoors) do
            if doors and not workspace:FindFirstChild(doors.Name) then
                doors.Parent = workspace
            end
        end
    end
end)

w:Button("Get AK47", function()
local ak47 = workspace:WaitForChild("Prison_ITEMS"):WaitForChild("giver"):WaitForChild("AK-47"):WaitForChild("ITEMPICKUP")

local player = game.Players.LocalPlayer
local originalPosition = player.Character.HumanoidRootPart.Position
local ak47Position = ak47.Position

player.Character:SetPrimaryPartCFrame(CFrame.new(ak47Position))
wait(1)

workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(ak47)
wait(1)

local offset = Vector3.new(0, 5, 0)
player.Character:SetPrimaryPartCFrame(CFrame.new(originalPosition + offset))

end)
