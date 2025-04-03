-- Path of Building
--
-- Class: Section Control
-- Section box with label
--

local SectionClass = newClass("SectionControl", "Control", function(self, anchor, rect, label)
	self.Control(anchor, rect)
	self.label = label
end)

function SectionClass:Draw()
    local x, y = self:GetPos()
    local width, height = self:GetSize()
    local radius = 4 -- radio para las esquinas redondeadas
    
    -- Dibuja el borde exterior en tono lila
    SetDrawLayer(nil, -10)
    SetDrawColor(0.6, 0.4, 0.6)
    DrawRoundedRectangle(x, y, width, height, radius)
    
    -- Dibuja el interior en tono lila más oscuro
    SetDrawColor(0.2, 0.1, 0.2)
    DrawRoundedRectangle(x + 2, y + 2, width - 4, height - 4, radius - 1)
    
    SetDrawLayer(nil, 0)
    local label = self:GetProperty("label")
    local labelWidth = DrawStringWidth(14, "VAR", label)
    
    -- Dibuja el fondo de la etiqueta en tono lila
    SetDrawColor(0.6, 0.4, 0.6)
    DrawRoundedRectangle(x + 6, y - 8, labelWidth + 6, 18, 3)
    
    -- Interior de la etiqueta en tono más oscuro
    SetDrawColor(0.3, 0.1, 0.3)
    DrawRoundedRectangle(x + 7, y - 7, labelWidth + 4, 16, 2)
    
    -- Texto en blanco
    SetDrawColor(1, 1, 1)
    DrawString(x + 9, y - 6, "LEFT", 14, "VAR", label)
end