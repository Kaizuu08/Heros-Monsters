

Hero = require "hero"
Bullet = require "bullet"
Monster = require "monster"

-- loads the data of the .lua files
function love.load()
  Hero:load()
  Bullet:load()
  Monster:load()
end
--calls the movement/update functions
function love.update(dt)
  Hero:update(dt)
  Bullet:update(dt)
  Monster:update(dt)
end

function love.mousepressed(x, y, button)
	if button == 1 then
		local startX = Hero.x + frame_width / 2 -- gets the co-ordinates of the hero then the width and dividing by 2 finds the center
		local startY = Hero.y + frame_height / 2 -- gets the co-ordinates of the hero then the width and dividing by 2 finds the center
		local mouseX = x -- the x co-ordinates of the mouse
		local mouseY = y -- the y co-ordinates of the mouse
		
		local angle = math.atan2((mouseY - startY), (mouseX - startX)) -- this finds the angle at which the mouse is located proportionate to the player location.
		
		local bulletDx = 2 * math.cos(angle) -- by using the angle and cosine, we are able to find the bullets x co-ordinate in which it should head towards. 
		local bulletDy = 2 * math.sin(angle) -- by using the angle and cosine, we are able to find the bullets y co-ordinate in which it should head towards. 
		
		table.insert(Bullet, {x = startX, y = startY, dx = bulletDx, dy = bulletDy}) -- this inserts the data of starting position and the mouse / bulleting position into the Bullet table located in bullet.lua in both the function draw and update
	end
end

-- when hit by a bullet monster will dissapear and link back to spawning a new one
function hit()
  table.remove(Bullet, 1)
end
function love.draw()
  Hero:draw()
  Bullet:draw()
  Monster:draw()
end