-- Show Crit Chance mod by mroużon. Ver. 1.1.1
-- Thanks to Zombine, Redbeardt and others for their input into the community. Their work helped me a lot in the process of creating this mod.

local mod = get_mod("show_crit_chance")

local Definitions = mod:io_dofile("show_crit_chance/scripts/mods/show_crit_chance/hud/hud_element_crit_definitions")
local Settings = mod:io_dofile("show_crit_chance/scripts/mods/show_crit_chance/hud/hud_element_crit_settings")

local HudElementCrit = class("HudElementCrit", "HudElementBase")

-- Table of buffs giving 100% crit chance.
-- Keys are buff names, values are functions returning buff validity
local guaranteed_crit_buffs = {
    ["zealot_dash_buff"] = function(...)
        if mod._is_melee then
            return true
        end
        return false
    end,
    ["psyker_guaranteed_ranged_shot_on_stacked"] = function(buff)
        if mod._is_ranged and buff:stack_count() and buff:stack_count() == 5 then
            return true
        end
        return false
    end
}

local _check_for_guaranteed_crit = function(player_unit)
    if player_unit == nil or player_unit == {} then
        return
    end

    local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
    if buff_extension == nil or buff_extension == {} then
        return
    end

	local buffs = buff_extension:buffs()

	for i = #buffs, 1, -1 do
		local buff_template = buffs[i]:template()

		if guaranteed_crit_buffs[buff_template.name] and guaranteed_crit_buffs[buff_template.name](buffs[i]) == true then
			mod._guaranteed_crit = true

			break
		end

        mod._guaranteed_crit = false
	end
end

local _convert_chance_to_text = function(chance)
    local crit_chance_percent = "NaN"

    local string_crit_chance = tostring(chance * 100)
    local dot_position = string.find(string_crit_chance, "%.")

    local before_dot = 0
    local after_dot = 0

    if dot_position then
        before_dot = tonumber(string.sub(string_crit_chance, 1, dot_position - 1)) or 0
        after_dot = tonumber(string.sub(string_crit_chance, dot_position + 1, dot_position + 2)) or 0
    else
        before_dot = tonumber(string_crit_chance) or 0
    end

    -- "00" converted to nil. Since a player always has >= 1% crit chance, this means 100%.
    if before_dot == nil then
        before_dot = 100
    end

    -- Possible nil for whole % crit chance
    if after_dot == nil then
        after_dot = 0
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

    return crit_chance_percent
end

HudElementCrit.on_resolution_modified = function(self)
	HudElementCrit.super.on_resolution_modified(self)
end

HudElementCrit.init = function(self, parent, draw_layer, start_scale)
	HudElementCrit.super.init(self, parent, draw_layer, start_scale, Definitions)
end

HudElementCrit.destroy = function(self, ui_renderer)
	HudElementCrit.super.destroy(self, ui_renderer)
end

HudElementCrit.update = function(self, dt, t, ui_renderer, render_settings, input_service)
	HudElementCrit.super.update(self, dt, t, ui_renderer, render_settings, input_service)

	-- Sadly, this require needs to be here because of NetworkConstants :(
    -- Seems like a game code issue
    local CriticalStrike = require("scripts/utilities/attack/critical_strike")

    -- Update widget
	local crit_chance_widget = self._widgets_by_name.crit_chance_indicator
    if crit_chance_widget then
        -- Prevent profile:profile() from trying to execute if invalid
        if mod._player.profile == nil or mod._player.profile == {} then
            crit_chance_widget.content.crit_chance_indicator_text = ""
            return
        end

        -- Set visibility
		local visible = true

        if mod._only_in_training_grounds then
			-- Check for Psykhanium
            local game_mode_name = Managers.state.game_mode:game_mode_name()
            visible = game_mode_name == "shooting_range"
		end

		if mod._is_melee == false and mod._is_ranged == false then
			-- We aren't holding any weapon
            visible = false
        end

		crit_chance_widget.style.crit_chance_indicator_text.visible = visible

		if visible then
			-- Calculate crit chance
			_check_for_guaranteed_crit(mod._player.player_unit)

			if mod._guaranteed_crit then
				mod._current_crit_chance = 1.0
			else
				mod._current_crit_chance = CriticalStrike.chance(mod._player, mod._weapon_handling_template, mod._is_ranged, mod._is_melee)
			end

			-- Update indicator text
       		crit_chance_widget.content.crit_chance_indicator_text = _convert_chance_to_text(mod._current_crit_chance)
		end
    end
end

HudElementCrit.set_offset = function(self, vertical, horizontal)
	self._widgets_by_name.crit_chance_indicator.style.crit_chance_indicator_text.offset = {
		Settings.widget_horizontal_offset + horizontal,
		Settings.widget_vertical_offset + vertical,
		0
	}
end

HudElementCrit.set_text_appearance = function(self, appearance)
	self._widgets_by_name.crit_chance_indicator.style.crit_chance_indicator_text.text_color = appearance
end

HudElementCrit.set_font = function(self, type, size)
    self._widgets_by_name.crit_chance_indicator.style.crit_chance_indicator_text.font_type = type
	self._widgets_by_name.crit_chance_indicator.style.crit_chance_indicator_text.font_size = size
end

return HudElementCrit
