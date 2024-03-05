/*
 * 		T4Cine
 *		Entry point
 */

init()
{
    thread scripts\defaults::load_defaults();
    precache::common_precache();
    precache::custom_precache();
    precache::fx_precache();
    thread scripts\utils::match_tweaks();
    thread scripts\utils::lod_tweaks();
    //thread scripts\utils::hud_tweaks();
    thread scripts\utils::score_tweaks();
    thread scripts\utils::bots_tweaks();

    level thread waitForHost();
}

waitForHost()
{
    level waittill( "connecting", player );

    /*
        Bot Check To Ensure They Do Not Run Un-Needed Threads
    */
    thread scripts\utils::hud_tweaks();
    if(!player scripts\utils::is_bot())
    {
        player thread scripts\commands::registerCommands();

        player thread scripts\misc::welcome();
        player thread scripts\ui::await();
        player thread onPlayerSpawned();
    }
}


onPlayerSpawned()
{
    self endon("disconnect");

    self scripts\player::playerRegenAmmo();
    //self thread scripts\misc::class_swap(); - this caused your loading issue frank - need to replace it properly - which ill provide tomorrow :)

    for(;;)
    {
        self waittill("spawned_player");

        // Only stuff that gets reset/removed because of death goes here
        self scripts\player::movementTweaks();
        self scripts\misc::reset_models();
    }
}