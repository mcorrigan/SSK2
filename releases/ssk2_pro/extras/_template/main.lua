-- =============================================================
-- Copyright Roaming Gamer, LLC. 2008-2017 (All Rights Reserved)
-- =============================================================
--  main.lua
-- =============================================================
-- Start (code/comments)
-- =============================================================
io.output():setvbuf("no")
display.setStatusBar(display.HiddenStatusBar)
-- =============================================================
-- LOAD & INITIALIZE - SSK 2
-- =============================================================
require "ssk2.loadSSK"
_G.ssk.init( { launchArgs 				= ..., 
	            enableAutoListeners 	= true,
	            exportCore 				= true,
	            exportColors 			= true,
	            exportSystem 			= true,
	            measure					= false,
	            useExternal				= true,
	            gameFont 				= native.systemFont,
	            debugLevel 				= 0 } )
-- =============================================================
-- Optionally enable meters to check FPS and Memory usage.
-- =============================================================
--ssk.meters.create_fps(true)
--ssk.meters.create_mem(true)
-- =============================================================
--local common 		= require "scripts.common"
--local game 			= require "scripts.game"
--

--
-- Initialize Sound
--
--[[
local soundMgr		= ssk.soundMgr
if( soundMgr ) then
	soundMgr.setDebugLevel(1)
	soundMgr.enableSFX(true)
	soundMgr.enableMusic(false)
	soundMgr.setVolume( 0.5, "music" )
	soundMgr.addEffect( "coin", "sounds/sfx/coin.wav")
	soundMgr.addEffect( "gate", "sounds/sfx/gate.wav")
	soundMgr.addEffect( "died", "sounds/sfx/died.wav")
	soundMgr.addMusic( "soundTrack", "sounds/music/Kick Shock.mp3")
end
--]]

--
-- Register Factories
--
--[[
local factoryMgr 	= ssk.factoryMgr
factoryMgr.register( "player", "scripts.factories.player" )
factoryMgr.register( "platform", "scripts.factories.platform" )
factoryMgr.register( "distanceHUD", "scripts.factories.distanceHUD" )
factoryMgr.register( "factoryMgr", "scripts.factories.factoryMgr" )
factoryMgr.register( "scoreHUD", "scripts.factories.scoreHUD" )
--]]

--
-- Initialize Game & Start
--
--game.init()
--game.start( nil, { debugEn = true } )

