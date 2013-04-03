//
//  NodeSprite.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObjectSprite.h"

@class NodeModel;
@interface NodeSprite : GameObjectSprite {
    NodeModel *model;
}

@property (nonatomic, retain) NodeModel *model;

@end
