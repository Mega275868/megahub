local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/lime"))()
local w = Library:Window("Mega Hub")

local doorsBackup

w:Toggle("Delete Doors", function(v)
    if v and workspace:FindFirstChild("Doors") then
        doorsBackup = workspace.Doors:Clone()
        workspace.Doors:Destroy()
    elseif doorsBackup then
        doorsBackup.Parent = workspace
        doorsBackup = nil
    end
end)
