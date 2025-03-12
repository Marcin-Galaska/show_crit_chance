-- Show Crit Chance mod by mroużon. Ver. 1.1.1
-- Thanks to Zombine, Redbeardt and others for their input into the community. Their work helped me a lot in the process of creating this mod.

local mod = get_mod("show_crit_chance")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id  = "crit_chance_indicator_settings_text",
				type        = "group",
				sub_widgets = {
					{
						setting_id = "font_type",
						tooltip = "font_type_desc",
						type = "dropdown",
						default_value = "proxima_nova_bold",
						options = {
							{text = "font_machine_medium", value = "machine_medium", show_widgets = {}},
							{text = "font_proxima_nova_medium", value = "proxima_nova_medium", show_widgets = {}},
							{text = "font_proxima_nova_bold", value = "proxima_nova_bold", show_widgets = {}},
							{text = "font_itc_novarese_medium", value = "itc_novarese_medium", show_widgets = {}},
							{text = "font_itc_novarese_bold", value = "itc_novarese_bold", show_widgets = {}},
						}
					},
					{
						setting_id = "font_size",
						tooltip = "font_size_desc",
						type = "numeric",
						default_value = 24,
						range = {10, 90}
					},
					{
						setting_id = "show_floating_point",
						tooltip = "show_floating_point_desc",
						type = "checkbox",
						default_value = true
					},
					{
						setting_id = "only_in_training_grounds",
						tooltip = "only_in_training_grounds_desc",
						type = "checkbox",
						default_value = false
					},
					{
						setting_id = "crit_chance_indicator_icon",
						tooltip = "crit_chance_indicator_icon_desc",
						type = "dropdown",
						default_value = 3,
						options = {
							{text = "icon_none", value = 1, show_widgets = {}},
							{text = "icon_skull", value = 2, show_widgets = {}},
							{text = "icon_dagger", value = 3, show_widgets = {}},
							{text = "icon_thunderbolt", value = 4, show_widgets = {}},
							{text = "icon_darktide", value = 5, show_widgets = {}},
							{text = "icon_laurels", value = 6, show_widgets = {}}
						}
					}
				}
			},
			{
				setting_id  = "crit_chance_indicator_settings_appearance",
				type        = "group",
				sub_widgets = {
					{
						setting_id = "crit_chance_indicator_opacity",
						tooltip = "crit_chance_indicator_opacity_desc",
						type = "numeric",
						default_value = 200,
						range = {0, 255}
					},
					{
						setting_id = "crit_chance_indicator_R",
						tooltip = "crit_chance_indicator_R_desc",
						type = "numeric",
						default_value = 255,
						range = {0, 255}
					},
					{
						setting_id = "crit_chance_indicator_G",
						tooltip = "crit_chance_indicator_G_desc",
						type = "numeric",
						default_value = 100,
						range = {0, 255}
					},
					{
						setting_id = "crit_chance_indicator_B",
						tooltip = "crit_chance_indicator_B_desc",
						type = "numeric",
						default_value = 70,
						range = {0, 255}
					},
				}
			},
			{
				setting_id  = "crit_chance_indicator_settings_position",
				type        = "group",
				sub_widgets = {
					{
						setting_id = "crit_chance_indicator_vertical_offset",
						tooltip = "crit_chance_indicator_vertical_offset_desc",
						type = "numeric",
						default_value = 0,
						range = {-450, 600}
					},
					{
						setting_id = "crit_chance_indicator_horizontal_offset",
						tooltip = "crit_chance_indicator_horizontal_offset_desc",
						type = "numeric",
						default_value = 0,
						range = {-900, 900}
					}
				}
			}
		}
	}
}
