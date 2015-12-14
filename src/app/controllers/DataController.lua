--
-- Author: Your Name
-- Date: 2015-12-14 02:00:29
--
local DataController = class("DataController")

function DataController:LoadData()

    GameSet.FirstGameValue = cc.UserDefault:getInstance():getBoolForKey(GameSet.FirstGameKey)

    if GameSet.FirstGameValue then
        --读取存储数据
        GameSet.MusicValue =  cc.UserDefault:getInstance():getBoolForKey(GameSet.MusicKey)
        GameSet.EffectValue = cc.UserDefault:getInstance():getBoolForKey(GameSet.EffectKey)
    else
        --设置存储数据
        cc.UserDefault:getInstance():setBoolForKey(GameSet.FirstGameKey,true)
        cc.UserDefault:getInstance():setBoolForKey(GameSet.MusicKey,true)
        cc.UserDefault:getInstance():setBoolForKey(GameSet.EffectKey,true)
    end

end

function DataController:setMusicValue()
    if GameSet.MusicValue then
        GameSet.MusicValue = false
        audio.stopMusic()
        cc.UserDefault:getInstance():setBoolForKey(GameSet.MusicKey,GameSet.MusicValue)
    else
        GameSet.MusicValue = true        
        audio.playMusic(MusicFile.Main_Music, true)
        cc.UserDefault:getInstance():setBoolForKey(GameSet.MusicKey,GameSet.MusicValue)
    end
end

return DataController