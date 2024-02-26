/*
 *      T4Cine
 *      Miscellaneous functions
 */

#include maps\mp\_utility;
#include common_scripts\utility;
#include scripts\utils;
#include maps\mp\gametypes\_class;

clone()
{
    self ClonePlayer(1);
}

drop()
{
    self endon( "disconnect" );
    self endon( "death" );
    self dropItem( self getCurrentWeapon() );
}

class_swap()
{
    self endon("disconnect");

    old_class = self.pers["class"];
    for(;;)
    {
        if( self.pers["class"] != old_class )
        {
            self maps\mp\gametypes\_class::giveloadout( self.pers["team"], self.pers["class"] );
            self scripts\player::movementTweaks();
            self scripts\misc::reset_models();
            old_class = self.pers["class"];
        }
        waitframe();
    }
}

// As for as equipment goes, going from a lethal that doesn't depend --
// -- on scripts to one that does will not work. (e.g TK to Claymore)
// Not gonna bother because I highly doubt anybody does that anyway.
/*give( args )
{
    weapon  = args[0];
    camo    = defaultcase( isDefined( args[1] ), args[1], 0 );

    if ( isValidEquipment( weapon ) )
    {
        if ( isValidOffhand( weapon ) )
        {
            print( "Changing tactical to " + weapon );
            self take_offhands_tac();
            waitsec();
            self setOffhandSecondaryClass( get_offhand_name( weapon ) );
        }
        else 
        {
            print( "Changing lethal to " + weapon );
            self take_offhands_leth();
            waitsec();
            self SetOffhandPrimaryClass( get_offhand_name( weapon ) );
        }
        //self maps\mp\perks\_perks::givePerk( get_offhand_name( weapon ) );
        self giveWeapon( weapon );
    }
    else if ( isValidWeapon( weapon ) )
    {
        self dropItem( self getCurrentWeapon() );
        skipframe();

        self giveWeapon( weapon, camo_int( camo ), is_akimbo( weapon ) );

        self switchToWeapon( weapon );
    }
    else print( "wtf is a '" + weapon  + "'??");
}*/

clear_bodies()
{
    for (i = 0; i < 15; i++)
    {
        clone = self ClonePlayer(1);
        clone delete();
        skipframe();
    }
}

expl_bullets()
{
    for(;;)
    {
        self waittill( "weapon_fired" );
        if( GetDvarInt("eb_explosive") > 0 ) RadiusDamage( at_crosshair( self ), GetDvarInt("eb_explosive"), 800, 800, self );
    }
}

magc_bullets()
{
    for(;;)
    {
        player = self;
        self waittill("weapon_fired");
        for ( i = 0; i < level.players.size; i++ )
        {
            if ( inside_fov( self, player, GetDvarInt("eb_magic") ) && player != self )
                player thread [[level.callbackPlayerDamage]]( self, self, self.health, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "torso_upper", 0 );
        }
    }
}

viewhands( args )
{
    self iPrintLn( "[" + level.HIGHLIGHT_COLOR + "T4Cine^7]Setting viewmodel to " + args[0] );
    self setViewmodel( args[0] );
    self.pers["viewmodel"] = args[0];
}

reset_models()
{
    if( isdefined ( self.pers["fakeModel"] ) && self.pers["fakeModel"] != false ) {
        skipframe();
        self detachAll();
        self [[game[self.pers["fakeTeam"] + "_model"][self.pers["fakeModel"]]]]();
    }

    if( isdefined ( self.pers["viewmodel"] ) )
        self setViewmodel( self.pers["viewmodel"] );
}

// Toggles
toggle_holding()
{
    /*level.BOT_WEAPHOLD ^= 1;
    self iPrintLn( "[" + level.HIGHLIGHT_COLOR + "T4Cine^7]Holding weapons on death: " + bool(level.BOT_WEAPHOLD) );

    if( !level.BOT_WEAPHOLD ) 
    {
        for ( i = 0; i < level.players.size; i++ )
            //player.replica delete();
    }*/
}

toggle_freeze()
{
    level.BOT_MOVE ^= 1;
    bots_tweaks();
    self iPrintLn( "[" + level.HIGHLIGHT_COLOR + "T4Cine^7]Frozen bots: " + bool(level.BOT_SPAWN_MOVE) );
}


// Spawners
spawn_model( args )
{
    /*model = args[0];
    anima = args[1];
    prop = spawn( "script_model", self.origin );
    prop.angles = ( 0, self.angles[1], 0);
    prop setModel( model );

    if( isDefined( anima ) )
        //prop scriptModelPlayAnim(anima);

    self iPrintLn( "[" + level.HIGHLIGHT_COLOR + "T4Cine^7]Spawned model " + model );*/
}

spawn_fx( args )
{
    fx = args[0];
    level._effect[fx] = loadfx( fx );
    playFX( level._effect[fx], at_crosshair( self ) );
}

// Fog and Vision
change_vision( args )
{
    vision = args[0];
    VisionSetNaked( vision );
    self iPrintLn( "[" + level.HIGHLIGHT_COLOR + "T4Cine^7]Vision changed to : " + vision);
}

change_fog( args )
{
    start       = int(args[0]);
    end         = int(args[1]);
    red         = int(args[2]);
    green       = int(args[3]);
    blue        = int(args[4]);
    transition  = int(args[5]);
    //SetExpFog( <startDist>, <halfwayDist>, <red>, <green>, <blue>, <transition time> );
    setExpFog(start, end, red, green, blue, transition);
    wait 0.5;
}


welcome()
{
    self endon( "disconnect" );
    level waittill("prematch_over");
    self freezeControls( false );
    level.prematchPeriodEnd = -1;
	self IPrintLn("Welcome to ^3Sass' Cinematic Mod");
    self IPrintLn("Ported to WAW by ^3Forgive & Antiga");
	self IPrintLn("Type ^3/about 1 ^7for more info");
	self.donefirst = 1;
}

about()
{
    //self giveWeapon( "artillery_mp" );
	//self SwitchToWeapon( "artillery_mp" );
    //while(self getCurrentWeapon() != "killstreak_predator_missile_mp")
        waitframe();

    wait 0.55;
    /*
    //self setBlurForPlayer( 15, 0.5 );
    self VisionSetNakedForPlayer( "mpintro", 0.4 );

    text = [];
    text[0] = elem( -50, 0.8, "hudbig",     "^3IW4cine - #400", 30);
    text[1] = elem( -33, 1,   "default",    "2015 - 2023", 30 );
    text[2] = elem( -9,  1.1, "small",      "^3Immensely and forever thankful for :", 20 );
    text[3] = elem( 7.5, 1.3, "default",    "Zura, luckyy, CoDTV MM Team, kruumy", 15 );
    text[4] = elem( 25,  1.23,"default",    "case, Ozzie, LASKO, Jayy, simon, the whole sm2 squad", 11 );
    text[5] = elem( 41,  1,   "default",    "The Ody Island, forgive, expert, JTAG, NOOB TEAM, 3500, PUNK, Openminded, and kilos of SSRIs", 9 );
    text[6] = elem( 170, 0.5, "smallfixed", "Press ^3[{weapnext}]^7 to close", 20 );

    self waittill_any( "weapon_switch_started" ,"weapon_fired", "death");
    
    //foreach( t in text ) t SetPulseFX( 0, 0, 150 );

    //self switchToWeapon( self getLastWeapon() );
    //self setBlurForPlayer( 0, 0.35 );
    self VisionSetNakedForPlayer( getDvar( "mapname" ), 0.5 );

    waitsec();
    //self TakeWeapon( "killstreak_predator_missile_mp" );
    //foreach( t in text ) t destroy();*/
}

elem( offset, size, font, text, pulse )
{
    elem = newClientHudElem( self );
    elem.horzAlign = "center";
    elem.vertAlign = "middle";
    elem.alignX = "center";
    elem.alignY = "middle";
    elem.y = offset;
    elem.font = font;
    elem.fontscale = size;
    elem.alpha = 1;
    elem.color = (1,1,1);
    elem setText( text );
    elem SetPulseFX( pulse, 900000000, 9000 );
    return elem;
}