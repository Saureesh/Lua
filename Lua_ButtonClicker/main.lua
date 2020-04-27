function love.load()
  math.randomseed(os.time())
    button={}
  button.x=200
  button.y=200
  button.size=100

  score=0
  timerActive = false
  timerDuration=5
  math.abs(timerDuration)

  myFont=love.graphics.newFont(20)
end

function love.update(dt)
  if timerActive==false then
   timerDuration = timerDuration - dt
   if timerDuration <=0 then
     love.event.wait()
     timerDuration=0
   end
 end
end

function love.draw()
  love.graphics.setColor(0,255,255)
  love.graphics.circle("fill", button.x,button.y,button.size)

  love.graphics.setFont(myFont)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print('Score :'..score)
  love.graphics.setColor(255,255,255)
  love.graphics.print('Timer :'..(timerDuration),200,0)
  if timerDuration==0 then
    love.graphics.print("Game Over",250,200)
    love.graphics.print("Score ="..score,250,250)
  end
end

function   love.mousepressed(x, y, b, istouch)
    if b==1 then
      if distanceBetween(button.x,button.y,love.mouse.getX(),love.mouse.getY()) < button.size then
        score = score  + 1
        button.size=button.size-17
        button.x=math.random(button.size, love.graphics.getWidth() - button.size)
        button.y=math.random(button.size,love.graphics.getHeight() - button.size)

      end
    end
  end


function distanceBetween(x1,y1,x2,y2)
  return math.sqrt((y2-y1)^2 + (x2-x1)^2)
end
