--
-- Author: Your Name
-- Date: 2015-12-13 16:20:50
--
local DataControl = import("..controllers.DataController")


local LevelScene = class("LevelScene", function()
    return display.newScene("LevelScene")
end)


function LevelScene:ctor()

	self:LoadUI()

end

function LevelScene:LoadUI()

	local uiNode = cc.uiloader:load("LevelScene/LevelScene.csb")
    self:addChild(uiNode)

end

return LevelScene