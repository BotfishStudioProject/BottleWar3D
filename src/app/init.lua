--
-- Author: Your Name
-- Date: 2015-12-14 03:11:21
--
CustomControl = require("app.controllers.CustomController")


-------------游戏设置相关数据--------------------
---------------------------------------------
 LevelValue = nil
 
 GameSet = {
     FirstGameValue = true,
	 FirstGameKey = "First_Key",
	 MusicValue = true,
	 MusicKey  = "Music_Key",
     EffectValue = true,
     EffectKey = "Effect_Key"	

 }

----------------------------------------------
-----------------------------------------------

------------音乐音效设置相关数据-----------------
----------------------------------------------

 MusicFile = {
	 Main_Music = "Music/Star_Chaser.mp3",
	 Boss_Music = "Music/Orbital Colossus_0.mp3"
	 
}

EffectFile = {
     ButtonClickStart = "EffectSound/explodeEffect.mp3",
     ButtonClickCancel = "EffectSound/explodeEffect.mp3",
     
	 Boom_Effect = "EffectSound/boom.mp3",
	 Boom2_Effect = "EffectSound/boom2.mp3",
	 Hit_Effect = "EffectSound/hit.mp3",
	 Explode_Effect = "EffectSound/explodeEffect.mp3"

}


-----------------------------------------------
--------------------------------------------------