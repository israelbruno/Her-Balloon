--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:b98cbb8aaba8865b61e4158e929b50cf:bea67eadedcb9843589d407cc6aee29d:f3d3895c121be139f940a27f9caadf69$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- 0001
            x=1077,
            y=1,
            width=532,
            height=565,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 565
        },
        {
            -- 0002
            x=1,
            y=568,
            width=536,
            height=561,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 565
        },
        {
            -- 0003
            x=1,
            y=1,
            width=536,
            height=565,

        },
        {
            -- 0004
            x=539,
            y=568,
            width=536,
            height=561,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 565
        },
        {
            -- 0005
            x=1077,
            y=568,
            width=532,
            height=565,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 565
        },
        {
            -- 0006
            x=539,
            y=1131,
            width=532,
            height=565,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 565
        },
        {
            -- 0007
            x=1,
            y=1131,
            width=536,
            height=561,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 565
        },
        {
            -- 0008
            x=539,
            y=1,
            width=536,
            height=565,

        },
        {
            -- 0009
            x=1073,
            y=1135,
            width=536,
            height=561,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 536,
            sourceHeight = 565
        },
    },
    
    sheetContentWidth = 1610,
    sheetContentHeight = 1697
}

SheetInfo.frameIndex =
{

    ["0001"] = 1,
    ["0002"] = 2,
    ["0003"] = 3,
    ["0004"] = 4,
    ["0005"] = 5,
    ["0006"] = 6,
    ["0007"] = 7,
    ["0008"] = 8,
    ["0009"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
