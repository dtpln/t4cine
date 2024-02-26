/*
 *      T4Cine
 *      Commands handler
 */

#include scripts\utils;


registerCommands()
{
    level endon( "disconnect" );

    // Misc
    self thread createCommand( "clone",         "Create a clone of yourself",           " ",                            scripts\misc::clone, false );
    self thread createCommand( "drop",          "Drop your current weapon",             " ",                            scripts\misc::drop, false );
    self thread createCommand( "about",         "About the mod",                        " ",                            scripts\misc::about, false );
    self thread createCommand( "clearbodies",   "Remove all player/bot corpses",        " ",                            scripts\misc::clear_bodies, false );
    self thread createCommand( "viewhands",     "Change your viewmodel",                " <model_name>",                scripts\misc::viewhands, false );
    self thread createCommand( "eb_explosive",  "Explosion radius on bullet impact",    " <radius>",                    scripts\misc::expl_bullets, false );
    self thread createCommand( "eb_magic",      "Kill bots within defined FOV value",   " <degrees>",                   scripts\misc::magc_bullets, false );

    //self thread createCommand( "spawn_model",   "Spawn model at your position",         " <model_name>",                            scripts\misc::spawn_model );
    self thread createCommand( "spawn_fx",      "Spawn FX at your xhair",               " <fx_name>",                               scripts\misc::spawn_fx );
    self thread createCommand( "vision",        "Change vision, reset on death",        " <vision>",                                scripts\misc::change_vision );
    self thread createCommand( "fog",           "Change ambient fog",                   " <start> <half> <r> <g> <b> <a> <time>",   scripts\misc::change_fog );

    // Bots
    self thread createCommand( "bot_spawn",     "Add a bot",                            " <weapon_mp> <axis/allies> <camo_name>",   scripts\bots::add );
    self thread createCommand( "bot_move",      "Move bot to xhair",                    " <bot_name>",                              scripts\bots::move );
    self thread createCommand( "bot_aim",       "Make bot look at closest enemy",       " <bot_name>",                              scripts\bots::aim );
    self thread createCommand( "bot_stare",     "Make bot stare at closest enemy",      " <bot_name>",                              scripts\bots::stare );
    self thread createCommand( "bot_model",     "Swap bot model",                       " <bot_name> <MODEL> <axis/allies>",        scripts\bots::model );
    self thread createCommand( "bot_kill",      "Kill bot",                             " <bot_name> <body/head/cash>",             scripts\bots::kill );
    self thread createCommand( "bot_holdgun",   "Toggle bots holding guns when dying",  " ",                                        scripts\misc::toggle_holding );
    self thread createCommand( "bot_freeze",    "(Un)freeze bots",                      " ",                                        scripts\misc::toggle_freeze );
}

createCommand( command, desc, usage, callback, use_prefix )
{
    self endon( "disconnect" );

    prefix = "";
    if(!sDefined(use_prefix))
    {
        prefix = level.COMMAND_PREFIX + "_";
        setDvar( prefix + command, desc );
    }
    else
        setDvar( command, desc );

    for (;;)
    {
        if(!isDefined(use_prefix))
        {
            if(getDvar(prefix + command) != desc)
            {
                args = StrTok( getDvar( prefix + command ), " " );
                if ( args[0] == "help" ) 
                {
                    iPrintLn( "Usage: " + prefix + command + usage );
                    continue;
                }
                if ( args.size >= 1 )
                    self [[callback]]( args );
                else
                    self [[callback]]();
            }
        }
        else
        {
            if(getDvar(command) != desc)
            {
                args = StrTok( getDvar( command ), " " );
                if ( args[0] == "help" ) 
                {
                    iPrintLn( "Usage: " + command + " " + usage );
                    continue;
                }
                if ( args.size >= 1 )
                    self [[callback]]( args );
                else
                    self [[callback]]();
            }            
        }

        if(!isDefined(use_prefix))
        {
            prefix = level.COMMAND_PREFIX + "_";
            setDvar( prefix + command, desc );
        }
        else
            setDvar( command, desc );

        wait 0.05;
    }
}