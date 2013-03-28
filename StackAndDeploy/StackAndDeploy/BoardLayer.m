//
//  BoardLayer.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BoardLayer.h"


@implementation BoardLayer



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
        
    
        
    }
    return self;
}


-(void) update:(ccTime) dt{
    
}

@end
