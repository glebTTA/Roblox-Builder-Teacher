-- Jump boost
-- Add to a collectable item
script.Parent.Touched:Connect(function(hit)
    local humanoid = hit.Parent:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpPower = humanoid.JumpPower + 20 
        humanoid.JumpPower = true 
        wait(10) -- Boost lasts 10 seconds
        humanoid.JumpPower = humanoid.JumpPower - 20 
        humanoid.JumpPower = false 
        script.Parent:Destroy()
    end
end)

-- Shield Power Up
-- Add to a collectable item
script.Parent.Touched:Connect(function(hit)
    local humanoid = hit.Parent:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Health = humanoid.Health + 50 -- Add temporary health as shield
        wait(10) -- Shield lasts for 10 seconds
        humanoid.Health = humanoid.Health - 50 -- Remove shield effect
        script.Parent:Destroy()
    end
end)

-- Coin system

local coins = 0 -- Initialize points
script.Parent.Touched:Connect(function(hit)
    local humanoid = hit.Parent:FindFirstChild("Humanoid")
    if humanoid then
        coins = coins + 1 -- Increase score by 1
        print("You have collected: " .. points.. "coins") -- Display updated score

        -- Add glow effect
        local glow = Instance.new("PointLight")
        glow.Parent = script.Parent
        glow.Brightness = 2
        
        script.Parent:Destroy() -- Remove coin after collection
    end
end)

-- Explosion Trap

script.Parent.Touched:Connect(function(hit)
    local humanoid = hit.Parent:FindFirstChild("Humanoid")
    if humanoid then
        -- Create an explosion
        local explosion = Instance.new("Explosion")
        explosion.Position = script.Parent.Position
        explosion.BlastRadius = 10 -- Set blast radius
        explosion.BlastPressure = 50000 -- Explosion force
        explosion.Parent = game.Workspace
        
        -- Deal damage to the player
        humanoid:TakeDamage(30) -- Reduce health by 30
        
        script.Parent:Destroy() -- Remove the trap after activation
    end
end)
