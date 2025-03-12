-- Show Crit Chance mod by mroużon. Ver. 1.1.1
-- Thanks to Zombine, Redbeardt and others for their input into the community. Their work helped me a lot in the process of creating this mod.

-- Russian translation by xsSplater
-- Chinese translation by deluxghost

return {
	mod_name = {
		en = "Show Crit Chance",
		ru = "Индикатор Шанса Критического Удара",
		pl = "Wskaźnik Szansy Na Trafienie Krytyczne",
		["zh-cn"] = "显示暴击率",
	},
	mod_description = {
		en = "Adds an in-game widget showing current critical strike chance.\n\nAuthor: mroużon",
		ru = "Добавляет внутриигровой виджет, показывающий текущий шанс критического удара.\n\nАвтор: mroużon",
		pl = "Dodaje widżet wyświetlający aktualną szansę na trafienie krytyczne.\n\nAutor: mroużon",
		["zh-cn"] = "添加一个游戏内组件，显示当前的暴击率。\n\n作者：mroużon",
	},
	crit_chance_indicator_settings_text = {
		en = "Indicator Text",
		ru = "Текст Индикатора",
		pl = "Tekst Wskaźnika",
		["zh-cn"] = "指示器文本",
	},
	font_type = {
		en = "Font",
		ru = "Шрифт",
		pl = "Font",
		["zh-cn"] = "字体",
	},
	font_type_desc = {
		en = "Font of the indicator's text.",
		ru = "Шрифт текста индикатора.",
		pl = "Font tekstu wskaźnika.",
		["zh-cn"] = "指示器文本的字体。",
	},
	font_machine_medium = {
		en = "Machine Medium",
		ru = "Machine Medium",
		pl = "Machine Medium",
		["zh-cn"] = "Machine Medium"
	},
	font_proxima_nova_medium = {
		en = "Proxima Nova Medium",
		ru = "Proxima Nova Medium",
		pl = "Proxima Nova Medium",
		["zh-cn"] = "Proxima Nova Medium",
	},
	font_proxima_nova_bold = {
		en = "Proxima Nova Bold",
		ru = "Proxima Nova Bold",
		pl = "Proxima Nova Bold",
		["zh-cn"] = "Proxima Nova Bold",
	},
	font_itc_novarese_medium = {
		en = "ITC Novarese Medium",
		ru = "ITC Novarese Medium",
		pl = "ITC Novarese Medium",
		["zh-cn"] = "ITC Novarese Medium"
	},
	font_itc_novarese_bold = {
		en = "ITC Novarese Bold",
		ru = "ITC Novarese Bold",
		pl = "ITC Novarese Bold",
		["zh-cn"] = "ITC Novarese Bold"
	},
	font_size = {
		en = "Font Size",
		ru = "Размер шрифта",
		pl = "Rozmiar fontu",
		["zh-cn"] = "字体大小",
	},
	font_size_desc = {
		en = "Size of the indicator's font.",
		ru = "Размер шрифта индикатора.",
		pl = "Rozmiar fontu wskaźnika.",
		["zh-cn"] = "指示器字体的大小。",
	},
	show_floating_point = {
		en = "Show Floating Point",
		ru = "Иоказать Илавающую Точку",
		pl = "Pokaż Wartość Po Przecinku",
		["zh-cn"] = "显示小数",
	},
	show_floating_point_desc = {
		en = "Represent critical strike chance as a floating point number, not an integer.",
		ru = "Представлять вероятность критического удара как число с плавающей запятой, а не целое число.",
		pl = "Wyświetl szansę na trafienie krytyczne jako liczbę zmiennoprzecinkową, nie całkowitą.",
		["zh-cn"] = "以浮点数而非整数形式表示暴击率。",
	},
	only_in_training_grounds = {
		en = "Only In Psykhanium",
		ru = "Только в Псайканиуме",
		pl = "Tylko W Psikhanium",
		["zh-cn"] = "仅在灵能室",
	},
	only_in_training_grounds_desc = {
		en = "Whether the indicator should be only visible in the Psykhanium.",
		ru = "Должен ли индикатор быть виден только в Псайканиуме.",
		pl = "Czy wskaźnik powinien być widoczny tylko w Psikhanium.",
		["zh-cn"] = "指示器是否应该仅在灵能室内可见。",
	},
	crit_chance_indicator_icon = {
		en = "Crit Chance Icon",
		ru = "Значок Шанса Критического Удара",
		pl = "Ikona Trafienia Krytycznego",
		["zh-cn"] = "暴击率图标",
	},
	crit_chance_indicator_icon_desc = {
		en = "Icon shown to the left of the in-game widget.",
		ru = "Значок, показывается слева от внутриигрового виджета.",
		pl = "Ikona wyświetlana po lewej stronie widżetu.",
		["zh-cn"] = "在游戏内组件左侧显示的图标。",
	},
	icon_none = {
		en = "None",
		ru = "Нет",
		pl = "Brak",
		["zh-cn"] = "无",
	},
	icon_skull = {
		en = "",
	},
	icon_dagger = {
		en = "",
	},
	icon_thunderbolt = {
		en = "",
	},
	icon_darktide = {
		en = "",
	},
	icon_laurels = {
		en = "",
	},
	crit_chance_indicator_settings_appearance = {
		en = "Indicator Appearance",
		ru = "Внешний Вид Индикатора",
		pl = "Wygląd Wskaźnika",
		["zh-cn"] = "指示器外观",
	},
	crit_chance_indicator_opacity = {
		en = "Opacity",
		ru = "Прозрачность",
		pl = "Przezroczystość",
		["zh-cn"] = "不透明度",
	},
	crit_chance_indicator_opacity_desc = {
		en = "Opacity of the critical strike chance indicator on the screen.",
		ru = "Прозрачность индикатора шанса критического удара на экране.",
		pl = "Przezroczystość wskaźnika szansy na trafienie krytyczne na ekranie.",
		["zh-cn"] = "屏幕上暴击率指示器的不透明度。",
	},
	crit_chance_indicator_R = {
		en = "Red",
		ru = "Красный",
		pl = "Czerwony",
		["zh-cn"] = "红色",
	},
	crit_chance_indicator_R_desc = {
		en = "Intensity of the color red of the critical strike chance indicator on the screen.",
		ru = "Интенсивность Красного цвета индикатора вероятности критического удара на экране.",
		pl = "Intensywność koloru czerwonego we wskaźniku szansy na trafienie krytyczne na ekranie.",
		["zh-cn"] = "屏幕上暴击率指示器的红色强度。",
	},
	crit_chance_indicator_G = {
		en = "Green",
		ru = "Зелёный",
		pl = "Zielony",
		["zh-cn"] = "绿色",
	},
	crit_chance_indicator_G_desc = {
		en = "Intensity of the color green of the critical strike chance indicator on the screen.",
		ru = "Интенсивность Зелёного цвета индикатора вероятности критического удара на экране.",
		pl = "Intensywność koloru zielonego we wskaźniku szansy na trafienie krytyczne na ekranie.",
		["zh-cn"] = "屏幕上暴击率指示器的绿色强度。",
	},
	crit_chance_indicator_B = {
		en = "Blue",
		ru = "Синий",
		pl = "Niebieski",
		["zh-cn"] = "蓝色",
	},
	crit_chance_indicator_B_desc = {
		en = "Intensity of the color blue of the critical strike chance indicator on the screen.",
		ru = "Интенсивность Синего цвета индикатора вероятности критического удара на экране.",
		pl = "Intensywność koloru niebieskiego we wskaźniku szansy na trafienie krytyczne na ekranie.",
		["zh-cn"] = "屏幕上暴击率指示器的蓝色强度。",
	},
	crit_chance_indicator_settings_position = {
		en = "Indicator Position",
		ru = "Положение Индикатора",
		pl = "Pozycja Wskaźnika",
		["zh-cn"] = "指示器位置",
	},
	crit_chance_indicator_vertical_offset = {
		en = "Vertical Offset",
		ru = "Вертикальное Смещение",
		pl = "Przesunięcie Pionowe",
		["zh-cn"] = "垂直偏移量",
	},
	crit_chance_indicator_vertical_offset_desc = {
		en = "Offset applied to the indicator in the Y axis.",
		ru = "Смещение, применённое к индикатору по оси Y.",
		pl = "Przesunięcie wskaźnika w osi Y.",
		["zh-cn"] = "指示器在 Y 轴方向的偏移量。",
	},
	crit_chance_indicator_horizontal_offset = {
		en = "Horizontal Offset",
		ru = "Горизонтальное Смещение",
		pl = "Przesunięcie Poziome",
		["zh-cn"] = "水平偏移量",
	},
	crit_chance_indicator_horizontal_offset_desc = {
		en = "Offset applied to the indicator in the X axis.",
		ru = "Смещение, применённое к индикатору по оси X.",
		pl = "Przesunięcie wskaźnika w osi X.",
		["zh-cn"] = "指示器在 X 轴方向的偏移量。",
	}
}
