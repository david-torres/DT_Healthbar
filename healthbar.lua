DT_HealthBar = Core.class(Sprite)

function DT_HealthBar:init(width, height, front_color, back_color, max_value)
    self.size = 1
    self.back_color = back_color
    self.front_color = front_color
    self.alpha = 1
    self.fill_style = Shape.SOLID
    self.max_value = max_value
    self.min_value = 0
    self.width = width
    self.height = height

    self.current = max_value
    self.current_width = width

    self:addChild(self:draw_back_bar())
    self:addChild(self:draw_front_bar())
end

function DT_HealthBar:draw_back_bar()
    local back_bar = Shape.new()
    back_bar:setFillStyle(self.fill_style, self.back_color)
    back_bar:setLineStyle(self.size, self.back_color, self.alpha)
    back_bar:beginPath()
    back_bar:moveTo(0,0)
    back_bar:lineTo(self.width, 0)
    back_bar:lineTo(self.width, self.height)
    back_bar:lineTo(0, self.height)
    back_bar:lineTo(0, 0)
    back_bar:endPath()

    return back_bar
end

function DT_HealthBar:draw_front_bar()
    local front_bar = Shape.new()
    front_bar:setFillStyle(self.fill_style, self.front_color)
    front_bar:setLineStyle(self.size, self.front_color, self.alpha)
    front_bar:beginPath()
    front_bar:moveTo(0,0)
    front_bar:lineTo(self.current_width, 0)
    front_bar:lineTo(self.current_width, self.height)
    front_bar:lineTo(0, self.height)
    front_bar:lineTo(0, 0)
    front_bar:endPath()

    return front_bar
end

function DT_HealthBar:update()
    self:removeChildAt(2)
    self:addChild(self:draw_front_bar())
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
    self.current_width = self.max_value
    self:update()
end

function DT_HealthBar:empty()
    self.current = self.min_value
    self.current_width = self.min_value
    self:update()
end