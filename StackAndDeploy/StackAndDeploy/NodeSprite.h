//
//  NodeSprite.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BoardItemSprite.h"

@class NodeModel;
@interface NodeSprite : BoardItemSprite {
   // NodeModel *model;
}

//@property (nonatomic, retain) NodeModel *model;

-(void) playerCaptureNode:(playerType) player;

@end
