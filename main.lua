-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


-- Configuração de transição para menu

local configTransicaoMenu = {
	effect = "fade", time = 1200
}

display.setStatusBar( display.HiddenStatusBar )

local composer = require( "composer" )
composer.gotoScene("menu", configTransicaoMenu)