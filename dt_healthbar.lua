DT_HealthBar = Core.class(Sprite)

function DT_HealthBar:init(config)
    self.size = 1
    self.back_color = config.back_color
    self.front_color = config.front_color
    self.alpha = 1
    self.fill_style = Shape.SOLID
    self.max_value = config.max_value
    self.min_value = 0
    self.width = config.width
    self.height = config.height

    self.current = config.max_value
    self.current_width = config.width

    self:addChild(self:draw_bar(self.width, self.back_color))
    self:addChild(self:draw_bar(self.width, self.front_color))
end

function DT_HealthBar:draw_bar(width, color)
    local bar = Shape.new()
    bar:setFillStyle(self.fill_style, color)
    bar:setLineStyle(self.size, color, self.alpha)
    bar:beginPath()
    bar:moveTo(0,0)
    bar:lineTo(width, 0)
    bar:lineTo(width, self.height)
    bar:lineTo(0, self.height)
    bar:lineTo(0, 0)
    bar:endPath()

    return bar
end

function DT_HealthBar:update()
    self:removeChildAt(2)
    self:addChild(self:draw_bar(self.current_width, self.front_color))
end

function DT_HealthBar:add(amount)
    self.current = math.min(self.max_value, math.max(self.min_value, amount))
    local percent = self.current / self.max_value
    local percentage_of_width = self.width * percent
    self.current_width = self.current_width + percentage_of_width

    if self.current_width > self.width then
        self.current_width = self.width
    end

    self:update()
end

function DT_HealthBar:subtract(amount)
    self.current = math.min(self.max_value, math.max(self.min_value, amount))
    local percent = self.current / self.max_value
    local percentage_of_width = self.width * percent
    self.current_width = self.current_width - percentage_of_width

    if self.current_width < 0 then
        self.current_width = 0
    end

    self:update()
end

function DT_HealthBar:fill()
    self.current = self.max_value
    self.current_width = self.width
    self:update()
end

function DT_HealthBar:empty()
    self.current = self.min_value
    self.current_width = self.min_value
    self:update()
end