math.randomseed(os.time())
require('game_config')

snake = {
    dirX = 0,
    dirY = 0,
    headX = 6,
    headY = 6,
    segments = {},
    w = 20,
    h = 20
}
apple = {
    x = math.random(configs.frame_size - 1),
    y = math.random(configs.frame_size + 1),
    w = 20,
    h = 20
}

function snake.draw_snake_and_apple()
    love.graphics.setColor(configs.colors.green)
    love.graphics.rectangle('fill', snake.headX * configs.frame_size, snake.headY * configs.frame_size, snake.w, snake.h)

    love.graphics.setColor(configs.colors.red)
    love.graphics.rectangle('fill', apple.x * configs.frame_size, apple.y * configs.frame_size, apple.w, apple.h)

    local i = 1
    for _ in pairs(snake.segments) do
        if configs.score > 1 then
            love.graphics.setColor(configs.colors.dark_green)
            love.graphics.rectangle('fill', snake.segments[i].x * configs.frame_size,
                snake.segments[i].y * configs.frame_size, snake.w,
                snake.h)
            i = i + 1
        end
    end
end

function snake.update()
    configs.interval = configs.interval - 1
    if configs.interval < 0 then
        local i = configs.score
        while i > 1 do
            snake.segments[i] = snake.segments[i - 1]
            i = i - 1
        end
        snake.segments[1] = { x = snake.headX, y = snake.headY }

        snake.headX = snake.headX + snake.dirX
        snake.headY = snake.headY + snake.dirY

        if snake.headX > configs.border.limitX or snake.headX < 0 or snake.headY > configs.border.limitY or snake.headY < 0 then
            configs.state.game_over = true
        else
            configs.state.game_over = false
        end

        for _, segments in pairs(snake.segments) do
            if segments.x == snake.headX and segments.y == snake.headY then
                configs.state.game_over = true
            end
        end

        if snake.headX == apple.x and snake.headY == apple.y then
            configs.score = configs.score + 1
            posX = math.random(1, configs.border.limitX) % configs.border.w
            posY = math.random(2, configs.border.limitY) % configs.border.h

            for _, segment in pairs(snake.segments) do
                if (segment.x == posX and segment.y == posY) then
                    posX = math.random(1, configs.border.limitX) % configs.border.w
                    posY = math.random(2, configs.border.limitY) % configs.border.h
                end
            end

            apple.x = posX
            apple.y = posY
        end

        configs.interval = 5
    end
end

function snake.reset()
    snake.dirX = 0
    snake.dirY = 0
    snake.w = 20
    snake.h = 20
    snake.segments = {}
    snake.headX = 6
    snake.headY = 6

    apple = {
        x = math.random(configs.frame_size - 1),
        y = math.random(configs.frame_size + 1),
        w = 20,
        h = 20
    }
end

return snake
