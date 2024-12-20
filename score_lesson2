-- Points thresholds for weapons
local KATANA_POINTS = 10
local BOW_POINTS = 20

-- Weapons in ReplicatedStorage
local weaponKatana = game.ReplicatedStorage:FindFirstChild("EpicKatana")
local weaponBow = game.ReplicatedStorage:FindFirstChild("IceBow")

-- Handle player points and weapon granting
local function handlePoints(player, pointsRef)
	while player and player.Parent do
		wait(1) -- Wait for 1 second
		pointsRef.value = pointsRef.value + 1 -- Increase points over time

		print(player.Name .. " has " .. pointsRef.value .. " points.") -- Show points in the output

		-- Check if the player has enough points for the Katana
		if pointsRef.value >= KATANA_THRESHOLD and weaponKatana then
			local backpack = player:FindFirstChild("Backpack")
			if backpack and not backpack:FindFirstChild(weaponKatana.Name) then
				weaponKatana:Clone().Parent = backpack
			end
		end

		-- Check if the player has enough points for the Bow
		if pointsRef.value >= BOW_THRESHOLD and weaponBow then
			local backpack = player:FindFirstChild("Backpack")
			if backpack and not backpack:FindFirstChild(weaponBow.Name) then
				weaponBow:Clone().Parent = backpack
			end
		end
	end
end

-- Reset points when the player dies
local function resetPointsOnDeath(player, humanoid, pointsRef)
	humanoid.Died:Connect(function()
		print(player.Name .. " died. Resetting points.")
		pointsRef.value = 0 -- Reset points
		local backpack = player:FindFirstChild("Backpack")
		if backpack then
			backpack:ClearAllChildren() -- Clear all items from the backpack
		end
	end)
end

-- When a player joins the game
game.Players.PlayerAdded:Connect(function(player)
	-- Shared points reference to track points across respawns
	local pointsRef = { value = 0 } -- Use a table to allow reset across functions

	-- Run the points logic when the player's character is added
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		resetPointsOnDeath(player, humanoid, pointsRef)
		handlePoints(player, pointsRef) -- Start points system when the character spawns
	end)
end)
