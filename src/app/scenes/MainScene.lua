
local DataControl = import("..controllers.DataController")


local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

--初始化函数
function MainScene:ctor()

    DataControl.LoadData()
    self:LoadUI()

    cc.ui.UILabel.new({
            UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy*1.65)
        :addTo(self,1)   
    
    CustomControl:playMusic(MusicFile.Main_Music)
  
end

--设置ui相关函数
function MainScene:LoadUI()

    local uiNode = cc.uiloader:load("MainScene/MainScene.csb")
    self:addChild(uiNode)

    local background = uiNode:getChildByName("BackGround")
    CustomControl:SetPos(background)

    --获取cocos节点文件
    local startbtn = uiNode:getChildByName("Button_Start")
    local setbtn = uiNode:getChildByName("Button_Setting")
    local exitbtn = uiNode:getChildByName("Button_Exit")

    self:addClickEvent(startbtn,"startbtn")
    self:addClickEvent(setbtn,"setbtn")
    self:addClickEvent(exitbtn,"exitbtn")

    CustomControl:SetPos(startbtn)
    CustomControl:SetPos(setbtn)
    CustomControl:SetPos(exitbtn)
    

end

--加入点击事件处理
function MainScene:addClickEvent(UINode, ButtonType)

    UINode:addTouchEventListener(function(sender,event)          
            --print("event="..event)
            --event是触摸类型，0,1,2,3分别是began，moved，ended，canceled

            if event == 0 then
                CustomControl:playEffect(EffectFile.ButtonClickStart)
                return true
            --elseif event == 1 then
            elseif event == 2 then

                if ButtonType == "startbtn" then
                    app:enterScene("LevelScene", nil, "flipy")

                elseif ButtonType == "setbtn" then
                    DataControl.setMusicValue()

                elseif ButtonType == "exitbtn" then
                    cc.Director:getInstance():endToLua()

                end
                
            elseif event ==3 then 
                CustomControl:playEffect(EffectFile.ButtonClickCancel)
            end        
        end)

end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
