_G.AutoPlayEnabled = not _G.AutoPlayEnabled

if not _G.AutoPlayEnabled then
	print("Auto Play Disabled")
	return
end

print("Auto Play Enabled")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local VIPCommandEvent = Remotes:WaitForChild("VIPCommandEvent")

while _G.AutoPlayEnabled do
	-- Select map
	VIPCommandEvent:FireServer("SetMap", "Carnival")

	task.wait(1)

	-- Skip map timer
	VIPCommandEvent:FireServer("SkipTimer", true)

	task.wait(1)

	-- Select Player mode
	VIPCommandEvent:FireServer("SetMode", "Player")

	task.wait(1)

	-- Skip mode timer
	VIPCommandEvent:FireServer("SkipTimer", true)

	task.wait(1)

	-- Select yourself as Piggy
	VIPCommandEvent:FireServer("SetPiggy", LocalPlayer)

	print("Setup completed. Waiting 10 minutes 10 seconds before repeating...")

	-- 10 minutes 10 seconds
	for i = 1, 610 do
		if not _G.AutoPlayEnabled then
			break
		end
		task.wait(1)
	end
end

print("Auto Play Loop Stopped")
