-- create the health bar
local healthbar = DT_HealthBar.new({
    width = 100,
    height = 10,
    front_color = 0x00FF00,
    back_color = 0xFF0000,
    max_value = 100 -- how "full" can this bar be?
})

--add it to stage
stage:addChild(healthbar)

--position where you want it to be
_W = (application:getContentWidth() * 0.5) - (healthbar:getWidth() * 0.5)
_H = (application:getContentHeight() * 0.5) - (healthbar:getHeight() * 0.5)

healthbar:setPosition(_W, _H)
-- healthbar:setRotation(-90) -- flip it vertical

--
-- Empty a full healthbar
--
-- healthbar:fill()
-- local decrement_healthbar = function()
--     healthbar:subtract(10)
-- end

-- local health_down = Timer.new(600, 10)
-- health_down:addEventListener(Event.TIMER, decrement_healthbar)
-- health_down:start()


--
-- Fill an empty healthbar
--
healthbar:empty()
local increment_healthbar = function()
    healthbar:add(10)
end

local health_up = Timer.new(600, 10)
health_up:addEventListener(Event.TIMER, increment_healthbar)
health_up:start()
