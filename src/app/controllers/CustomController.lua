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

function CustomController:playMusic(FilePath) 
  
   if GameSet.MusicValue then        
      audio.playMusic(FilePath, true)        
   end
     
end

return CustomController