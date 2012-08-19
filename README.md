DT_Healthbar is a simple health bar implementation for [Gideros Mobile](http://www.giderosmobile.com/). Could also be used as a progress bar.

__Initialization__

    -- create the health bar
    local healthbar = DT_HealthBar.new({
        width = 100,
        height = 10,
        front_color = 0x00FF00,
        back_color = 0xFF0000,
        max_value = 100 -- how "full" can this bar be?
    })

    -- add it to stage
    stage:addChild(healthbar)

    -- position where you want it to be
    _W = (application:getContentWidth() * 0.5) - (healthbar:getWidth() * 0.5)
    _H = (application:getContentHeight() * 0.5) - (healthbar:getHeight() * 0.5)

    healthbar:setPosition(_W, _H)
    -- healthbar:setRotation(-90) -- flip it vertical

__Empty a full health bar__

    healthbar:fill()

    local decrement_healthbar = function()
        healthbar:subtract(10)
    end
    
    local health_down = Timer.new(600, 10)
    health_down:addEventListener(Event.TIMER, decrement_healthbar)
    health_down:start()

__Fill an empty health bar__

    healthbar:empty()

    local increment_healthbar = function()
        healthbar:add(10)
    end
    
    local health_up = Timer.new(600, 10)
    health_up:addEventListener(Event.TIMER, increment_healthbar)
    health_up:start()