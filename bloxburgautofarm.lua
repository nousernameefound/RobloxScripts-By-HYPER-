--Bloxburg Auto Farm ( Hair Dresser )
-- Made by @Hyper.dev,@Unkown.Dev

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer

local function teleportToHairdresser()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ClickDetector") and v.Parent.Name == "Hairdresser" then
            fireclickdetector(v)
            return true
        end
    end
    return false
end

local function doHairdresserWork()
    local job = Workspace:FindFirstChild("HairDresserJob")
    if not job then
        warn("Hairdresser job not found. Are you in the job?")
        return
    end

    local stations = job:FindFirstChild("Stations")
    if not stations then
        warn("Stations not found in job.")
        return
    end

    while true do
        for _, station in ipairs(stations:GetChildren()) do
            local customer = station:FindFirstChild("Customer")
            if customer then
                local prompt = customer:FindFirstChildWhichIsA("ProximityPrompt")
                if prompt then
                    fireproximityprompt(prompt)
                    wait(1.2)
                end
            end
        end
        wait(1)
    end
end

-- Run
if teleportToHairdresser() then
    wait(5)
    doHairdresserWork()
else
    warn("Could not find Hairdresser ClickDetector.")
end
