-- this script will reset the Global points variable on player death.
game:GetService('Players').PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").Died:Connect(function()
			print(player.Name .. " has died!")
			_G.score = 0
		end)
	end)
end)
