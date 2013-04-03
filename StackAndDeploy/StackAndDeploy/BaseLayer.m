//
//  BaseLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseLayer.h"
#import "BaseSprite.h"
#import "BaseModel.h"
@implementation BaseLayer

- (id)init{
    if ((self = [super init])) {

        BaseSprite *base = [[[BaseSprite alloc] init] autorelease];
        base.model.ownership = LOCAL_PLAYER;
        base.position = ccp(BOARD_SIZE.width/4, BOARD_SIZE.height/2);
        base.scale = 1.5;
        
        BaseSprite *base2 = [[[BaseSprite alloc] init] autorelease];
        base2.model.ownership = AWAY_PLAYER;
        base2.position = ccp((BOARD_SIZE.width*.9), BOARD_SIZE.height/2);
        base2.scale = 1.5;
        
        [self addChild:base];
        [self addChild:base2];
    }
    return self;
}

-(void) update:(ccTime) dt{
}

@end
