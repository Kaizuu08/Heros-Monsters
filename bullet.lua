local Bullet = {}

function Bullet.load()
  Bullet.pressed = 0
  Bullet.speed = 1
end

-- this will determine the bullets location
function Bullet.update(dt)
  --Bullet:dissapear()
  Bullet:checkCollision()
	for i,v in ipairs(Bullet) do
		v.x = v.x + v.dx * Bullet.speed -- starting x co-ordinate + bullet x co-ordinate (mouse)
		v.y = v.y + v.dy * Bullet.speed -- starting x co-ordinate + bullet y co-ordinate (mouse) adding * (number) can increase speed
	end
end
-- this draws the bullet and allows for it to be done multiple times
function Bullet.draw()
for i,v in ipairs(Bullet) do
  Bullet.pressed = Bullet.pressed + 1
		love.graphics.circle("fill", v.x, v.y, 5) -- the number adjusts the size
	end
end

-- Bullet will dissapear if it touches border
function Bullet:checkCollision()
  local gunshot = love.audio.newSource("gunshot.mp3", "static")
  for i,v in ipairs(Bullet) do
    if v.y <= 0 then 
      table.remove(Bullet, 1)
      love.audio.play(gunshot)
    elseif v.y >= love.graphics.getHeight()then
      table.remove(Bullet, 1)
      love.audio.play(gunshot)
    end
    if v.x <= 0 then 
      table.remove(Bullet, 1)
      love.audio.play(gunshot)
    elseif v.x >= love.graphics.getWidth()then
      table.remove(Bullet, 1)
      love.audio.play(gunshot)
    end
  end
end

--this makes it so there are only 4 bullets on screen at one time
--function Bullet:dissapear()
--if Bullet.pressed == 5 then
	--table.remove(Bullet, 1)
  --end
--Bullet.pressed = 0
--end

return Bullet