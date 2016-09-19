--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7b56ad9b59c16606c19bec76d38ca61c:101942c7e8c683aefb52551ec34adb63:f3d3895c121be139f940a27f9caadf69$
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
            -- balloon-01@2x
            x=1157,
            y=1,
            width=314,
            height=529,

        },
        {
            -- balloon-02@2x
            x=579,
            y=1,
            width=576,
            height=783,

        },
        {
            -- balloon-03@2x
            x=1,
            y=1,
            width=576,
            height=861,

        },
    },
    
    sheetContentWidth = 1472,
    sheetContentHeight = 863
}

SheetInfo.frameIndex =
{

    ["balloon-01@2x"] = 1,
    ["balloon-02@2x"] = 2,
    ["balloon-03@2x"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
