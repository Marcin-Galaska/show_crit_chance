-- Show Crit Chance mod by mroużon. Ver. 1.1
-- Thanks to Zombine, Redbeardt and others for their input into the community. Their work helped me a lot in the process of creating this mod.

local mod = get_mod("show_crit_chance")

-- ##################################################
-- Requires
-- ##################################################

local WeaponTemplate = require("scripts/utilities/weapon/weapon_template")
local HudElementCritSettings = mod:io_dofile("show_crit_chance/scripts/mods/show_crit_chance/hud/hud_element_crit_settings")

-- ##################################################
-- Mod variables
-- ##################################################

mod._current_crit_chance = 0.0                                              -- Player critical chance with drawn weapon, at given frame
mod._is_ranged = false                                                      -- Whether player holds a ranged weapon
mod._is_melee = false                                                       -- Whether player holds a melee weapon
mod._guaranteed_crit = false                                                -- Whether player has a buff that guarantees them a critical strike
mod._weapon_handling_template = {}                                          -- Weapon Extensions's handling template
mod._player = {}                                                            -- Player handle
mod._crit_chance_indicator_icon_table = {                                   -- Icons the user can add to the crit chance %
    [1] = "",
    [2] = " ",
    [3] = " ",
    [4] = " ",
    [5] = " ",
    [6] = " "
}

mod._font_type = mod:get("font_type")
mod._font_size = mod:get("font_size")
mod._show_floating_point = mod:get("show_floating_point")
mod._only_in_training_grounds = mod:get("only_in_training_grounds")
mod._crit_chance_indicator_icon = mod._crit_chance_indicator_icon_table[mod:get("crit_chance_indicator_icon")]
mod._crit_chance_indicator_horizontal_offset = HudElementCritSettings.widget_horizontal_offset + mod:get("crit_chance_indicator_horizontal_offset")
mod._crit_chance_indicator_vertical_offset = HudElementCritSettings.widget_vertical_offset + -1 * mod:get("crit_chance_indicator_vertical_offset")
mod._crit_chance_indicator_appearance = {
    mod:get("crit_chance_indicator_opacity"),
    mod:get("crit_chance_indicator_R"),
    mod:get("crit_chance_indicator_G"),
    mod:get("crit_chance_indicator_B")
}

local hud_element_script = "show_crit_chance/scripts/mods/show_crit_chance/hud/hud_element_crit"
local hud_element_class = "HudElementCrit"

local crit_hud_element = {
    use_hud_scale = true,
    filename = hud_element_script,
    class_name = hud_element_class,
    visibility_groups = {
        "alive",
        "communication_wheel"
    }
}

-- ##################################################
-- Initalization
-- ##################################################

local init = function(func, ...)
    if func then
        func(...)
    end
end

mod.recreate_hud = function(self)
	local ui_manager = Managers.ui
	if ui_manager then
		local hud = ui_manager._hud
		if hud then
			local player = Managers.player:local_player(1)
			local peer_id = player:peer_id()
			local local_player_id = player:local_player_id()
			local elements = hud._element_definitions
			local visibility_groups = hud._visibility_groups
			hud:destroy()
			ui_manager:create_player_hud(peer_id, local_player_id, elements, visibility_groups)
		end
	end
end

mod.get_hud_element = function()
    local hud = Managers.ui:get_hud()
    return hud and hud:element(crit_hud_element.class_name)
end

mod.on_setting_changed = function(id)
    if id == "font_type" then
        mod._font_type = mod:get(id)

        local crit_chance_element = mod.get_hud_element()
        if crit_chance_element then
            crit_chance_element:set_font(mod._font_type, mod._font_size)
        end
    elseif id == "font_size" then
        mod._font_size = mod:get(id)

        local crit_chance_element = mod.get_hud_element()
        if crit_chance_element then
            crit_chance_element:set_font(mod._font_type, mod._font_size)
        end
    elseif id == "show_floating_point" then
        mod._show_floating_point = mod:get(id)
    elseif id == "only_in_training_grounds" then
        mod._only_in_training_grounds = mod:get(id)
    elseif id == "crit_chance_indicator_icon" then
        mod._crit_chance_indicator_icon = mod._crit_chance_indicator_icon_table[mod:get(id)]
    elseif id == "crit_chance_indicator_horizontal_offset" then
        mod._crit_chance_indicator_horizontal_offset = mod:get(id)

        local crit_chance_element = mod.get_hud_element()
        if crit_chance_element then
            crit_chance_element:set_offset(mod._crit_chance_indicator_vertical_offset, mod._crit_chance_indicator_horizontal_offset)
        end
    elseif id == "crit_chance_indicator_vertical_offset" then
        mod._crit_chance_indicator_vertical_offset = -1 * mod:get(id)

        local crit_chance_element = mod.get_hud_element()
        if crit_chance_element then
            crit_chance_element:set_offset(mod._crit_chance_indicator_vertical_offset, mod._crit_chance_indicator_horizontal_offset)
        end
    elseif id == "crit_chance_indicator_opacity" then
        mod._crit_chance_indicator_appearance = {
            mod:get(id),
            mod:get("crit_chance_indicator_R"),
            mod:get("crit_chance_indicator_G"),
            mod:get("crit_chance_indicator_B")
        }

        local crit_chance_element = mod.get_hud_element()
        if crit_chance_element then
            crit_chance_element:set_text_appearance(mod._crit_chance_indicator_appearance)
        end
    elseif id == "crit_chance_indicator_R" then
        mod._crit_chance_indicator_appearance = {
            mod:get("crit_chance_indicator_opacity"),
            mod:get(id),
            mod:get("crit_chance_indicator_G"),
            mod:get("crit_chance_indicator_B")
        }

        local crit_chance_element = mod.get_hud_element()
        if crit_chance_element then
            crit_chance_element:set_text_appearance(mod._crit_chance_indicator_appearance)
        end
    elseif id == "crit_chance_indicator_G" then
        mod._crit_chance_indicator_appearance = {
            mod:get("crit_chance_indicator_opacity"),
            mod:get("crit_chance_indicator_R"),
            mod:get(id),
            mod:get("crit_chance_indicator_B")
        }

        local crit_chance_element = mod.get_hud_element()
        if crit_chance_element then
            crit_chance_element:set_text_appearance(mod._crit_chance_indicator_appearance)
        end
    elseif id == "crit_chance_indicator_B" then
        mod._crit_chance_indicator_appearance = {
            mod:get("crit_chance_indicator_opacity"),
            mod:get("crit_chance_indicator_R"),
            mod:get("crit_chance_indicator_G"),
            mod:get(id)
        }

        local crit_chance_element = mod.get_hud_element()
        if crit_chance_element then
            crit_chance_element:set_text_appearance(mod._crit_chance_indicator_appearance)
        end
    end
end

mod.on_all_mods_loaded = function()
    init()
    mod:recreate_hud()
end

mod.player_unit_loaded = function(self)
	self:init()
    mod:recreate_hud()
end

-- ##################################################
-- Hooks
-- ##################################################

-- Weapon handling template needs to be constantly updated
mod:hook_safe("PlayerUnitWeaponExtension", "update", function (self, unit, dt, t)
    mod._weapon_handling_template = self:weapon_handling_template() or {}
end)

-- Get properties on weapon switch
mod:hook_safe("PlayerUnitWeaponExtension", "on_slot_wielded", function(self, slot_name, t, skip_wield_action)
    local weapon_action_component = self._weapon_action_component
    local weapon_template = weapon_action_component and WeaponTemplate.current_weapon_template(weapon_action_component)
	mod._is_ranged = weapon_template and WeaponTemplate.is_ranged(weapon_template)
	mod._is_melee = weapon_template and WeaponTemplate.is_melee(weapon_template)

    mod._player = self._player
end)

-- Add hud element to hud
mod:add_require_path(hud_element_script)
mod:hook(CLASS.UIHud, "init", function(func, self, elements, visibility_groups, params, ...)
	if not table.find_by_key(elements, "class_name", hud_element_class) then
		table.insert(elements, crit_hud_element)
	end

	return func(self, elements, visibility_groups, params, ...)
end)
