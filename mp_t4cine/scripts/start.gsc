/*
 * 		T4Cine
 *		Entry point
 */

init()
{
    scripts\defaults::load_defaults();
    scripts\precache::common_precache();
    scripts\precache::custom_precache();
    scripts\precache::fx_precache();

    level thread waitForHost();
}

waitForHost()
{
    level waittill( "connecting", player );

    scripts\utils::skip_prematch();
    scripts\utils::match_tweaks();
    scripts\utils::lod_tweaks();
    scripts\utils::hud_tweaks();
    scripts\utils::score_tweaks();
    scripts\utils::bots_tweaks();
    player thread scripts\ui::await();
    player thread scripts\commands::registerCommands();
    player thread onPlayerSpawned();
}


onPlayerSpawned()
{
    self endon("disconnect");

    self scripts\player::playerRegenAmmo();

    for(;;)
    {
        self waittill("spawned_player");

        // Only stuff that gets reset/removed because of death goes here
        self scripts\player::movementTweaks();
        self scripts\misc::reset_models();
        if(!self.isdone)
            self scripts\misc::welcome();
    }
}