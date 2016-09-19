local composer = require( "composer" )

local physics = require("physics")
physics.start( )
physics.setGravity( 0.1, 8 )
--physics.setDrawMode( "hybrid" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local centroTelaX = display.contentCenterX
local centroTelaY = display.contentCenterY
local largura_da_tela = display.contentWidth
local altura_da_tela = display.contentHeight
local deslocamentoHorizontal = 0
local baloon, bg_chicago1, bg_chicago2
local deslocamento_horizontal = -5
local deslocamento_balloon = 0

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local function altera_deslocamento_balloon( event )
    local touchLocal = event.y

    if (event.phase == "began") then
        if (touchLocal > balloon.y) then
            deslocamento_balloon = 5
        elseif (touchLocal < balloon.y) then
            deslocamento_balloon = -5
        end
    elseif (event.phase == "ended") then
        deslocamento_balloon = 0
    end
end

local function aplica_forca_linear( event )
    local target = event.target
    local phase = event.phase
    local impulso_x
    
    if (event.x > balloon.x) then
            impulso_x = -1
        else
            impulso_x = 1
        end

        balloon:applyLinearImpulse( impulso_x, -50, balloon.y, balloon.y )
        --balloon:applyForce( 0, -100 )
end

local function move_bg_chicago( event )
    bg_chicago1.x = bg_chicago1.x + deslocamento_horizontal
    bg_chicago2.x = bg_chicago2.x + deslocamento_horizontal

    if (bg_chicago1.x + centroTelaX + 50) < display.contentWidth - display.contentWidth
        then
            bg_chicago1:translate(largura_da_tela + largura_da_tela + 80, 0)
    end
    if (bg_chicago2.x + centroTelaX + 50 ) < display.contentWidth - display.contentWidth -5
        then
            bg_chicago2:translate(largura_da_tela + largura_da_tela + 80, 0)
    end
end

local function move_balloon( event )
    balloon.y = balloon.y + deslocamento_balloon
end

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    bg_chicago1 = display.newImage( "images/bg_chicago.jpg" )
        bg_chicago1.x = centroTelaX
        bg_chicago1.y = centroTelaY
    bg_chicago2 = display.newImage( "images/bg_chicago.jpg" )
        bg_chicago2.x = bg_chicago1.x + largura_da_tela + 80
        bg_chicago2.y = centroTelaY

    balloon = display.newImageRect( "images/balloon.png", 914*.25, 976*.25 )
        balloon.x = largura_da_tela - largura_da_tela + balloon.contentWidth
        balloon.y = centroTelaY
end

-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        physics.addBody( balloon, "dynamic", {density = .2} )
        balloon.isFixedRotation = true

        Runtime:addEventListener( "enterFrame", move_bg_chicago )
        Runtime:addEventListener( "touch", altera_deslocamento_balloon )
        Runtime:addEventListener( "enterFrame", move_balloon )
        balloon:addEventListener( "tap", aplica_forca_linear )
    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        
    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end





-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene