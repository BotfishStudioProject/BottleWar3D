--
-- Author: Your Name
-- Date: 2015-12-13 16:20:50
--

local LevelScene = class("LevelScene", function()
    return display.newScene("LevelScene")
end)


function LevelScene:ctor()

	self:LoadUI()

end

function LevelScene:LoadUI()

	local uiNode = cc.uiloader:load("LevelScene/LevelScene.csb")
    self:addChild(uiNode)

    local background = uiNode:getChildByName("Sprite_Back")
    CustomControl:SetPos(background)

    local buttonback = uiNode:getChildByName("Button_Back")
    CustomControl:SetPos(buttonback)
    self:addClickEvent(buttonback, "buttonback")

    local pageview = uiNode:getChildByName("PageView_Level")
    CustomControl:SetPagePos(pageview)


    for i=1, 3 do

       local panelNode = pageview:getChildByName("Panel_" .. tostring(i) .. "")

       for j=1, 9 do   

          local buttonlevel =panelNode:getChildByName(string.format("Button_Level%d0%d", i,j))
          local levelNum = i*100+j
          self:addClickEvent(buttonlevel, "buttonlevel", levelNum)

       end

    end


end

--加入点击事件处理
function LevelScene:addClickEvent(UINode, ButtonType, LevelNum)

	UINode:addTouchEventListener(function(sender,event)          
            --print("event="..event)
            --event是触摸类型，0,1,2,3分别是began，moved，ended，canceled

            if event == 0 then
                CustomControl:playEffect(EffectFile.ButtonClickStart)
                return true

            --elseif event == 1 then
            elseif event == 2 then

                if ButtonType == "buttonback" then
                    app:enterScene("MainScene", nil, "flipy")

                elseif ButtonType == "buttonlevel" then
                	LevelValue = LevelNum
                	--release_print("chooselevel--------" .. tostring(LevelValue) .. "")
                    app:enterScene("GameScene", nil, "flipy")

                end
                
            elseif event ==3 then 
                CustomControl:playEffect(EffectFile.ButtonClickCancel)

            end        
        end)


end

return LevelScene