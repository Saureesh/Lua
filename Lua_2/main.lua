isDown = love.keyboard.isDown
bool = { [true] = 1, [false] = 0 }
speed = 3
ball = { x = 0, y = 0, vx = -speed, vy = speed }
pad1_y = 0
pad2_y = 0
score1 = 0
score2 = 0
x=love.graphics.getWidth()
y=love.graphics.getHeight()

function love.update(dt)
	pad1_y = pad1_y + (bool[isDown"a"] - bool[isDown"q"]) * 7
	pad2_y = pad2_y + (bool[isDown"down"] - bool[isDown"up"]) * 7
	if pad1_y < -250 then pad1_y = -250 end
	if pad1_y > 250 then pad1_y = 250 end
	if pad2_y < -250 then pad2_y = -250 end
	if pad2_y > 250 then pad2_y = 250 end
	ball.x = ball.x + ball.vx
	ball.y = ball.y + ball.vy
	if math.abs(ball.y) >= 285 then ball.vy = -ball.vy end
	if ball.x < -325 and ball.x > -350 and math.abs(pad1_y - ball.y) < 60 then
		speed = speed + 0.5
		ball.x = -325
		ball.vx = speed
		ball.vy = ball.vy * 0.5 + math.random(-10, 10) / 20 * speed
	end
	if ball.x < -415 then
		ball.x = 0
		ball.vx = -ball.vx
		score2 = score2 + 1
	end
	if ball.x > 325 and ball.x < 350 and math.abs(pad2_y - ball.y) < 60 then
		speed = speed + 0.5
		ball.x = 325
		ball.vx = -speed
		ball.vy = ball.vy * 0.8 + math.random(-10, 10) / 10 * speed
	end
	if ball.x > 415 then
		ball.x = 0
		ball.vx = -ball.vx
		score1 = score1 + 1
	end
	if score1 > 7 or score2 > 7 then
		print("player " .. (score1 > score2 and 1 or 2) .. " wins.")
		love.event.quit()
	end
end

function love.draw()
  	love.graphics.translate(400, 300)
  love.graphics.setColor(0,0,255)
	love.graphics.rectangle("fill", -350-10, pad1_y - 50, 20, 100)
  love.graphics.setColor(0,0,255)
	love.graphics.rectangle("fill", 350-10, pad2_y - 50, 20, 100)
  love.graphics.setColor(0,0,255)
  love.graphics.circle("fill", ball.x, ball.y, 15)
	love.graphics.setColor(255,255,255)
	love.graphics.print(score1, -380, -280)
	love.graphics.print(score2, 370, -280)
end
