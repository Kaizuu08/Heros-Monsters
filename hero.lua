

local Hero = {
  x = love.graphics.getWidth() / 2,
  y = love.graphics.getHeight() / 2,
  facing = "S"
}

function Hero:load()
  --stores the ninja sprite into Hero
  self.image = love.graphics.newImage("ninja_m.png")
  local width = self.image:getWidth() -- stores the width of the image
  local height = self.image:getHeight() -- stores the height of the image

  self.frames = {} -- creates a table for frames

  frame_width = width / 3 -- divides the width of the image into 3 quadrants
  frame_height = height / 4 -- dives the height of the images into 4 quadrants
  
  for i,face in ipairs({"N","W","S","E"}) do -- creates faces N W S E
    Hero.frames[face] = {} -- creates a table for face
    --I changed i to j in the inner for-loop
    for j=1,3 do
      table.insert(Hero.frames[face], love.graphics.newQuad(
          (j-1) * frame_width, (i-1) * frame_height, frame_width, frame_height, width, height -- creates quads
        ))
    end
  end
end

function Hero:update(dt)
  Hero:checkCollision()
  -- checks whats "WASD" keys are pressed and moves the player
  if love.keyboard.isDown("w") then
    self.facing = "N"
    self.y = self.y - 100*dt
  elseif love.keyboard.isDown("s") then
    self.facing = "S"
    self.y = self.y + 100*dt
  end
  if love.keyboard.isDown("a") then
    self.facing = "E"
    self.x = Hero.x - 100*dt
  elseif love.keyboard.isDown("d") then
    self.facing = "W"
    self.x = self.x + 100*dt
  end
end
-- Will check the co-ordinates of the player and make it so the player is unable to walk into the void. 
function Hero:checkCollision()
  if self.y <= 0 then 
    self.y = 0
  elseif self.y >= love.graphics.getHeight()- frame_height then
    self.y = love.graphics.getHeight() - frame_height
  end
  
   if self.x <= 0 then 
    self.x = 0
  elseif self.x >= love.graphics.getWidth() - frame_width then
    self.x = love.graphics.getWidth() - frame_width
    end
  end
  
-- Draws the facing animations
function Hero:draw()
  local frame
  if Hero.facing == "N" or Hero.facing == "S" then
    frame = 1 + (math.floor(Hero.y/10) % 4)
  elseif Hero.facing == "E" or Hero.facing == "W" then
    frame = 1 + (math.floor(Hero.x/10) % 4)
  elseif false then
    frame = 0
  end
  if frame == 4 then frame = 2 end
  love.graphics.draw(Hero.image, Hero.frames[Hero.facing][frame], math.floor(Hero.x), math.floor(Hero.y))
end

return Hero