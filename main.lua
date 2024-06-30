math.randomseed(os.time())
require('love')
require('game_config')
require('snake')

function love.load()
end

function love.update()
    if configs.state.pause == false and configs.state.game_over == false and configs.state.running then
        snake.update()
    end
end

function love.draw()
    snake.draw_snake_and_apple()
    configs.stateManage()
end

function love.keypressed(key)
    configs.state.running = true
    if key == 'escape' then
        love.event.quit()
    elseif key == 'left' then
        snake.dirX, snake.dirY = -1, 0
    elseif key == 'right' then
        snake.dirX, snake.dirY = 1, 0
    elseif key == 'up' then
        snake.dirX, snake.dirY = 0, -1
    elseif key == 'down' then
        snake.dirX, snake.dirY = 0, 1
    elseif key == 'space' and configs.state.game_over then
        configs.reset()
        snake.reset()
    end
end
