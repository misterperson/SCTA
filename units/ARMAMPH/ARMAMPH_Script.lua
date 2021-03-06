#ARM Pelican - Amphibious Kbot
#ARMAMPH
#
#Script created by Axle

local TAunit = import('/mods/SCTA-master/lua/TAunit.lua').TAunit
local TAweapon = import('/mods/SCTA-master/lua/TAweapon.lua').TAweapon

ARMAMPH = Class(TAunit) {

	Weapons = {
		armamph_weapon1 = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				
			end,
		},
		armamph_weapon2 = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				
			end,
		},
	},
}

TypeClass = ARMAMPH
