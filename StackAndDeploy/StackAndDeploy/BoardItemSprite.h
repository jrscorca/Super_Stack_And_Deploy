//
//  BoardItemSprite.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameObjectSprite.h"
#import "cocos2d.h"

@class BoardItemModel;
@interface BoardItemSprite : GameObjectSprite {
   BoardItemModel* model;
}

@property (nonatomic, retain) BoardItemModel* model;

@end
