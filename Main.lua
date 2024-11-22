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
