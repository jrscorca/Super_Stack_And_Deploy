//
//  BaseSprite.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObjectSprite.h"

@class BaseModel;
@interface BaseSprite : GameObjectSprite {
    BaseModel *model;
}

@property (nonatomic, retain) BaseModel *model;

@end
