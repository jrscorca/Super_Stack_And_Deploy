//
//  BoardLayer.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BoardLayer.h"
#import "ShipLayer.h"
#import "NodeLayer.h"
#import "BaseLayer.h" 

@implementation BoardLayer

@synthesize shipLayer, baseLayer, nodeLayer;

- (id)init{
    if ((self = [super init])) {
    /*    CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        // Add the sprite frames. This will load the texture as well
        [frameCache addSpriteFramesWithFile:@"SNDSpriteSheet_UntitledSheet.plist"];
        CCSpriteBatchNode *batchNode =  [CCSpriteBatchNode batchNodeWithFile:@"SNDSpriteSheet_UntitledSheet.png"];
        [self addChild:batchNode];
        
        CCSprite *background = [CCSprite spriteWithSpriteFrameName:@"spacebg"];
        background.color =  ccRED;
        
        background.scale = 16;
        background.rotation = 90;
        [batchNode addChild:background];
     
     */
        CCSprite *background = [CCSprite spriteWithFile:@"Icon-Small.png"];
        background.scale = 32;
        background.opacity = 100;
        background.position = ccp(512,512);
        [self addChild:background];
        
        self.baseLayer = [[[BaseLayer alloc] init] autorelease];
        [self addChild:self.baseLayer];
        
        self.nodeLayer = [[[NodeLayer alloc] init] autorelease];
        [self addChild:self.nodeLayer];
        
        self.shipLayer = [[[ShipLayer alloc] init] autorelease];
        [self addChild:self.shipLayer];
    }
    return self;
}

-(void) dealloc{
    [shipLayer release];
    [nodeLayer release];
    [baseLayer release];
    [super dealloc];
}

-(void) update:(ccTime) dt{
    [nodeLayer update:dt];
    [baseLayer update:dt];
    [shipLayer update:dt];
}


@end
