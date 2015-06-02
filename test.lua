Account = {
	balance = 0,
	new = function(self, obj)
		obj = obj or {}
		setmetatable(o, self)
		self.__index = self
		return o
	end,
	withdraw = function(self, v)
		self.balance = self.balance - v
	end
}

a = Account:new()
a:withdraw(100)

