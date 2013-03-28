//
//  PlayLAyer.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayLayer.h"
#import "HUDLayer.h"
#import "BoardLayer.h"

@implementation PlayLayer

+ (id)scene {
    CCScene *scene = [CCScene node];
    
    BoardLayer *bLayer = [[[BoardLayer alloc] init] autorelease];
    [scene addChild:bLayer];
    
    HUDLayer *hLayer = [[[HUDLayer alloc] init]autorelease];
    [scene addChild:hLayer];
    
    // 'layer' is an autorelease object.
	PlayLayer *layer = [PlayLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];

    return scene;
}


@end
