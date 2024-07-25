local anim8=require "libs.anim8"
player={
    x=100,
    y=100,
    speed=200,
    image=love.graphics.newImage("assets/images/sword.png"),
    state={}
}
-- local player=love.graphics.newImage("assets/images/sword.png")
local g=anim8.newGrid(64,64,player.image:getWidth(),player.image:getHeight())
player.state.Idel=anim8.newAnimation(g('1-4',1),0.1)
player.state.Run=anim8.newAnimation(g('1-4',2),0.1)
player.state.Attack=anim8.newAnimation(g('1-4',3),0.1)
player.state.Defense=anim8.newAnimation(g('1-4',4),0.1)


function love.load()
    currAnim=player.state.Idel
end
function love.update(dt)
    if love.keyboard.isDown("left") then
        currAnim=player.state.Run
        player.x=player.x-player.speed*dt
    elseif love.keyboard.isDown("right") then
        currAnim=player.state.Run
        player.x=player.x+player.speed*dt
    elseif love.keyboard.isDown("up") then
        currAnim=player.state.Run
        player.y=player.y-player.speed*dt
    elseif love.keyboard.isDown("down") then
        currAnim=player.state.Run
        player.y=player.y+player.speed*dt
    elseif love.keyboard.isDown("space") then
        currAnim=player.state.Attack
    elseif love.keyboard.isDown("z") then
        currAnim=player.state.Defense
    else currAnim=player.state.Idel

end

    currAnim:update(dt)
end
function love.draw()
    currAnim:draw(player.image,player.x,player.y)
end
