-- This is a script for my game

print("The Game is Starting...")

-- Now, we will create a variable to keep track of our score

_G.score = 0

-- This code will help us add 1 point to our score each second

while true do
	wait(1) -- wait 1 sesond before adding a point
	score = score + 1 -- add 1 point to our score
	print(score)
end
