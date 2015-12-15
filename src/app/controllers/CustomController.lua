--
-- Author: Your Name
-- Date: 2015-12-13 18:06:18
--
local CustomController = {}

function CustomController:SetPos(UIChildNode, zorder)
	-- body
	local realpos = cc.p(UIChildNode:getPosition())
	local setpos = cc.p(display.width*realpos.x/640,display.height*realpos.y/960)

	UIChildNode:setPosition(setpos)

	if zorder then	
		UIChildNode:setGlobalZOrder(zorder)
	end
end

function CustomController:SetPagePos(UIChildNode, zorder)
	-- body
	local pagescale

	if display.width<640 then
		pagescale = display.width/640

	elseif display.height<960 then
		pagescale = display.height/960

	else
        pagescale = 1.0
	end

	local pagesize = UIChildNode:getContentSize()
	local nowpos = cc.p(UIChildNode:getPosition())

	local realpos = cc.p(nowpos.x+pagesize.width/2,nowpos.y+pagesize.height/2)
	local movepos = cc.p(display.width*realpos.x/640,display.height*realpos.y/960)

	local setpos = cc.p(movepos.x-pagesize.width*pagescale/2,movepos.y-pagesize.height*pagescale/2)

	UIChildNode:setPosition(setpos)
	UIChildNode:setScale(pagescale)

	if zorder then	
		UIChildNode:setGlobalZOrder(zorder)
	end

end

function CustomController:playMusic(FilePath) 
  
   if GameSet.MusicValue then        
      audio.playMusic(FilePath, true)        
   end
     
end

function CustomController:playEffect(FilePath) 
  
   if GameSet.EffectValue then        
      audio.playSound(FilePath, false)        
   end
     
end

return CustomController