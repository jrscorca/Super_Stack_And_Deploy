//
//  BoardLayer.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BoardLayer.h"
#import "ShipLayer.h"

@implementation BoardLayer

@synthesize shipLayer;

- (id)init{
    if ((self = [super init])) {
        CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        // Add the sprite frames. This will load the texture as well
        [frameCache addSpriteFramesWithFile:@"SNDSpriteSheet_UntitledSheet.plist"];
        CCSpriteBatchNode *batchNode =  [CCSpriteBatchNode batchNodeWithFile:@"SNDSpriteSheet_UntitledSheet.png"];
        [self addChild:batchNode];
        
        CCSprite *background = [CCSprite spriteWithSpriteFrameName:@"spacebg"];
        background.scale = 8;
        background.rotation = 90;
        [batchNode addChild:background];
        
        self.shipLayer = [[[ShipLayer alloc] init] autorelease];
        [self addChild:self.shipLayer];
    }
    return self;
}


-(void) update:(ccTime) dt{
    [shipLayer update:dt];
}

@end
