-- Show Crit Chance mod by mroużon. Ver. 1.0.2
-- Thanks to Zombine, Redbeardt and others for their input into the community. Their work helped me a lot in the process of creating this mod.

local mod = get_mod("show_crit_chance")

-- ##################################################
-- Requires
-- ##################################################

local UIWidget = require("scripts/managers/ui/ui_widget")
local WeaponTemplate = require("scripts/utilities/weapon/weapon_template")

-- ##################################################
-- Mod variables
-- ##################################################

mod._current_crit_chance = 0.0                                              -- Player critical chance with drawn weapon, at given frame
mod._is_ranged = false                                                      -- Whether player holds a ranged weapon
mod._is_melee = false                                                       -- Whether player holds a melee weapon
mod._guaranteed_crit = false                                                -- Whether player has a guaranteed crit on next strike
mod._weapon_handling_template = {}                                          -- Weapon Extensions's handling template
mod._player = {}                                                            -- Player actor
mod._crit_chance_indicator_icon_table = {                                   -- Icons the user can add to the crit chance %
    [1] = "",
    [2] = " ",
    [3] = " ",
    [4] = " ",
    [5] = " ",
    [6] = " "
}

mod._show_floating_point = mod:get("show_floating_point")
mod._crit_chance_indicator_icon = mod._crit_chance_indicator_icon_table[mod:get("crit_chance_indicator_icon")]
mod._crit_chance_indicator_horizontal_offset = mod:get("crit_chance_indicator_horizontal_offset")
mod._crit_chance_indicator_vertical_offset = -1 * mod:get("crit_chance_indicator_vertical_offset")
mod._crit_chance_indicator_appearance = {
    mod:get("crit_chance_indicator_opacity"),
    mod:get("crit_chance_indicator_R"),
    mod:get("crit_chance_indicator_G"),
    mod:get("crit_chance_indicator_B")
}

-- ##################################################
-- Initalization
-- ##################################################

local init = function(func, ...)
    if func then
        func(...)
    end
end

mod.on_setting_changed = function(id)
    if id == "show_floating_point" then
        mod._show_floating_point = mod:get(id)
    elseif id == "crit_chance_indicator_icon" then
        mod._crit_chance_indicator_icon = mod._crit_chance_indicator_icon_table[mod:get(id)]
    elseif id == "crit_chance_indicator_horizontal_offset" then
        mod._crit_chance_indicator_horizontal_offset = mod:get(id)
    elseif id == "crit_chance_indicator_vertical_offset" then
        mod._crit_chance_indicator_vertical_offset = -1 * mod:get(id)
    elseif id == "crit_chance_indicator_opacity" then
        mod._crit_chance_indicator_appearance = {
            mod:get(id),
            mod:get("crit_chance_indicator_R"),
            mod:get("crit_chance_indicator_G"),
            mod:get("crit_chance_indicator_B")
        }
    elseif id == "crit_chance_indicator_R" then
        mod._crit_chance_indicator_appearance = {
            mod:get("crit_chance_indicator_opacity"),
            mod:get(id),
            mod:get("crit_chance_indicator_G"),
            mod:get("crit_chance_indicator_B")
        }
    elseif id == "crit_chance_indicator_G" then
        mod._crit_chance_indicator_appearance = {
            mod:get("crit_chance_indicator_opacity"),
            mod:get("crit_chance_indicator_R"),
            mod:get(id),
            mod:get("crit_chance_indicator_B")
        }
    elseif id == "crit_chance_indicator_B" then
        mod._crit_chance_indicator_appearance = {
            mod:get("crit_chance_indicator_opacity"),
            mod:get("crit_chance_indicator_R"),
            mod:get("crit_chance_indicator_G"),
            mod:get(id)
        }
    end
end

mod.on_all_mods_loaded = function()
    init()
end

-- ##################################################
-- Hooks
-- ##################################################

mod:hook_safe("Orientation", "look_delta", function(main_dt, input, fov_sensitivity, mouse_scale, look_delta_context)
    local weapon_action_component = look_delta_context.weapon_action_component
	local weapon_template = weapon_action_component and WeaponTemplate.current_weapon_template(weapon_action_component)
	mod._is_ranged = weapon_template and WeaponTemplate.is_ranged(weapon_template)
	mod._is_melee = weapon_template and WeaponTemplate.is_melee(weapon_template)
end)

mod:hook_safe("PlayerUnitWeaponExtension", "update", function (self, unit, dt, t)
    mod._weapon_handling_template = self:weapon_handling_template() or {}
    mod._player = self._player

    local buff_extension = self._buff_extension
    mod._guaranteed_crit =
        buff_extension:has_keyword("guaranteed_critical_strike") or
        mod._is_ranged and buff_extension:has_keyword("guaranteed_ranged_critical_strike") or
        mod._is_melee and buff_extension:has_keyword("guaranteed_melee_critical_strike")
end)

mod:hook_safe("HudElementPlayerWeapon", "update", function(self, dt, t, ui_renderer, render_settings, input_service)
    -- Sadly, this require needs to be here because of NetworkConstants :(
    -- Seems like a game code issue
    local CriticalStrike = require("scripts/utilities/attack/critical_strike")

    -- Calculate crit chance
    mod._current_crit_chance= CriticalStrike.chance(mod._player, mod._weapon_handling_template, mod._is_ranged, mod._is_melee)
    local crit_chance_percent = "NaN"

    local string_crit_chance = tostring(mod._current_crit_chance)
    local before_dot = tonumber(string.sub(string_crit_chance, 3, 4))
    local after_dot = tonumber(string.sub(string_crit_chance, 5, 6))

    -- "00" converted to nil. Since a player always has >= 1% crit chance, this means 100%.
    if before_dot == nil then
        before_dot = 100
    end

    -- Account for float inaccuracy and developer error
    if after_dot and (after_dot - 9) % 10 == 0 then
        after_dot = after_dot + 1

        if after_dot == 100 then
            after_dot = 0
            before_dot = before_dot + 1
        end
    end

    local before_dot_string = tostring(before_dot)

    -- Convert to text
    if mod._show_floating_point then
        local after_dot_string = tostring(after_dot)

        -- Making sure the fixed precision is 2
        while #after_dot_string < 2 do
            after_dot_string = after_dot_string .. "0"
        end

        crit_chance_percent = mod._crit_chance_indicator_icon .. before_dot_string .. "." .. after_dot_string .. "%"
    else
        -- Mathematically round to whole %
        if after_dot then
            local after_dot_tens = after_dot
            if after_dot_tens > 10 then
                after_dot_tens = after_dot_tens / 10
            end

            if after_dot_tens >= 5 then
                before_dot = before_dot + 1
                before_dot_string = tostring(before_dot)
            end
        end

        crit_chance_percent = mod._crit_chance_indicator_icon .. before_dot_string .. "%"
    end

    -- Update widget
	local crit_chance_widget = self._widgets_by_name.crit_chance_indicator
    if crit_chance_widget then
        crit_chance_widget.dirty = true                                                 -- This keeps the widget updating in real time. Who the hell named it 'dirty' though?
        crit_chance_widget.content.crit_chance_indicator_text = crit_chance_percent
		crit_chance_widget.style.crit_chance_indicator_text.text_color = mod._crit_chance_indicator_appearance
        crit_chance_widget.style.crit_chance_indicator_text.offset = {
            mod._crit_chance_indicator_horizontal_offset,
            mod._crit_chance_indicator_vertical_offset,
            0
        }
    end
end)

mod:hook(_G, "require", function(func, path, ...)
	local result = func(path, ...)

    -- Inject widget into the HUD
	if path == "scripts/ui/hud/elements/player_weapon/hud_element_player_weapon_definitions" then
		result.scenegraph_definition.crit_chance_panel = {
			parent = "screen",
			vertical_alignment = "center",
			horizontal_alignment = "center",
			size = { 100, 100 },
			position = { 0, 80, 0 }
		}

		result.widget_definitions.crit_chance_indicator = UIWidget.create_definition({
			{
				pass_type = "text",
				value_id = "crit_chance_indicator_text",
				style_id = "crit_chance_indicator_text",
				style = {
					vertical_alignment = "center",
					horizontal_alignment = "center",
                    text_vertical_alignment = "center",
					text_horizontal_alignment = "center",
					offset = { 0, 0, 0 },
					size = { 200, 100 }
				},
			},
		}, "crit_chance_panel")
	end

	return result
end)