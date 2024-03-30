# <p style="text-align: center;">**T4CINE FEATURES AND ROADMAP**</p>

**MISC FUNCTIONS**
    
    - [x]     clone         -- <set to 1>
    - [x]     givecamo      -- <weapon_mp>
    - [x]     drop          -- <set to 1>
    - [x]     about         -- <set to 1>
    - [x]     clearbodies   -- <set to 1>
    - [x]     viewhands     -- <set to 1>
    - [x]     eb_explosive  -- <radius>
    - [x]     eb_magic      -- <degrees>

**VISUAL FUNCTIONS**

    - [x]    spawn_model    -- <model_name>
    - [ ]    spawn_fx       -- <fx_name>
    - [x]    vision         -- <vision>
    - [x]    fog            -- <start end red green blue transition>

**BOT FUNCTIONS**

    - [x]    spawn          -- <weapon_mp> <axis/allies>
    - [x]    move           -- <bot_name>
    - [x]    aim            -- <bot_name>
    - [x]    stare          -- <bot_name>
    - [x]    model          -- <bot_name> <MODEL> <axis/allies>
    - [x]    kill           -- <bot_name> <body/head/cash>
    - [x]    holdgun        -- <set to 1>
    - [x]    freeze         -- <set to 1>

<br/><br/>
**PLANNED FEATURES**

    - [ ]    Implementation of Bot Warfare mod for T4 Plutonium.



















<br/><br/>
<br/><br/>
<br/><br/>
### Antiga 2.26.24 - 12AM

- We need to remove many things/adjust class names, wep names, akimbo checks, etc - will do tomorrow.
- WAW is weird with how it handles non threaded functions, in most cases, it is safe to add threads IE: scripts\utils::skip_prematch(); would be thread scripts\utils::skip_prematch();
    - Found that this can cause threads to not load properly, so please use this moving forward.
- I also made some movement changes (around method placement for performance improvements "loading time") IE: level waittill("prematch_over");
- Removed replaceFunc items since it does NOT exist and requires a custom DLL to be built for waw.
- Added .gitignore and made sure certain items weren't part of the project.
- Fixed loading lag/delay even with developer 2 enabled.
- Added some comments around code :D.

### Forgive 3.2.24 - 9PM
- Fixed bot functions by adding "for ( i = 0; i < level.players.size; i++ )"
    - Probably a better way to do this in the future.
- Added a default to implement bot warfare for plutonium in the future.
- REM maths.gsc
- Started writing an about message, might dump for old one.
- Enabled precache.
- Verified viewmodel and score functions work.
- REM:
    - utils::camo_int // No camos in T4.

- Need to fix:
    - ~~misc::class_swap // Broken atm.~~
    - misc::toggle_holding // Gotta do sum with this at some point.
    - misc::change_fog // Currently broken. Works, but cant change to another once one is set.
    - misc::about // Got close to what I wanted but not perfect... Text doesnt disappear on weapon change.

- 
    - utils::hud_tweaks // gTeamName dvars dont set.

### Antiga 3.4.24 - 11AM
- Fixed about menu text + text destroy | remember, treyarch is weird ;(.
- Added _globallogic to allow for level.PLAYER_CLASS_CHANGE to influence whether class changing is allowed or not.
- Test fog command again - added reset fog command too.

### Forgive 3.6.24 - 12AM
Need to fix:
- toggle_holding // Gotta do sum with this at some point.
- trying to skip prematch!!! -- update: got prematch to skip but welcome message wont show now. might just set prematch to like 2 or sum...

[+] level.MATCH_KILL_MESSAGE - hides the "you killed" message in the middle of the screen. // need help with this, doesnt work all the time. needs testing...

Fixed:
- VISUAL_HUD, switched from scr_gameended to ui_hud_hardcore dvars.

### Forgive 3.10.24 -10PM
- Please use new legend:
- [+] Added.
- [-] Removed.
- [~] Needs to be fixed.

### Antiga 3.11.24 - 9AM
- [🗸] Prematch has been fully fixed/removed -> Check _globallogic for more information.
- [🗸] Hardcore hud controlled via VISUAL_HUD has been resolved -> Check _globallogic for more information. 
- [+] Added class argument to mvm_bot_spawn - now uses mvm_bot_spawn weapon team model (EXAMPLE: SNIPER_MP).
- [🗸] Spawn message no longer doubles, changed it to only happen once at spawn.
- [🗸] Fixed double spawning bots, this requires a thread.
- [+] Added level.INGAME_MUSIC - if set to false, it will disable the ingame music + announcers.

#### Changelog

- [+] README

- [+] Added _weapons.gsc to include "hooks"... Ref scripts\hooks.gsc

- [+] Added _globallogic.gsc to include "hooks"... Ref scripts\hooks.gsc

- [🗸] Fixed weapons dropping with attached "fake weapon" for now.

- [~] Holding functions, needs a better system.
