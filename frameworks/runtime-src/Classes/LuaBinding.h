#ifndef _LUABINDING_H_
#define	_LUABINDING_H_	

#include "cocos2d.h"
#include "Sprite3DEffect.h"
USING_NS_CC;

class LuaBinding : public cocos2d::Ref
{

public:
	LuaBinding();
	~LuaBinding();

	CREATE_FUNC(LuaBinding);


public:

	static Sprite3D* spriteEffect(const std::string &objFilePath, const std::string &textureFilePath, float width, Color3B color);
	bool init();


};

#endif	//_TESTLUABINDING_H_