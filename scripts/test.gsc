init()
{
   level thread connect();
}

connect()
{
    for (;;)
	{
		level waittill("connected", player);
        player thread test();
    }
}

test()
{
    self endon("death");
    self endon("disconnect");

    for(;;)
    {
        self waittill("spawned_player");
        self iPrintLn("test");
    }
}