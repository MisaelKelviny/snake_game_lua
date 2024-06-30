configs = {
    interval = 5,
    score = 0,
    frame_size = 20,
    border = {
        w = 600,
        h = 600,
        limitX = 29,
        limitY = 29
    },
    colors = {
        green = { 0, 255, 0 },
        red = { 255, 0, 0 },
        dark_green = { 44 / 255, 100 / 255, 100 / 255 },
        white = { 255, 255, 255 }
    },
    state = {
        pause = false,
        game_over = false,
        running = false
    }
}

function configs.stateManage()
    if configs.state.pause then
        love.graphics.setColor(configs.colors.green)
        love.graphics.setNewFont(40)
        love.graphics.print('PAUSE', 250, 250)
    elseif configs.state.game_over then
        love.graphics.setColor(configs.colors.green)
        love.graphics.setNewFont(40)
        love.graphics.print('Game Over', 150, 210)
        love.graphics.setNewFont(25)
        love.graphics.print('Points: ' .. configs.score, 150, 260)
        love.graphics.setNewFont(25)
        love.graphics.print('Press Space to Restart', 150, 290)
    elseif configs.state.running then
        love.graphics.setColor(configs.colors.white)
        love.graphics.setNewFont(20)
        love.graphics.print('Apples: ' .. configs.score, 250, 0)
    else
        love.graphics.setColor(configs.colors.white)
        love.graphics.setNewFont(25)
        love.graphics.print('Press any arrow key', 150, 210)
    end
end

function configs.reset()
    configs.state.game_over = false
    configs.state.running = false
    configs.state.pause = false
    configs.score = 0
end

return configs
