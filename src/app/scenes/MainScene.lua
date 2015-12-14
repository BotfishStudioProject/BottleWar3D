
local DataControl = import("..controllers.DataController")


local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)


function MainScene:ctor()

    DataControl.LoadData()
    self:LoadUI()

    cc.ui.UILabel.new({
            UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy*1.65)
        :addTo(self,1)   
    
    CustomControl:playMusic(MusicFile.Main_Music)
  
end

function MainScene:LoadUI()

    local uiNode = cc.uiloader:load("MainScene/MainScene.csb")
    self:addChild(uiNode)

    local background = uiNode:getChildByName("BackGround")
    local startbtn = uiNode:getChildByName("Button_Start")
    local setbtn = uiNode:getChildByName("Button_Setting")
    local exitbtn = uiNode:getChildByName("Button_Exit")

    CustomControl:SetPos(background)
    CustomControl:SetPos(startbtn)
    CustomControl:SetPos(setbtn)
    CustomControl:SetPos(exitbtn)

    startbtn:addTouchEventListener(function(sender,event)          
            --print("event="..event)
            --event是触摸类型，0,1,2,3分别是began，moved，ended，canceled
            
            if event == 0 then
                return true
            --elseif event == 1 then
            elseif event == 2 then
                app:enterScene("LevelScene", nil, "flipy")
            --elseif event ==3 then              
            end        
        end)

    setbtn:addTouchEventListener(function(sender,event)          
            --print("event="..event)
            --event是触摸类型，0,1,2,3分别是began，moved，ended，canceled

            if event == 0 then
                return true
            --elseif event == 1 then
            elseif event == 2 then
                DataControl.setMusicValue()
            --elseif event ==3 then              
            end        
        end)

    exitbtn:addTouchEventListener(function(sender,event)          
            --print("event="..event)
            --event是触摸类型，0,1,2,3分别是began，moved，ended，canceled

            if event == 0 then
                return true
            --elseif event == 1 then
            elseif event == 2 then
                cc.Director:getInstance():endToLua()
            --elseif event ==3 then              
            end        
        end)


end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
