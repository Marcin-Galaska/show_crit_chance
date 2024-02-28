-- Show Crit Chance mod by mroużon. Ver. 1.0.7
-- Thanks to Zombine, Redbeardt and others for their input into the community. Their work helped me a lot in the process of creating this mod.

-- Russian translation by xsSplater

return {
	mod_name = {
		en = "Show Crit Chance",
		ru = "Индикатор Шанса Критического Удара",
		pl = "Wskaźnik Szansy Na Trafienie Krytyczne"
	},
	mod_description = {
		en = "Adds an in-game widget showing current critical strike chance.\n\nAuthor: mroużon",
		ru = "Добавляет внутриигровой виджет, показывающий текущий шанс критического удара.\n\nАвтор: mroużon",
		pl = "Dodaje widżet wyświetlający aktualną szansę na trafienie krytyczne.\n\nAutor: mroużon"
	},
	crit_chance_indicator_settings_text = {
		en = "Indicator Text",
		ru = "Текст Индикатора",
		pl = "Tekst Wskaźnika"
	},
	show_floating_point = {
		en = "Show Floating Point",
		ru = "Иоказать Илавающую Точку",
		pl = "Pokaż Wartość Po Przecinku"
	},
	show_floating_point_desc = {
		en = "Represent critical strike chance as a floating point number, not an integer.",
		ru = "Представлять вероятность критического удара как число с плавающей запятой, а не целое число.",
		pl = "Wyświetl szansę na trafienie krytyczne jako liczbę zmiennoprzecinkową, nie całkowitą."
	},
	only_in_training_grounds = {
		en = "Only In Psykhanium",
		ru = "Только в Псайканиуме",
		pl = "Tylko W Psikhanium"
	},
	only_in_training_grounds_desc = {
		en = "Whether the indicator should be only visible in the Psykhanium.",
		ru = "Должен ли индикатор быть виден только в Псайканиуме.",
		pl = "Czy wskaźnik powinien być widoczny tylko w Psikhanium."
	},
	crit_chance_indicator_icon = {
		en = "Crit Chance Icon",
		ru = "Значок Шанса Критического Удара",
		pl = "Ikona Trafienia Krytycznego"
	},
	crit_chance_indicator_icon_desc = {
		en = "Icon shown to the left of the in-game widget.",
		ru = "Значок, показывается слева от внутриигрового виджета.",
		pl = "Ikona wyświetlana po lewej stronie widżetu."
	},
	icon_none = {
		en = "None",
		ru = "Нет",
		pl = "Brak"
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
		pl = "Wygląd Wskaźnika"
	},
	crit_chance_indicator_opacity = {
		en = "Opacity",
		ru = "Прозрачность",
		pl = "Przezroczystość"
	},
	crit_chance_indicator_opacity_desc = {
		en = "Opacity of the critical strike chance indicator on the screen.",
		ru = "Прозрачность индикатора шанса критического удара на экране.",
		pl = "Przezroczystość wskaźnika szansy na trafienie krytyczne na ekranie."
	},
	crit_chance_indicator_R = {
		en = "Red",
		ru = "Красный",
		pl = "Czerwony"
	},
	crit_chance_indicator_R_desc = {
		en = "Intensity of the color red of the critical strike chance indicator on the screen.",
		ru = "Интенсивность Красного цвета индикатора вероятности критического удара на экране.",
		pl = "Intensywność koloru czerwonego we wskaźniku szansy na trafienie krytyczne na ekranie."
	},
	crit_chance_indicator_G = {
		en = "Green",
		ru = "Зелёный",
		pl = "Zielony"
	},
	crit_chance_indicator_G_desc = {
		en = "Intensity of the color green of the critical strike chance indicator on the screen.",
		ru = "Интенсивность Зелёного цвета индикатора вероятности критического удара на экране.",
		pl = "Intensywność koloru zielonego we wskaźniku szansy na trafienie krytyczne na ekranie."
	},
	crit_chance_indicator_B = {
		en = "Blue",
		ru = "Синий",
		pl = "Niebieski"
	},
	crit_chance_indicator_B_desc = {
		en = "Intensity of the color blue of the critical strike chance indicator on the screen.",
		ru = "Интенсивность Синего цвета индикатора вероятности критического удара на экране.",
		pl = "Intensywność koloru niebieskiego we wskaźniku szansy na trafienie krytyczne na ekranie."
	},
	crit_chance_indicator_settings_position = {
		en = "Indicator Position",
		ru = "Положение Индикатора",
		pl = "Pozycja Wskaźnika"
	},
	crit_chance_indicator_vertical_offset = {
		en = "Vertical Offset",
		ru = "Вертикальное Смещение",
		pl = "Przesunięcie Pionowe"
	},
	crit_chance_indicator_vertical_offset_desc = {
		en = "Offset applied to the indicator in the Y axis.",
		ru = "Смещение, применённое к индикатору по оси Y.",
		pl = "Przesunięcie wskaźnika w osi Y."
	},
	crit_chance_indicator_horizontal_offset = {
		en = "Horizontal Offset",
		ru = "Горизонтальное Смещение",
		pl = "Przesunięcie Poziome"
	},
	crit_chance_indicator_horizontal_offset_desc = {
		en = "Offset applied to the indicator in the X axis.",
		ru = "Смещение, применённое к индикатору по оси X.",
		pl = "Przesunięcie wskaźnika w osi X."
	}
}
