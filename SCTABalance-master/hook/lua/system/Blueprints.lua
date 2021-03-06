do
    local OldModBlueprints = ModBlueprints

    function ModBlueprints(all_blueprints)
        OldModBlueprints(all_blueprints)
        BlueprintMults(all_blueprints)
        GiveVet(all_blueprints.Unit)
        BlueprintAirMults(all_blueprints)
    end

    function BlueprintMults(all_blueprints)
        local Mults = {
            Defense = {
                Health = 0.5,
                MaxHealth = 0.5,
            },
            Display = {
                UniformScale = 0.5,
            },
            Intel = {
                VisionRadius = 1.5, 
                WaterVisionRadius = 3,
                },
            Economy = {
                BuildCostEnergy = 0.3,
                BuildCostMass = 0.5,
                BuildTime = 0.05,
                BuildRate = 0.075,
                MaintenanceConsumptionPerSecondEnergy = 3,
            },
            LifeBarHeight = 0.5,
            LifeBarOffset = 0.5,
            LifeBarSize = 0.5,
            Physics = {
                MaxAcceleration = 1.0,
                MaxSpeed = 1.2,
                FuelRechargeRate = 0.000005,
                FuelUseTime = 0.0006,
                SkirtSizeX = 1,
                SkirtSizeZ = 1,
            },    
            SelectionSizeX = 0.5,
            SelectionSizeZ = 0.5,
            SelectionThickness = 0.5,
            SizeX = 0.5,
            SizeY = 0.5,
            SizeZ = 0.5,
        }
        for id, bp in all_blueprints.Unit do
            if bp.Categories and (table.find(bp.Categories, 'ARM') or table.find(bp.Categories, 'CORE')) then
                for group, gdata in Mults do
                    if type(gdata) == 'table' then
                        for stat, data in gdata do
                            if bp[group] and bp[group][stat] then
                                bp[group][stat] = bp[group][stat] * data
                            end
                        end
                    else
	                    if bp[group] then
	                        bp[group] = bp[group] * gdata
	                    end
	                end
	            end
	        end
        end
        
        Mults = {
            Defense = {
                Health = 0.5,
                MaxHealth = 0.5,
            },
            Display = {
                UniformScale = 0.5,
            },
            Economy = {
                ReclaimEnergyMax = 0.25,
                ReclaimMassMax = 0.5,
                ReclaimTime = 0.5,
            },
            Footprint = {
                OccupancyCaps = 0,
            },
            SelectionSizeX = 0.5,
            SelectionSizeZ = 0.5,
            SelectionThickness = 0.5,
            SizeX = 0.5,
            SizeY = 0.5,
            SizeZ = 0.5,    
            CollisionSizeX = 0,
            CollisionSizeZ = 0,
            CollisionOffsetZ = 0,
        }
        for id, bp in all_blueprints.Prop do
            if bp.ScriptClass == 'TAWreckage' then
                for group, gdata in Mults do
                    if type(gdata) == 'table' then
                        for stat, data in gdata do
                            if bp[group] and bp[group][stat] then
                                bp[group][stat] = bp[group][stat] * data
                            end
                        end
                    else
                        if bp[group] then
                            bp[group] = bp[group] * gdata
                        end
                    end
                end
            end
        end
        
        Mults = {
            Display = {
                UniformScale = 0.5,
            },
        }
        for id, bp in all_blueprints.Projectile do
            if bp.Categories and (table.find(bp.Categories, 'ARM') or table.find(bp.Categories, 'CORE')) then 
                for group, gdata in Mults do
                    if type(gdata) == 'table' then
                        for stat, data in gdata do
                            if bp[group] and bp[group][stat] then
                                bp[group][stat] = bp[group][stat] * data
                            end
                        end
                    else
                        if bp[group] then
                            bp[group] = bp[group] * gdata
                        end
                    end
                end
            end
        end
    end
    
    function GiveVet(all_bps)
        for id, bp in all_bps do
            if bp.Weapon and bp.Categories then
                local mul = 10
                if table.find(bp.Categories, 'TECH1') then
                    mul = 1
                elseif table.find(bp.Categories, 'TECH2') then
                    mul = 2
                elseif table.find(bp.Categories, 'TECH3') then
                    mul = 3
                elseif table.find(bp.Categories, 'EXPERIMENTAL') then
                    mul = 4
                elseif table.find(bp.Categories, 'COMMAND') then
                    mul = 5
                end
                if not bp.Buffs then bp.Buffs = {} end
                if not bp.Buffs.Regen then
                    bp.Buffs.Regen = {
                        Level1 = 1 * mul,
                        Level2 = 2 * mul,
                        Level3 = 3 * mul,
                        Level4 = 4 * mul,
                        Level5 = 5 * mul,
                    }
                end
                if not bp.Veteran then
                    bp.Veteran =  {
                        Level1 = 3 * mul,
                        Level2 = 6 * mul,
                        Level3 = 9 * mul,
                        Level4 = 12 * mul,
                        Level5 = 15 * mul,
                    }
                end
            end
        end
    end
        function BlueprintAirMults(all_blueprints)
        for id, bp in all_blueprints.Unit do
                if bp.Categories and ((table.find(bp.Categories, 'ARM') or table.find(bp.Categories, 'CORE')) and table.find(bp.Categories, 'AIR') and table.find(bp.Categories, 'MOBILE')) then
            if not bp.Physics.GroundCollisionOffset then bp.Physics.GroundCollisionOffset = 1.5 end
        end
    end
end
end