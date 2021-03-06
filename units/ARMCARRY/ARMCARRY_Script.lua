#ARM Colossus - Light Carrier
#ARMCARRY
#
#Script created by Raevn

local TAunit = import('/mods/SCTA-master/lua/TAunit.lua').TAunit

ARMCARRY = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			radar = CreateRotator(self, 'Radar', 'y', nil, 0, 0, 0),
		}
		self.Trash:Add(self.Spinners.radar)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		--SPIN radar around y-axis SPEED <60.01>
		self.Spinners.radar:SetSpeed(60)
		self:SetMaintenanceConsumptionActive()
	end,


	OnScriptBitSet = function(self, bit)
		if bit == 3 then

			self.Spinners.radar:SetSpeed(0)

			self:SetMaintenanceConsumptionInactive()
		end
		TAunit.OnScriptBitSet(self, bit)
	end,


	OnScriptBitClear = function(self, bit)
		if bit == 3 then
			--SPIN radar around y-axis SPEED <60.01>
			self.Spinners.radar:SetSpeed(60)
			self:SetMaintenanceConsumptionActive()
		end
		TAunit.OnScriptBitClear(self, bit)
	end,
}

TypeClass = ARMCARRY
