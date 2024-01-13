# show_crit_chance
 A Warhammer 40K: Darktide mod that adds an indicator showing the current critikal strike chance.

### Darktide Mod Framework
This mod utilizes DMF, a monkey patching framework for Darktide's Autodesk Stringray engine, and is structured accordingly - a *.mod* file and 3 *.lua* files:
- show_crit_chance.lua - main logic of the modification.

- show_crit_chance_data.lua - in-game configurable variables used in the logic.

- show_crit_chance_localization.lua - localization strings used in UI.

**Make sure you are familiar with the [DMF mod installation procedure](https://dmf-docs.darkti.de/#/installing-mods) before attempting to install or modify this repository.**

### Concept
This highly customizable mod adds a critical strike chance percentage indicator to your HUD. It is updated in real time and accounts for various buffs and blessings.

### Usage
Upon installing this mod, you are ready to go. This mod shows you your critical strike chance in combat, accordingly to the preferences you set inside DMF's mod settings:

![settings](https://github.com/Marcin-Galaska/show_crit_chance/assets/106023363/f4d698f3-a2cf-4357-b62c-ef395ac4d71b)

By default, the indicator is located just below your crosshair:

![combat](https://github.com/Marcin-Galaska/show_crit_chance/assets/106023363/da799744-61a4-408f-bae7-d2b692e83f47)

You can configure the indicator's text, color, opacity and position on the screen to your liking.

## Thanks to Zombine, Redbeardt and others for their input into the Darktide modding community. Their work helped me a lot in the process of creating this mod. The Emperor protects.

### License
BSD 2-Clause License

Copyright (c) 2023, Marcin Gałąska <br>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.
