// Misc
[x]    clone -- works, just doesnt attach weapon
[]    givecamo - no camos in t4, maybe something in the future???
[x]    drop 
[]    about -- can create a simple about message thread, but something on the screen would be nice
[x]    clearbodies -- works as intended
[]    viewhands
[x]    eb_explosive -- works as intended
[x]    eb_magic

[]    spawn_model - can spawn script models, cant spawn anims on said scriptmodels
[]    spawn_fx
[x]    vision -- works as intended
[x]    fog -- done, but once you set a fog, thats it, cant change it.
[]      change class

// Bots -- select_ents func is being weird, this whole section will take awhile
[]    bot_spawn
[]    bot_move
[]    bot_aim
[]    bot_stare
[]    bot_model
[]    bot_kill
[]    bot_holdgun
[]    bot_freeze

Updates 2.26.24 - 12AM
    - Antiga

- We need to remove many things/adjust class names, wep names, akimbo checks, etc - will do tomorrow.
- WAW is weird with how it handles non threaded functions, in most cases, it is safe to add threads IE: scripts\utils::skip_prematch(); would be thread scripts\utils::skip_prematch();
    - Found that this can cause threads to not load properly, so please use this moving forward.
- I also made some movement changes (around method placement for performance improvements "loading time") IE: level waittill("prematch_over");
- Removed replaceFunc items since it does NOT exist and requires a custom DLL to be built for waw.
- Added .gitignore and made sure certain items weren't part of the project.
- Fixed loading lag/delay even with developer 2 enabled.
- Added some comments around code :D.