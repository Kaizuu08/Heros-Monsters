local Monster = {}
local monsters = {}

function Monster:load()
  self.image = love.graphics.newImage("Bee.png") -- The sprite of the monster
  local wHeight = love.graphics.getHeight() -- local variable for window height
  local wWidth = love.graphics.getWidth() --local variable for window width
  self.x = love.math.random(0, wWidth) -- gives random co-ordinate between 0 and window Width
  self.y = love.math.random(0, wHeight) -- gives random co-ordinate between 0 and window Height
  self.alive = true -- detects whether there are any monsters active
  self.deathcount = 0 -- will be used to figure out how many monsters should spawn
end

function Monster:update(dt)
  self:movement(dt) -- calls the movement function
  self:checkCollision() -- calls the checkCollision function
end

--implement a way so that monsters spawn at certain intervals or spawn more than one when monster dies
function Monster:draw()
  if self.alive == true then
  love.graphics.draw(self.image, self.x, self.y) 
  elseif self.alive == false then
    self.deathcount = self.deathcount + 1
    self.alive = true
    love.graphics.draw(self.image, self.x, self.y) 
    end
  end
-- try to implement a way so that it moves in a random pattern
function Monster:movement(dt)
  if self.alive == true then
  self.y = self.y 
  self.x = self.x
  end
end
-- for when monster hits border(planning on bouncing back)
function Monster:checkCollision()
end

return Monster