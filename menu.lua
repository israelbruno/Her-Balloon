-------------------------------------------------------------------------------
-- Inicializar composer
--------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

--------------------------------------------------------------------------------
-- Declarar/Inicializar variáveis/funções
--------------------------------------------------------------------------------

local carregarSubMenu = {}

--------------------------------------------------------------------------------
-- Inicia a cena aqui
--------------------------------------------------------------------------------

function scene:create( event )

    local sceneGroup = self.view

    local background = display.newImageRect(sceneGroup, "images/menu.png", 1920, 1080)
        background.x = display.contentCenterX
        background.y = display.contentCenterY  

    local btn_startPlaying = widget.newButton {
        width = 345,
        height = 174,
        defaultFile = "images/btn-play.png",
        overFile = "images/btn-play-over.png",
        onEvent = handleButtonEvent
    }
    btn_startPlaying.x = display.contentCenterX
    btn_startPlaying.y = display.contentCenterY + 140
    sceneGroup:insert(btn_startPlaying)

    local btn_credits = widget.newButton {
        width = 345,
        height = 133,
        defaultFile = "images/btn-credits.png",
        overFile = "images/btn-credits-over.png",
        onEvent = handleButtonCredits
    }

    btn_credits.x = display.contentCenterX
    btn_credits.y = display.contentCenterY + 325
    sceneGroup:insert(btn_credits)


    local somMenu = audio.loadStream( "sounds/Avocado_Street.ogg" )
        audio.play(somMenu, {loops = -1, channel = 1, fadein=1000})
        audio.setVolume( 0.50 , { channel=1 })

end

--------------------------------------------------------------------------------
-- "scene:show()"
--------------------------------------------------------------------------------

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        
    elseif ( phase == "did" ) then

        local prevScene = composer.getSceneName( "previous" )
        if(prevScene) then 
            composer.removeScene(prevScene)
        end
    end
end

--------------------------------------------------------------------------------
-- "scene:hide()"
--------------------------------------------------------------------------------

function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then

    end
end

--------------------------------------------------------------------------------
-- "scene:destroy()"
--------------------------------------------------------------------------------

function scene:destroy( event )

  audio.stop(1)

end

--------------------------------------------------------------------------------
-- Configuração de transição entre cenas
--------------------------------------------------------------------------------
local configTransicaoSubMenu = {
    effect = "fade", time = 1000
}

--------------------------------------------------------------------------------
-- Submenu do jogo
--------------------------------------------------------------------------------
function handleButtonEvent( event )

    local HereWeGoSound = audio.loadSound( "sounds/Here_We_Go.ogg" ) 
        local playLHereWeGo = audio.play( HereWeGoSound, {loops = 0, channel = 2} )


    if ( "ended" == event.phase ) then
        composer.removeScene("menu")
        composer.gotoScene("level1", configTransicaoSubMenu)
    end

end

--------------------------------------------------------------------------------
-- Creditos do Jogo
--------------------------------------------------------------------------------
function handleButtonCredits( event )

    if ( "ended" == event.phase ) then
        composer.removeScene("menu")
        composer.gotoScene("credits", configTransicaoSubMenu)
    end

end

--------------------------------------------------------------------------------
-- Listener Setup
--------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene