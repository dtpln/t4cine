<img src="AWAITING HEADER IMAGE...">

# *T4Cine*

### 🎥 A features-rich cinematic mod for Call of Duty®: World at War®

<img src="https://img.shields.io/badge/REWRITE%20IN%20PROGRESS-f68d3d?style=flat-square">　<a href="https://github.com/datapIan/t4cine/releases"><img src="https://img.shields.io/github/v/release/datapIan/t4cine?label=Latest%20release&style=flat-square&color=f68d3d"></a>　<a href="https://discord.gg/wgRJDJJ"><img src="https://img.shields.io/discord/617736623412740146?label=Join%20the%20IW4Cine%20Discord!&style=flat-square&color=f68d3d"></a>  
<br/><br/>

**PLEASE NOTE**: As the original mod is in a WIP phase, so will this port be..

This is a port of [Sass' Cinematic Mod](https://github.com/sortileges/iw4cine) for **Call of Duty®: World at War®**.

Designed for video editors to create cinematics shots on **Call of Duty®: World at War®**.


This mod creates new dvars combined as player commands. They are all associated to script functions that are triggered when the dvar doesn't equal it's default value, meaning these functions will all independently stay idle until they get notified to go ahead.

This mod was also designed as a Multiplayer mod only. It will not work in Singleplayer or Zombies.


<br/><br/>
## Requirements

In order to use the latest version of this mod directly from the repo, you'll need a copy of **Call of Duty®: World at War®** with or without **[Plutonium](https://plutonium.pw)** installed. This mod was built on the Steam version of World at War, meaning it will work on both.

<br/><br/>
## Installation

Simply download the mod through [this link](https://github.com/datapIan/t4cine/releases/latest). Scroll down and click on "Source code (zip)" to download the archive.

<img src="https://i.imgur.com/DvQBhh0.png" alt="screenshot" height="265px" align="right"/>

Once the mod is downloaded, open the ZIP file and drag the "mp_t4cine" folder into your `WAW/mods` folder. If the `mods` folder doesn't exist, create it. (*You can also rename the mod if you'd like, but keep the mp_ prefix.*)

<br/>

```text
X:/
└── .../
    └── World at War/
        └── mods/
            └── mp_t4cine
```
- Plutonium full path: `%localappdata%\Plutonium\storage\t4`
- Steam full path: `%localappdata%\Activision\CoDWaW`

Then, open your game, and click on the "Mods" tab; "mp_t4cine" should appear in the list. Click on it once and then click on "Launch" to restart your game with the mod on.

You can also create a shortcut of your client's executable and add the following parameter to the target line : `+set fs_game "mods/Cinematic Mod"`. This will automatically launch the mod when you open the game.

Alternatively, you can edit the included `.bat` file to run the game with the mod loaded automatically for Plutonium.

<br/><br/>
## How to use

The link below contains a HTML file that explains every command from the [latest release](https://github.com/sortileges/iw4cine/releases/latest) in details. The HTML file will open a new browser tab when you click on it. 
- **[sortileges.github.io/iw4cine/help](https://sortileges.github.io/iw4cine/help)**.

**It is not up-to-date with what's in the master branch,** although everything should still work as intended. Just don't be surprised if something is missing or not working as expected!

Once [Sass](https://github.com/sortileges) finishes the mod's rewrite, the HTML file will be updated accordingly.


<br/><br/>
## Known Issues
- [~] SkipPrematch - Needs better fix rather than lowering grace period time.

- [~] Holding functions, needs a better system.

- [~] VISUAL_HUD, doesnt set by default. Oh well...

- [BOT_SPAWN] -- Spawned bots will default to the GHILLIE model. Werid...

<br/><br/>
## Credits
- **Sass** - Created the original IW4Cine mod. All the code was written by him, I just edited it to work on WAW.
- **Antiga** - Helped rewrite the mod and fix things that I couldn't.
