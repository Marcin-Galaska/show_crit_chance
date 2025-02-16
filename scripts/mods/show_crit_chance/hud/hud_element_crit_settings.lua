-- Show Crit Chance mod by mroużon. Ver. 1.1
-- Thanks to Zombine, Redbeardt and others for their input into the community. Their work helped me a lot in the process of creating this mod.

local hud_element_crit_settings = {
	vertical_alignment = "center",
	horizontal_alignment = "center",
	scenegraph_size = {100, 100},
	scenegraph_position = {0, 0, 0},
	widget_size = {400, 100},
	widget_vertical_offset = 0,
	widget_horizontal_offset = -100
}

return settings("HudElementCritSettings", hud_element_crit_settings)