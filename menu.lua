local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local utility = require( "utility" )
local ads = require( "ads" )

local params

local myData = require( "mydata" )

local function handlePlayButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "levelselect", false )
        composer.gotoScene("levelselect", { effect = "crossFade", time = 333 })
    end
end

local function handleHelpButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.gotoScene("help", { effect = "crossFade", time = 333, isModal = true })
    end
end

local function handleCreditsButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene("gamecredits", { effect = "crossFade", time = 333 })
    end
end

local function handleSettingsButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene("gamesettings", { effect = "crossFade", time = 333 })
    end
end

--
-- Start the composer event handlers
--

function scene:create( event )
    local sceneGroup = self.view

    params = event.params
        
    --
    -- setup a page background, really not that important though composer
    -- crashes out if there isn't a display object in the view.
    --
    
    local background = display.newImageRect(sceneGroup, "images/menu.png", 1920, 1080 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert( background )

    -- Play Button
    
    local playButton = widget.newButton({
        id = "button1",
        width = 345,
        height = 174,
        defaultFile = "images/btn-play.png",
        overFile = "images/btn-play-over.png",
        onEvent = handlePlayButtonEvent
    })
    playButton.x = display.contentCenterX
    playButton.y = display.contentCenterY + 120
    sceneGroup:insert( playButton )

    -- Settings Button
    
    local settingsButton = widget.newButton({
        id = "button2",
        width = 110,
        height = 110,
        defaultFile = "images/btn-settings.png",
        overFile = "images/btn-settings-over.png",
        onEvent = handleSettingsButtonEvent
    })
    settingsButton.x = display.contentCenterX - 70
    settingsButton.y = display.contentCenterY + 420
    sceneGroup:insert( settingsButton )

    -- History Button
    
    local helpButton = widget.newButton({
        id = "button3",
        width = 260,
        height = 100,
        defaultFile = "images/btn-history.png",
        overFile = "images/btn-history-over.png",
        onEvent = handleHelpButtonEvent
    })
    helpButton.x = display.contentCenterX
    helpButton.y = display.contentCenterY + 270
    sceneGroup:insert( helpButton )

    -- Credits Button
    
    local creditsButton = widget.newButton({
        id = "button4",
        width = 110,
        height = 110,
        defaultFile = "images/btn-credits.png",
        overFile = "images/btn-credits-over.png",
        onEvent = handleCreditsButtonEvent
    })
    creditsButton.x = display.contentCenterX + 90
    creditsButton.y = display.contentCenterY + 420
    sceneGroup:insert( creditsButton )


    -- Background Music
    
    local backgroundMusic = audio.loadStream( "sounds/Avocado_Street.ogg" )
    local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=5000 } )

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params
    utility.print_r(event)

    if params then
        print(params.someKey)
        print(params.someOtherKey)
    end

    if event.phase == "did" then
        composer.removeScene( "game" ) 
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    
    if event.phase == "will" then
    end

end

function scene:destroy( event )
    local sceneGroup = self.view
    
    audio.stop( backgroundMusicChannel )
    
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene