--
-- Author: Your Name
-- Date: 2015-12-13 16:21:03
--

local GameScene = class("GameScene", function()
    return display.newPhysicsScene("GameScene")
end)

local material = cc.PHYSICSBODY_MATERIAL_DEFAULT

function GameScene:ctor()

    self:getPhysicsWorld():setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL) 
    self:getPhysicsWorld():setGravity(cc.p(0, 0))

    self:LoadUI()


    local TestLua = LuaBinding:spriteEffect("models3D/coconut.c3b","models3D/coco.png", 0.025, display.COLOR_BLACK)
    --local TestLua = cc.Sprite3D:create("3dModel/coconut.c3b","3dModel/coco.png"):addTo(self)
    
    TestLua:setRotation3D({x=90,y=180,z=180})
    TestLua:setScale(0.4)
    local actiontable = {x=0,y=360,z=0}

    local TestNode = display.newNode():addTo(self)
    TestNode:setPosition(display.width/2,display.height/2)
    TestNode:addChild(TestLua)

    --TestLua:runAction(cc.RepeatForever:create(cc.RotateBy:create(1,actiontable)))

    listenner = cc.EventListenerTouchOneByOne:create()
    listenner:setSwallowTouches(true)
    listenner:registerScriptHandler(function(touch, event)    
        return true
    end,cc.Handler.EVENT_TOUCH_BEGAN )

    listenner:registerScriptHandler(function(touch, event)

    local Nowpos = cc.p(TestNode:getPosition())
    local Expos = touch:getDelta()
    local pos = cc.pAdd(Expos,Nowpos)

    


    local PlayerRota3D = Expos.x
    --release_print(Expos.x)

    local NowRota3D = TestLua :getRotation3D()
    TestLua :setRotation3D({x=NowRota3D.x,y=NowRota3D.y-Expos.x,z=NowRota3D.z})

    local x = 0
    if pos.x>display.width then
        x = display.width
    elseif pos.x<0 then
        x = 0
    else
        x = pos.x
    end

    local y = 0
    if pos.y>display.height then
        y = display.height
    elseif pos.y<0 then
        y = 0
    else
        y = pos.y
    end  

    TestNode:setPosition(cc.p(x,y))

    end,cc.Handler.EVENT_TOUCH_MOVED )

    listenner:registerScriptHandler(function(touch, event)       
        end,cc.Handler.EVENT_TOUCH_ENDED )

    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listenner, self)

    local TestBody = cc.PhysicsBody:createEdgeBox(display.size, material, 5)
    local Nodebox = display.newNode():addTo(self)
        Nodebox :setPosition(display.width/2, display.height/2)
        Nodebox :setPhysicsBody(TestBody)

    local PlayerBody = cc.PhysicsBody:createBox(cc.size(10,10), material) 
    TestNode:setPhysicsBody(PlayerBody)  
       


end

function GameScene:LoadUI()

    local uiNode = cc.uiloader:load("GameScene/GameScene.csb")
    self:addChild(uiNode)

    local background = uiNode:getChildByName("Sprite_Back")
    local backbtn = uiNode:getChildByName("Button_Back")

    CustomControl:SetPos(background)
    CustomControl:SetPos(backbtn)

    backbtn:addTouchEventListener(function(sender,event)          
            --print("event="..event)
            --event是触摸类型，0,1,2,3分别是began，moved，ended，canceled
            
            if event == 0 then
                return true
            --elseif event == 1 then
            elseif event == 2 then
                app:enterScene("MainScene", nil, "flipy")
            --elseif event ==3 then              
            end        
        end)
end

function GameScene:onEnter()
end

function GameScene:onExit()
end

return GameScene