local EventItem = { CItem:new(3183), CItem:new(3184), CItem:new(3185), CItem:new(3186), CItem:new(3187), CItem:new(3188), CItem:new(3189), CItem:new(3190) };
local Env = { EnvironmentEvent:new( ), EnvironmentEvent:new( ), EnvironmentEvent:new( ), EnvironmentEvent:new( ), EnvironmentEvent:new( ), EnvironmentEvent:new( ), EnvironmentEvent:new( ), EnvironmentEvent:new( ), EnvironmentEvent:new( ) };

-- Sala 1
Env[1].envId = 1;
Env[1]:setName("Gargula's, sala 1");
Env[1].from.x = 1367;
Env[1].from.y = 3544;
Env[1].to.x = 1387;
Env[1].to.y = 3564;
Env[1].center.x = 1377;
Env[1].center.y = 3554;
Env[1]:addRespawn( "Gargula's", 112 , 1377,3554 );
-- Sala 2
Env[2].envId = 2;
Env[2]:setName("Golem's de Fogo, sala 2");
Env[2].from.x = 1331;
Env[2].from.y = 3544;
Env[2].to.x = 1351;
Env[2].to.y = 3564;
Env[2].center.x = 1341;
Env[2].center.y = 3554;
Env[2]:addRespawn( "Golem's de Fogo", 113 , 1341,3554 );
-- Sala 3
Env[3].envId = 3;
Env[3]:setName("Cavaleiro's Negro's, sala 3");
Env[3].from.x = 1295;
Env[3].from.y = 3544;
Env[3].to.x = 1315;
Env[3].to.y = 3564;
Env[3].center.x = 1305;
Env[3].center.y = 3554;
Env[3]:addRespawn( "Cavaleiro's Negro's", 114 , 1305,3554 );
-- Sala 4
Env[4].envId = 4;
Env[4]:setName("Drag�es Lich's, sala 4");
Env[4].from.x = 1295;
Env[4].from.y = 3508;
Env[4].to.x = 1315;
Env[4].to.y = 3528;
Env[4].center.x = 1305;
Env[4].center.y = 3518;
Env[4]:addRespawn( "_Drag�es Lich's", 115 , 1305,3518 );
-- Sala 5
Env[5].envId = 5;
Env[5]:setName("Tauron's da Areia, sala 5");
Env[5].from.x = 1295;
Env[5].from.y = 3472;
Env[5].to.x = 1315;
Env[5].to.y = 3492;
Env[5].center.x = 1305;
Env[5].center.y = 3482;
Env[5]:addRespawn( "_Tauron's da Areia", 116 , 1305,3482 );
-- Sala 6
Env[6].envId = 6;
Env[6]:setName("Morlock's, sala 6");
Env[6].from.x = 1331;
Env[6].from.y = 3472;
Env[6].to.x = 1351;
Env[6].to.y = 3492;
Env[6].center.x = 1341;
Env[6].center.y = 3482;
Env[6]:addRespawn( "_Morlock's", 117 , 1341,3482 );
-- Sala 7
Env[7].envId = 7;
Env[7]:setName("Anc.Ciclope's, sala 7");
Env[7].from.x = 1367;
Env[7].from.y = 3472;
Env[7].to.x = 1387;
Env[7].to.y = 3492;
Env[7].center.x = 1377;
Env[7].center.y = 3482;
Env[7]:addRespawn( "_Anc.Ciclope's", 118 , 1377,3482 );
-- Sala 8
Env[8].envId = 8;
Env[8]:setName("Verme's da Areia, sala 8");
Env[8].from.x = 1367;
Env[8].from.y = 3508;
Env[8].to.x = 1387;
Env[8].to.y = 3528;
Env[8].center.x = 1377;
Env[8].center.y = 3518;
Env[8]:addRespawn( "_Verme's da Areia", 119 , 1377,3518 );
-- Sala 9 Boss
Env[9].envId = 9;
Env[9]:setName("Boss, sala 9");
Env[9].from.x = 1331;
Env[9].from.y = 3508;
Env[9].to.x = 1351;
Env[9].to.y = 3528;
Env[9].center.x = 1341;
Env[9].center.y = 3518;
Env[9]:addRespawn( "Boss's 1", 120 , 1341,3518 );
Env[9]:addRespawn( "Boss's 2", 121 , 1341,3518 );
Env[9]:addRespawn( "Boss's 3", 122 , 1341,3518 );
Env[9]:addRespawn( "Boss's 4", 123 , 1341,3518 );

local bossID = 0;

function onExecute( this, envId )
	
	local checkPlayer = Env[envId]:checkPlayer( );
	local checkSpawn;
	
	if( envId ~= 9 ) then
		checkSpawn = Env[envId]:checkSpawn( -1 );
	else
		checkSpawn = Env[envId]:checkSpawn( bossID );
	end
	
	if( checkSpawn <= 0 ) then
		if ( envId ~= 9 and checkPlayer > 0 )then
			if(  Env[envId].owner ~= nil ) then
				iGameServer.PutItem(Env[envId].owner, EventItem[envId]);
			end
			Env[envId]:removeAllPlayer( ExitAguaPos );
			Env[envId].owner = nil;
			Env[envId]:stop( );
		else
			if( Env[envId]:getTime( ) < iGetCurrentTime( ) ) then
				Env[envId]:removeAllPlayer( ExitAguaPos );
				Env[envId].owner = nil;
				Env[envId]:stop( );
			else
				this:addTask( envId );
			end
		end
	elseif( Env[envId]:getTime( ) < iGetCurrentTime( ) ) then
		if ( checkPlayer > 0 )then
			Env[envId]:removeAllPlayer( ExitAguaPos );
		end
		Env[envId].owner = nil;
		Env[envId]:stop( );
	elseif( checkPlayer > 0 ) then
		this:addTask( envId );
	else
		Env[envId].owner = nil;
		Env[envId]:stop( );
	end	
end

function onAddPlayer( this, envId, player )
	
	if(	Env[envId]:checkPlayer( ) <= 0 ) then
		if( Env[envId]:addGroup( this, player, Env[envId].center ) ) then
			Env[envId]:setTime( iGetCurrentTime( )+EndAguaEventNSec );
			Env[envId]:sendTime( EndAguaEventSec, true );
			Env[envId]:start( );
			Env[envId].owner = player;	
			if( envId ~= 9 ) then
				Env[envId]:executeSpawn( -1 );
			else
				bossID = iRandomNumber(120,123);
				Env[envId]:executeSpawn( bossID );
			end
			this:addTask( envId );
			iSend.ClientMessage(player, "voc� esta participando do evento �gua(A) \""..Env[envId]:getName( ).."\"");
			return TRUE;
		end
		return FALSE;
	end
	iSend.ClientMessage(player, "este evento j� esta sendo realizado, aguarde.");
	return FALSE;
end

function onRemovePlayer( this, envId, player )
	
	if( Env[envId].owner ~= nil and Env[envId].owner == player ) then
		Env[envId].owner = nil;
	end
	
	if( Env[envId]:removePlayer( player, ExitAguaPos ) ) then
		return TRUE;
	end
	
	return FALSE;
end

