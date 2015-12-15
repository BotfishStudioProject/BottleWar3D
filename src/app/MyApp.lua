
require("config")
require("app.init")
require("cocos.init")
require("framework.init")


local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    self:enterScene("MainScene")
end

function MyApp:onEnterBackground()
    display.pause()
end

function MyApp:onEnterForeground()
    display.resume()
end

return MyApp
