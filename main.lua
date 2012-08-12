local back_color = 0xFF0000
local front_color = 0x00FF00
local max_value = 100

local width = 100
local height = 10

local healthbar = DT_HealthBar.new(height, width, front_color, back_color, max_value)

--add it to stage
stage:addChild(healthbar)

--position where you want it to be
healthbar:setPosition(100, 100)

healthbar:fill()
local decrement_healthbar = function()
    healthbar:subtract(10)
end

local health_down = Timer.new(600, 10)
health_down:addEventListener(Event.TIMER, decrement_healthbar)
health_down:start()


-- healthbar:empty()
-- local increment_healthbar = function()
--     healthbar:add(12)
-- end

-- local health_up = Timer.new(600, 10)
-- health_up:addEventListener(Event.TIMER, increment_healthbar)
-- health_up:start()
