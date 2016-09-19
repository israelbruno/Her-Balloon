local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    local lanes = {}

    local background = display.newImageRect(sceneGroup, "images/menu.png", 1920, 1080)
        background.x = display.contentCenterX
        background.y = display.contentCenterY  
   
    local function handleButtonEvent( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene("level1", "slideLeft")
        end
    end

    local btn_startPlaying = widget.newButton {
        width = 490,
        height = 250,
        defaultFile = "images/btn-play.png",
        overFile = "images/btn-play-over.png",
        onEvent = handleButtonEvent
    }
    btn_startPlaying.x = display.contentCenterX
    btn_startPlaying.y = display.contentCenterY + 250
    sceneGroup:insert(btn_startPlaying)

end

-- "scene:show()"
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


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then

    end
end

-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene