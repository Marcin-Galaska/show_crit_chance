return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`show_crit_chance` encountered an error loading the Darktide Mod Framework.")

		new_mod("show_crit_chance", {
			mod_script       = "show_crit_chance/scripts/mods/show_crit_chance/show_crit_chance",
			mod_data         = "show_crit_chance/scripts/mods/show_crit_chance/show_crit_chance_data",
			mod_localization = "show_crit_chance/scripts/mods/show_crit_chance/show_crit_chance_localization",
		})
	end,
	packages = {},
}
