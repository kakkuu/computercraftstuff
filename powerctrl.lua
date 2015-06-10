-- powerctrl

Node = { }
function Node:new(self, obj)
	obj = obj or {}
	setmetatable(obj, self)
	self.__index = self
	return obj
end
function Node:add(self, node)
	if not self.nodes then self.nodes = {} end
	table.insert(self.nodes, node)
end
function Node:event(self, ev)
	if self.nodes then
		for _, v in ipairs(self. nodes) do
			v:event(ev)
		end
	end
end
function Node:render(self, target) -- target is a node
	if self.nodes then
		for _, v in ipairs(self.nodes) do
			v:render(target)
		end
	end
end

--
--

TermNode = Node:new()
function TermNode:render(self, target) -- target is a term
	target.clear()
end
function TermNode:drawPixel(self, x, y, fg, bg, ch)
	self.term.setCursorPos(x, y)
	self.term.setTextColor(fg)
	self.term.setBackgroundColor(bg)
	self.term.write(ch)
end
function TermNode:getTerm(self)
	return self.term
end

--
--

Button = Node:new()

--
--

mon = peripheral.wrap("left")
gui = TermNode:new()

rct = peripheral.wrap("back")

while true do

	gui:render(mon)
end