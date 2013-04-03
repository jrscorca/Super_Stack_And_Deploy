//
//  NodeLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "NodeLayer.h"
#import "NodeSprite.h" 
#import "NodeModel.h"

@implementation NodeLayer

- (id)init{
    if ((self = [super init])) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        NodeSprite *node = [[[NodeSprite alloc] init] autorelease];
        node.model.ownership = NO_PLAYER;
        node.position = ccp(BOARD_SIZE.width/2, BOARD_SIZE.height/2);
        [self addChild:node];
    }
    return self;
}


-(void) update:(ccTime) dt{
}

@end
