-- Show Crit Chance mod by mroużon. Ver. 1.1.1
-- Thanks to Zombine, Redbeardt and others for their input into the community. Their work helped me a lot in the process of creating this mod.

local mod = get_mod("show_crit_chance")

local HudElementCritSettings = mod:io_dofile("show_crit_chance/scripts/mods/show_crit_chance/hud/hud_element_crit_settings")

local UIWorkspaceSettings = mod:original_require("scripts/settings/ui/ui_workspace_settings")
local UIWidget = mod:original_require("scripts/managers/ui/ui_widget")

local hud_element_vertical_alignment = HudElementCritSettings.vertical_alignment
local hud_element_horizontal_alignment = HudElementCritSettings.horizontal_alignment

local scenegraph_definition = {
	screen = UIWorkspaceSettings.screen,
	crit_chance_panel = {
		parent = "screen",
		vertical_alignment = hud_element_vertical_alignment,
		horizontal_alignment = hud_element_horizontal_alignment,
		size = HudElementCritSettings.scenegraph_size,
		position = HudElementCritSettings.scenegraph_size
	}
}

local widget_definitions = {
	crit_chance_indicator = UIWidget.create_definition({
		{
			pass_type = "text",
			value_id = "crit_chance_indicator_text",
			style_id = "crit_chance_indicator_text",
			style = {
				font_type = mod._font_type,
				font_size = mod._font_size,
				size = HudElementCritSettings.widget_size,
				offset = {mod._crit_chance_indicator_horizontal_offset, mod._crit_chance_indicator_vertical_offset},
				vertical_alignment = hud_element_vertical_alignment,
				horizontal_alignment = hud_element_horizontal_alignment,
				text_vertical_alignment = hud_element_vertical_alignment,
				text_horizontal_alignment = hud_element_horizontal_alignment,
				text_color = mod._crit_chance_indicator_appearance
			},
			dirty = true
		}
	}, "crit_chance_panel")
}

return {
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition
}